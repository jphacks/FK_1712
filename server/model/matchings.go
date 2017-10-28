package model

import (
	_ "github.com/go-sql-driver/mysql"
	"time"
)

type (
	MatchingsJSON struct {
		UserID int `json:"user_id"`
		StartDate time.Time `json:"start_date"`
		EndDate time.Time `json:"end_date"`
		IsDate bool `json:"is_date"`
	}
)

