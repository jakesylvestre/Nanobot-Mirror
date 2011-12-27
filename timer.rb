#!/usr/bin/ruby

# Class to delay sending messages to IRC
class Timer
	def initialize( status, config, output, irc )
		@status		= status
		@config		= config
		@output		= output
		@irc		= irc
	end

	def action( timeout, action )
		@output.debug( "Set action '" + action + "' to be executed in " + timeout.to_s + " seconds.\n" )

		if( @config.threads == 1 && @status.threads == 1 )
			Thread.new{ sleep( timeout ); eval( action ) }
		else
			@output.debug( "Not executing, threading disabled.\n" )
		end
	end
end
