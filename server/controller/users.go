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
	u := new(model.UsersJSON)
	c.BindJSON(u)

  img, err := imageupload.Process(c.Request, "file")
  if err != nil {
      panic(err)
  }
  thumb, err := imageupload.ThumbnailPNG(img, 300, 300)
  if err != nil {
      panic(err)
  }
  h := sha1.Sum(thumb.Data)
  thumb.Save(fmt.Sprintf("files/%s_%x.png", time.Now().Format("20060102150405"), h[:4]))

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

