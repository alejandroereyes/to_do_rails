# To-dos using Rails

  This app uses the Rails framework to take RESTful requests and send responces in JSON back to the client. The information being worked with are from a to-do list kept in a SQLite3 db.
  This app has been updated to display in the browser using html.

## What kind of requests will the server take?

  All responces will be returned in JSON format.

  * `http://localhost:3000/todos` will return all to-dos in the list.
  * `http://localhost:3000/todos/new` will return an empty to-do.
  * `http://localhost:3000/todos/1` will return to-do at id 1.
  * `http://localhost:3000/todos/8989898` will return appropriate error message when id not found.
  * Sending a `POST` verb & `http://localhost:3000/todos` with a params of `{ "body": "Finish Homework" }` will generate a new todo and return new todo.
  * Sending a `DELETE` verb & `http://localhost:3000/todos/1` will delete the todo at id 1.
  * Sending a `PUT` verb & `http://localhost:3000/todos/3` with a params of `{"completed": "true"}` will update todo and return updated todo.

## How to run

  * Clone this repo
  * run `rails s` in the `to_do` folder
  * run url command from above in your browser


## Details

* Ruby version 2.2.0

