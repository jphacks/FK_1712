package model

import (
	_ "github.com/go-sql-driver/mysql"
)

type (
	FriendsJSON struct {
		FollowID int `db:"follow_id" json:"follow_id"`
		FollowerID int `db:"follower_id" json:"follower_id"`
	}

)
