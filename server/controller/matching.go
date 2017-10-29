package controller

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"../model"
	"../db"
	"time"
	"fmt"
)

func FindMatching(c *gin.Context) {
	cal := new(model.CalendarJSON)
	mat := new(model.Matchings)
	free_t := new(model.FreeTime)
	free_d := new(model.FreeDate)
	var mats []model.Matchings
	var conn []model.FriendsJSON
	mats_res := new(model.ResponseMatchingsData)
	var start_time_cal time.Time
	var end_time_cal time.Time
	var start_date_cal time.Time
	var end_date_cal time.Time

	c.BindJSON(cal)

	res, err := db.Sess.DeleteFrom("free_time").Where("user_id = ?", cal.UserID).Exec()
	if err != nil {
		fmt.Println(err)
	}else{
		fmt.Println(res)
	}
	for _, t := range cal.FreeTime {
		db.Sess.InsertInto("free_time").Columns("user_id", "start_time", "end_time").Values(cal.UserID, t.StartTime, t.EndTime).Exec()
	}

	db.Sess.DeleteFrom("free_date").Where("user_id = ?", cal.UserID).Exec()
	for _, d := range cal.FreeDate {
		db.Sess.InsertInto("free_date").Columns("user_id", "start_date", "end_date").Values(cal.UserID, d.StartDate, d.EndDate).Exec()
	}

	db.Sess.Select("*").From("friends").Where("follow_id = ? OR follower_id = ?", cal.UserID, cal.UserID).Load(&conn)

	for _, t := range cal.FreeTime {
		start_time, _ := time.Parse("2006/01/02 15:04:05 MST", t.StartTime)
		end_time, _ := time.Parse("2006/01/02 15:04:05 MST", t.EndTime)
		for _, con := range conn {
			db.Sess.Select("*").From("free_time").Where("user_id = ?", con.FollowerID).Load(&free_t)
			start_time_tag, _ := time.Parse("2006/01/02 15:04:05 MST", free_t.StartTime)
			end_time_tag, _ := time.Parse("2006/01/02 15:04:05 MST", free_t.EndTime)
			if start_time.Sub(start_time_tag) < 0 {
				start_time_cal = start_time_tag
			}else{
				start_time_cal = start_time
			}
			if end_time.Sub(end_time_tag) < 0 {
				end_time_cal = end_time
			}else{
				end_time_cal = end_time_tag
			}

			if end_time_cal.Sub(start_time_cal) >= 3 * time.Hour {
				if cal.UserID != con.FollowerID {
					mat.UserID = con.FollowerID
				}else{
					mat.UserID = con.FollowID
				}
				mat.StartDate = start_time_cal
				mat.EndDate = end_time_cal
				mat.IsDate = false
				mats = append(mats, *mat)
			}
		}
  }

	for _, t := range cal.FreeDate {
		start_date, _ := time.Parse("2006/01/02", t.StartDate)
		end_date_pre, _ := time.Parse("2006/01/02", t.EndDate)
		end_date := end_date_pre.Add(24 * time.Hour)
		for _, con := range conn {
			db.Sess.Select("*").From("free_date").Where("user_id = ?", con.FollowerID).Load(&free_d)
			start_date_tag, _ := time.Parse("2006/01/02", free_d.StartDate)
			end_date_tag_pre, _ := time.Parse("2006/01/02", free_d.EndDate)
			end_date_tag := end_date_tag_pre.Add(24 * time.Hour)

			if start_date.Sub(start_date_tag) < 0 {
				start_date_cal = start_date_tag
			}else{
				start_date_cal = start_date
			}
			if end_date.Sub(end_date_tag) < 0 {
				end_date_cal = end_date
			}else{
				end_date_cal = end_date_tag
			}

			if end_date_cal.Sub(start_date_cal) >= 24 * time.Hour {
				if cal.UserID != con.FollowerID {
					mat.UserID = con.FollowerID
				}else{
					mat.UserID = con.FollowID
				}
				mat.StartDate = start_date_cal
				mat.EndDate = end_date_cal.Add(-24 * time.Hour)
				mat.IsDate = true
				mats = append(mats, *mat)
			}
		}

		mats_res.Matchings = mats
  }

	c.JSON(http.StatusOK, mats_res)
}
