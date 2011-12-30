class Demo
	def initialize( status, config, output, irc, timer )
		@status		= status
		@config		= config
		@output		= output
		@irc		= irc
		@timer		= timer
	end

	# Default method, called when no argument is given (optional, but highly recomended)
	def main( nick, user, host, from, msg, arguments, con )
		@irc.message( from, "This is the demo module, function and function_admin are availble." )
	end

	# Method that receives a notification when a user is kicked (optional)
	def kicked( nick, user, host, channel, kicked, reason )
		@irc.message( channel, kicked + " was kicked by " + nick + " for " + reason + "." )
	end

	# Method that receives a notification when a notice is received (optional)
	def noticed( nick,  user,  host,  to,  message )
		@irc.message( nick, "Received notice from: " + nick + ": " + message )
	end

	# Method that receives a notification when a message is received, that is not a command (optional)
	def messaged( nick, user, host, from, message )
		@irc.message( from, "Received message from: " + nick + ": " + message )
	end

	# Method that receives a notification when a user joins (optional)
	def joined( nick, user, host, channel )
		@irc.message( channel, nick + " joined " + channel + "." )
	end

	# Method that receives a notification when a user parts (optional)
	def parted( nick, user, host, channel )
		@irc.message( channel, nick + " parted " + channel + "." )
	end

	# Method that receives a notification when a user quits (optional)
	def quited( nick, user, host, message )
		@output.std( nick + " quit: " + message )
	end

	# Generic function that can be called by any user
	def function( nick, user, host, from, msg, arguments, con )
		@irc.message( from, nick + " called \"function\" from " + from + "." )
	end

	# Generic function that can only be called by an admin
	def functionadmin( nick, user, host, from, msg, arguments, con )
		if( @config.auth( host, con ) )
			# Admin only code goes in here
			@irc.message( from, nick + " called \"function_admin\" from " + from + "." )
		else
			@irc.message( from, "Sorry " + nick + ", this is a function for admins only!" )
		end
	end

end