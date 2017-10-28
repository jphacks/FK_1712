package model

import (
	_ "github.com/go-sql-driver/mysql"
)

type (
	UsersJSON struct {
		Name string `json:"name"`
		Pass string `json:"pass"`
		Icon string `json:"icon"`
	}
)
