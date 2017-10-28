package model

import (
	_ "github.com/go-sql-driver/mysql"
)

type (
	FriendsJSON struct {
		FollowID int `json:"follow_id"`
		FollowerID int `json:"follower_id"`
	}
)
