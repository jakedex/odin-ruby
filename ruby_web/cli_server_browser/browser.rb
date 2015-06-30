require 'socket'
require 'json'

hostname = 'localhost'
port = 2000
params = { person: {} }

# input validation : GET or POST
input = ""
until input == "GET" || input == "POST"
  print "Do you want to send a GET or POST request? "
  input = gets.chomp
end

if input == "POST"
  print "Enter name: "
  params[:person][:name] = gets.chomp
  print "Enter email: "
  params[:person][:email] = gets.chomp
  body = params.to_json
  request = "POST /thanks.html HTTP/1.0\r\nContent-Length: #{params.to_json.length}\r\n\r\n#{body}"
else
  request = "GET /index.html HTTP/1.0\r\n\r\n"
end

socket = TCPSocket.open(hostname, port)  # Connect to server.rb
socket.print(request)                    # Send request
response = socket.read                   # Read in server's response

puts response.split("\r\n\r\n", 2)[1]    # Display body of response
socket.close
