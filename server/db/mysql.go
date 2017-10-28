package db

import (
	"github.com/gocraft/dbr"
)

var (
	Conn, _ = dbr.Open("mysql", "root:@tcp(127.0.0.1:3306)/availee", nil)
	Sess = Conn.NewSession(nil)
)
