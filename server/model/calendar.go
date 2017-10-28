package model

import (
	_ "github.com/go-sql-driver/mysql"
	"time"
)

type (
	CalendarJSON struct {
		UserID int `json:"user_id"`
		FreeTime []FreeTime `json:"free_time"`
		FreeDate []FreeDate `json:"free_date"`
	}

	FreeTime struct {
		StartTime time.Time `json:"start_time"`
		EndTime time.Time `json:"end_time"`
	}

	FreeDate struct {
		StartDate time.Time `json:"start_date"`
		EndTime time.Time `json:"end_time"`
	}
)
