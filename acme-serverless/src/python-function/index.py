import json


def lambda_handler(event, context):
    body = "Hello from serverless.tf!"
    body += json.dumps(event)
    body += json.dumps(context)

    r = {
        "isBase64Encoded": False,
        "statusCode": 200,
        "statusDescription": "200 OK",
        "headers": {
            "Content-Type": "application/json",
        },
        "body": json.dumps(body)
    }

    return r

