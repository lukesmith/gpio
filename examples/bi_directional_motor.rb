require '../lib/gpio'

motor = GPIO::BiDirectionalMotor.new(pin1: 17, pin2: 18)

# Set the motor to move forward
motor.forward

puts "Motor #{motor.direction}"

sleep 1

# Set the motor to move in reverse
motor.reverse

puts "Motor #{motor.direction}"

sleep 1

# Stop the motor
motor.stop

puts motor.moving? ? "motor is moving" : "motor is not moving"

sleep 1
