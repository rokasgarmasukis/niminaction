import asyncdispatch

import jester

routes:
    get "/":
        resp "Hello World!"
    # get "/d0m96":
    #     let user = findUser("d0m96")


runForever()