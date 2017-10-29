package controller

import (
	"../model"
	"../db"
	"fmt"
	"time"
	"net/http"
	"crypto/sha1"

	"github.com/gin-gonic/gin"
//	"github.com/gin-gonic/contrib/static"
//	"github.com/mattn/go-colorable"
	"github.com/olahol/go-imageupload"
)

func InsertUser(c *gin.Context) {
//	u := new(model.UsersJSON)
//	c.BindJSON(u)
	name := c.Param("name")

	/*
	file, _ := c.FormFile("file")
	fmt.Println(file.Filename)
  if err != nil {
      panic(err)
  }
	*/

  img, err := imageupload.Process(c.Request, "file")
  if err != nil {
      panic(err)
  }
  thumb, err := imageupload.ThumbnailPNG(img, 300, 300)
  if err != nil {
      panic(err)
  }
  h := sha1.Sum(thumb.Data)

	icon := fmt.Sprintf("files/%s_%x.png", time.Now().Format("20060102150405"), h[:4])
  thumb.Save(icon)

	db.Sess.InsertInto("users").Columns("name", "icon").Values(name, icon).Exec()

	c.Status(http.StatusNoContent)
}

func SearchUser(c *gin.Context) {
	u := new(model.UsersJSON)
	response_user := new(model.Users)
	c.BindJSON(u)

	db.Sess.Select("*").From("users").Where("name = ?", u.Name).Load(&response_user)

	c.JSON(http.StatusOK, response_user)
}

