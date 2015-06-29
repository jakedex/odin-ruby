require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing MicroBlogger"
    @client = JumpstartAuth.twitter
  end

  def tweet(message)
    if message.length <= 140
      @client.update(message)
    else
      puts "tweets cannot be longer than 140 characters!"
    end
  end

  def followers_list
    screen_names = []
    @client.followers.each do |follower|
      screen_names << @client.user(follower).screen_name
    end

    screen_names
  end

  def spam_my_followers message
    followers_list.each do |follower|
      dm(follower, message)
    end
  end

  def dm(target, message)
    puts "Trying to send #{target} then direct message:"
    puts message

    if followers_list.includes? target
      message = "d @#{target} #{message}"
      tweet(message)
    else
      puts "Can't send DM's to users who aren't following you"
    end
  end

  def everyones_last_tweet
    @client.friends.each do |friend|
      puts friend.screen_name
      puts friend.status.source + "\n"
    end
  end

  def run
    puts "Welcome to the JSL Twitter Client"

    command = ""
    while command != "q"
      printf "enter command: "
      input = gets.chomp
      parts = input.split(" ")
      command = parts[0]

      case command
      when 'q' then puts "Goodbye!"
      when 't' then tweet(parts[1..-1].join(" "))
      when 'dm' then dm(parts[1], parts[2..-1].join(" "))
      when 'spam' then spam_my_followers(parts[2..-1])
      when 'elt' then everyones_last_tweet
      else
        puts "Sorry, I don't know how to #{command}"
      end
    end
  end
end

MicroBlogger.new.run
