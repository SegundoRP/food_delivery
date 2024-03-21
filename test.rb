require_relative 'patient'
require_relative 'room'

patient = Patient.new(name: "Bob")
p patient
room = Room.new(capacity: 1)
room.add_patient(patient)
# patient.room = room
p patient.room
p room
