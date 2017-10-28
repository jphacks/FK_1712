package main

import (
	"github.com/gin-gonic/gin"
	"./controller"
)

func main() {
	router := gin.Default()

	router.POST("/users", controller.InsertUser)
	router.POST("/friends", controller.InsertFriend)
	router.POST("/matching", controller.FindMatching)

	router.PUT("/users/search", controller.SearchUser)

	router.Run(":8080")
}
