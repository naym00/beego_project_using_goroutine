package main

import (
	_ "beego_project_using_goroutine/routers"
	beego "github.com/beego/beego/v2/server/web"
)

func main() {
	beego.Run()
}

