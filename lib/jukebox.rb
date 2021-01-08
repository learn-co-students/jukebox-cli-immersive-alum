# Add your code here
# def say_hello(name)
#   "Hi #{name}!"
# end

# puts "Enter your name:"

# user_name = gets.strip

# puts say_hello(user_name)
require "pry"
def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def list(songs)
  songs.each_index do |i|
    puts "#{i+1}. #{songs[i]}"
  end
end

def play(arg)
  puts "Please enter a song name or number:"
  user_selection = gets.strip
  
  if (user_selection.to_i) == 0 #string casts into int == 0
    song_title = user_selection
  else 
    song_num = user_selection.to_i - 1
  end
  if song_num
    if song_num > arg.length
      puts "Invalid input, please try again"
    else
      puts "Playing #{arg[song_num]}"
    end
  elsif song_title
    if arg.include?(song_title)
      puts "Playing #{song_title}"
    else
      puts "Invalid input, please try again"
    end
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(arg)
  # help
  user = nil
  unless user == "exit"
    puts "Please enter a command:"
    user = gets.strip.downcase
    case user
    when "exit"
      exit_jukebox
    when "help"
      help
    when "list"
      list(arg)
    when "play"
      play(arg)
    end
  end
end
