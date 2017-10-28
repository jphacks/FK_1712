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
		StartTime string `json:"start_time"`
		EndTime string `json:"end_time"`
	}

	FreeDate struct {
		StartDate string `json:"start_date"`
		EndDate string `json:"end_date"`
	}
)
