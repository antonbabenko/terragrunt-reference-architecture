package main

import (
	"github.com/aws/aws-lambda-go/lambda"
)

// Response is the generic lambda response
type Response struct {
	Message string `json:"message"`
}

func Handler() (Response, error) {
	return Response{
		Message: "Hello from Go!",
	}, nil
}

func main() {
	lambda.Start(Handler)
}
