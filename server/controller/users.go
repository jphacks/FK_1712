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

	db.Sess.InsertInto("users").Columns("name", "icon").Values(u.Name, u.Icon).Exec()

	c.Status(http.StatusNoContent)
}

func SearchUser(c *gin.Context) {
	u := new(model.UsersJSON)
	response_user := new(model.Users)
	c.BindJSON(u)

	db.Sess.Select("*").From("users").Where("name = ?", u.Name).Load(&response_user)

	c.JSON(http.StatusOK, response_user)
}


