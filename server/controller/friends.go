package controller

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"../model"
	"../db"
)

func InsertFriend(c *gin.Context) {
	f := new(model.FriendsJSON)
	c.BindJSON(f)

	db.Sess.InsertInto("friends").Columns("follow_id", "follower_id").Values(f.FollowID, f.FollowerID).Exec()

	c.Status(http.StatusNoContent)
}
