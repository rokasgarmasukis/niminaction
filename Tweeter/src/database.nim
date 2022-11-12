import times, db_sqlite, strutils

type
  Database* = ref object
    db: DbConn

  User* = object
    username*: string
    following*: seq[string]

  Message* = object
    username*: string
    time*: Time
    msg*: string

proc newDatabase*(filename = "tweeter.db"): Database =
  new result
  result.db = open(filename, "", "", "")

proc post*(database: Database, message: Message) =
  if message.msg.len > 140:
    raise newException(ValueError, "Message hasto be less than 140 characters")

  database.db.exec(sql"INSERT INTO Message VALUES (?, ?, ?);", message.username, $message.time.toUnix, message.msg)

proc follow*(database: Database, follower: User, user: User) = 
  database.db.exec(sql"INSERT INTO Following VALUES (?, ?);", follower.username, user.username)

proc create*(database: Database, user: User) =
  database.db.exec(sql"INSERT INTO User VALUES (?);", user.username)

