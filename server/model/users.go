package model

import (
	_ "github.com/go-sql-driver/mysql"
)

type (
	Users struct {
		ID int `db:"id" json:"id"`
		Name string `db:"name" json:"name"`
		Icon string `db:"icon" json:"icon"`
	}

	UsersJSON struct {
		Name string `json:"name"`
		Icon string `json:"icon"`
	}
)
