package controllers

import (
	"encoding/json"
	"io/ioutil"
	"net/http"
	"strings"
	"sync"

	beego "github.com/beego/beego/v2/server/web"
)

var wg sync.WaitGroup

type Category struct {
	CategoryName string
	CategoryID   int
}

var CategoryArray = []Category{{"boxes", 5}, {"clothes", 15}, {"hats", 1}, {"sinks", 14}, {"space", 2}, {"sunglasses", 4}, {"ties", 7}}

type CatController struct {
	beego.Controller
	Breeds []struct {
		BreedName string `json:"name"`
		BreedID   string `json:"id"`
	}
	Images []struct {
		URL string `json:"url"`
	}
}

func Fetch_data(url string, chnl chan string) {
	defer wg.Done()
	req, _ := http.NewRequest("GET", url, nil)
	req.Header.Add("x-api-key", "d2357231-df7a-4bdd-9ddc-6cdba1572920")
	res, _ := http.DefaultClient.Do(req)
	defer res.Body.Close()
	body, _ := ioutil.ReadAll(res.Body)
	chnl <- string(body)
}
func (c *CatController) Cat_data() {
	chnl1 := make(chan string)
	chnl2 := make(chan string)
	wg.Add(2)
	url := "https://api.thecatapi.com/v1/breeds?attach_breed=0"
	go Fetch_data(url, chnl1)
	json.Unmarshal([]byte(<-chnl1), &c.Breeds)
	url = "https://api.thecatapi.com/v1/images/search?limit=9"
	go Fetch_data(url, chnl2)
	json.Unmarshal([]byte(<-chnl2), &c.Images)
	wg.Wait()
	close(chnl1)
	close(chnl2)

	c.Data["title"] = "Cat Data"
	c.Data["css"] = "../../static/css/style.css"
	c.Data["category"] = &CategoryArray
	c.Data["breed"] = &c.Breeds
	c.Data["images"] = &c.Images
	c.TplName = "index.tpl"
}
func (c *CatController) FetchFromAPI() {
	chnl := make(chan string)
	wg.Add(1)

	order := c.GetString("order")
	mime_types := c.GetString("type")
	category := c.GetString("category")
	breed := c.GetString("breed")
	per_page := c.GetString("per_page")

	url := "https://api.thecatapi.com/v1/images/search?limit=" + per_page + "&order=" + strings.ToUpper(order)
	if mime_types == "Static" {
		url += "&mime_types=jpg,png"
	} else if mime_types == "Animated" {
		url += "&mime_types=gif"
	}
	if category != "None" {
		url += "&category_ids=" + category
	}
	if breed != "None" {
		url += "&breed_id=" + breed
	}
	go Fetch_data(url, chnl)
	json.Unmarshal([]byte(<-chnl), &c.Images)
	wg.Wait()
	close(chnl)

	c.Data["json"] = &c.Images
	c.ServeJSON()
}
