require_relative 'patient'
require_relative 'room'
require_relative 'patient_repository'
require 'csv'

patient = Patient.new(name: "Bob")
p patient
room = Room.new(capacity: 1)
room.add_patient(patient)
# patient.room = room
p patient.room
p room

# patients = []
# CSV.foreach('patients.csv', headers: :first_row, header_converters: :symbol) do |row|
#   p row
#   p row[:id] = row[:id].to_i
#   p row[:name]
#   p row[:cured] = row[:cured] == 'true'
#   p row
#   patients << Patient.new(row)
#   p patients
# end

repository = PatientRepository.new('patients.csv')
repository.create(patient)
p repository
