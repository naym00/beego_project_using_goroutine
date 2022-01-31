<h1 align="center">Beego-Assignment - Golang(Beego)</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000" />
</p>
You can get cat's images from this project. There are 4 dropdown buttons, to get various kinds of cat images you have to search by selecting or combination of Order, Type, Category, Breed.
By default it will display random images and fields will be filled with Order: "Random", Type: "All", Category: "None", Breed: "None".
To get more images, you have to click More+ button.

## Languages used
- [x] Golang

## Framework used
- [x] Beego

## How I completed this project
- [x] First of all, I started learning the core-concepts and syntax of Golang from https://www.golangprograms.com/go-language.html and practised Golang on https://go.dev/play/
- [x] After completing the basics, I switched to Beego and read their official doucumentation from https://beego.vip/
- [x] Finally, I read The CAT API documentaion from https://docs.thecatapi.com/ to understand the API responses and started working on the project.

## Prerequisite
- [x] Install Golang
- [x] Install Beego

## How to Install Golang

#### step 1
- [x] Open your terminal and run the following command to make sure that you’re in the root directory.
```
cd ~
```

#### step 2
- [x] Then use curl to retrieve the tarball.
```
curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
```
> Note:: If curl is not installed in the system, please install it by the command below
```
sudo apt install curl
```

#### step 3
- [x] In this step, you will set paths in your environment. First of all, type the command below and press ENTER
```
sudo tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz
```

#### step 4
- [x] Next, use `tar` to extract the tarball. This command includes the `-C` flag which instructs tar to change to the given directory before performing any other operations
```
sudo nano ~/.profile
```

- [x] Then, add the following informations to the end of your profile:
```
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/yourpcname/go/bin
export GOPATH="/home/yourpcname/go/"
export GOBIN="/home/yourpcname/go/bin"
```

- [x] After you’ve added this information to your profile, save and close the file by pressing CTRL+X, then Y, and then ENTER.

#### step 5
- [x] After that type the follwing code and press ENTER
```
source ~/.profile
```

- [x] Finally, check the go version using following command
```
go version
```

## How to Install Beego and Create Project

#### step 1
- [x] Download and install beego By this command
```
go get -u github.com/beego/beego/v2
go get -u github.com/beego/bee/v2
```
> Note: Sometimes while installing beego this error can occur cgo: exec gcc: exec: "gcc": executable file not found in $PATH This error occurs if the gcc C compiler does not exist in the system. That's why we need to install C Compiler by following command and then run the previous commands.
```
sudo apt-get install build-essential
```


#### step 2
- [x] Create Beego MVC project by this command
```
bee new project_name
```

- [x] Create Beego API project by this command
```
bee api project_name
```

#### step 3
- [x] Init module
```
go mod tidy
```

## How to run this project
- [x] First of all, clone the project by running the following command
```
git clone https://github.com/naym00/Beego-Assignment.git
```

- [x] Then, open the cloned folder using `VS Code` and run the following command
```
bee run
```

- [x] Finally, open your browser and enter the following URL to check it out
```
http://localhost:8080
```

## Feedback
If you have any feedback, please reach out to me at nymur@w3engineers.com

## 🚀 About Me
My name is Md. Nymur Rahman and I'm an Intern Softwere Engineer of W3engineers Ltd....
