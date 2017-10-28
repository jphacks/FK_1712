package model

import (
	_ "github.com/go-sql-driver/mysql"
)

type (
	CalendarJSON struct {
		UserID int `json:"user_id"`
		FreeTime []FreeTime `json:"free_time"`
		FreeDate []FreeDate `json:"free_date"`
	}

	FreeTime struct {
		StartTime string `db:"start_time" json:"start_time"`
		EndTime string `db:"end_time" json:"end_time"`
	}

	FreeDate struct {
		StartDate string `db:"start_date" json:"start_date"`
		EndDate string `db:"end_date" json:"end_date"`
	}
)
