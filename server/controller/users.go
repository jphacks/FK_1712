package controller

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"../model"
	"..db"
)

func InsertUser(c *gin.Context) {
	u := new(model.UsersJSON)
	c.BindJSON(u)


}
