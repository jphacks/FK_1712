package db

import (
	"github.com/gocraft/dbr"
)

var (
	Conn, _ = dbr.Open("mysql", "root@/availee", nil)
	Sess = Conn.NewSession(nil)
)
