require 'pry'

def get_songs
	songs = [
	  "Phoenix - 1901",
	  "Tokyo Police Club - Wait Up",
	  "Sufjan Stevens - Too Much",
	  "The Naked and the Famous - Young Blood",
	  "(Far From) Home - Tiga",
	  "The Cults - Abducted",
	  "Phoenix - Consolation Prizes",
	  "Harry Chapin - Cats in the Cradle",
	  "Amos Lee - Keep It Loose, Keep It Tight"
	]
end

def help
	puts(
		'''I accept the following commands:
- help : displays this help message
- list : displays a list of songs you can play
- play : lets you choose a song to play
- exit : exits this program
'''
	)
end

def list(songs)
	puts '''
		1. Phoenix - 1901
		2. Tokyo Police Club - Wait Up
		3. Sufjan Stevens - Too Much
		4. The Naked and the Famous - Young Blood
		5. (Far From) Home - Tiga
		6. The Cults - Abducted
		7. Phoenix - Consolation Prizes
		8. Harry Chapin - Cats in the Cradle
		9. Amos Lee - Keep It Loose, Keep It Tight
	'''
end

def play(songs)
	puts "Please enter a song name or number:"
	response = gets.chomp
	song_name = ""
	if response.to_i != 0 && response.to_i <= songs.length
		song_name = get_songs[response.to_i - 1]
	else
		get_songs.each do |song|
			if song.split(" --")[0].downcase == response.downcase
				song_name = song
			end
		end
	end
	if song_name == ""
		message = "Invalid input, please try again."
	else
		message = "Playing #{song_name}"
	end
	puts message
end

def exit_jukebox
	puts "Goodbye"
end

def run(songs)
	help
	puts "Please enter a command:"
	response = gets.chomp
	if response != "exit"
		if response == "play"
			play(songs)
		elsif response == "list"
			list(songs)
		elsif response == "help"
			help
		end
		run(songs)
	end
	exit_jukebox
end
