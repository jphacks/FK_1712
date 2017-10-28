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
	c.BindJSON(cal)

	for i, t := range cal.FreeTime {
		fmt.Sprintf("%d time\n", i)
		start_time, _ := time.Parse("2006-01-02 15:04:05 MST", t.StartTime)
		end_time, _ := time.Parse("2006-01-02 15:04:05 MST", t.EndTime)
		db.Sess.InsertInto("free_time").Columns("user_id", "start_time", "end_time").Values(cal.UserID, start_time, end_time).Exec()
	}

	for i, d := range cal.FreeDate {
		fmt.Sprintf("%d date\n", i)
		start_date, _ := time.Parse("2006-01-02", d.StartDate)
		end_date, _ := time.Parse("2006-01-02", d.EndDate)
		db.Sess.InsertInto("free_date").Columns("user_id", "start_date", "end_date").Values(cal.UserID, start_date, end_date).Exec()
	}

	c.JSON(http.StatusOK, cal)
}
