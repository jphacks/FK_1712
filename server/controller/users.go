package controller

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"../model"
	"../db"
)

func InsertUser(c *gin.Context) {
	u := new(model.UsersJSON)
	c.BindJSON(u)

	db.Sess.InsertInto("users").Columns("name", "pass", "icon").Values(u.Name, u.Pass, u.Icon).Exec()

	c.Status(http.StatusNoContent)
}
