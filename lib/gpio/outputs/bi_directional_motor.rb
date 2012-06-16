module GPIO
	class BiDirectionalMotor
		attr_reader :pin1
		attr_reader :pin2

		def initialize(params)
			pin1_params = { :pin => params[:pin1] }
			pin2_params = { :pin => params[:pin2] }	
			@pin1 = OutputPin.new(pin1_params)
			@pin2 = OutputPin.new(pin2_params)
		end

		def forward
			pin1.on
			pin2.off
		end

		def reverse
			pin1.off
			pin2.on
		end

		def stop
			pin1.off
			pin2.off
		end

		def direction
			return :forward if pin1.read && !pin2.read
			return :reverse if !pin1.read && pin2.read
		end

		def moving?
			[:forward, :reverse].include? direction
		end
	end
end
