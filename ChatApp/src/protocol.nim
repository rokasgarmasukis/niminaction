import json

type
    Message* = object
        username* : string
        message* : string

proc parseMessage*(data: string): Message = 
    let dataJson = parseJson(data)
    result.username = dataJson["username"].getStr()
    result.message = dataJson["message"].getStr()

proc createMessage*(username, message: string): string =
    result = $(%{
        "username": %username,
        "message": %message
        }) & "\c\l"

when isMainModule:
    block:
        let data = """{"username":"John","message":"Hi Rokas!"}"""
        let parsed = parseMessage(data)
        doAssert parsed.username == "John"
        doAssert parsed.message == "Hi Rokas!"
        echo "All tests passed!"
    block:
        let data = """foobar"""
        try:
            let parsed = parseMessage(data)
            doAssert false
        except JsonParsingError:
            echo "wrong input doesn't get parsed"
            doAssert true
        except:
            doAssert false    
    block:
        let expected = """{"username":"dom","message":"hello"}""" & "\c\l"
        doAssert createMessage("dom", "hello") == expected