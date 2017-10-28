package main

import (
	"github.com/gin-gonic/gin"
	"./controller"
	"./db"
)

func main() {
	router := gin.Default()

	router.POST("/users", controller.InsertUser)

	router.Run(":8080")
}
