# A Real Web Server and Browser
A simple web server that receives requests from a simple browser client and responds accordingly.
To run this project, open two terminal tabs and run `$ ruby server.rb` in one, and run `$ ruby browser.rb` in the other.

### Browser
The user is first asked:
`Do you want to send a GET or a POST request?`

If POST is chosen, the user is then prompted for his/her name and email. This information is converted to JSON and sent to the server in the request's body.

### Server
GET requests are handled by looking for the requested file and returning it if found.
POST requests are handled by parsing the received JSON and returning a HTML file created from an ERB template.

An example of the HTML response from a POST request:
```html
<html>
      <body>
        <h1>Thanks for Posting!</h1>
        <h2>Here's what we got from you:</h2>
        <ul>
        <li>Name: Jake</li>
        <li>Email: jakedex@test.com</li>
        </ul>
      </body>
</html>
```
