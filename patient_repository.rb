require 'csv'
require_relative 'patient'
require_relative 'room_repository'

class PatientRepository
  def initialize(csv_file, room_repository)
    @csv_file = csv_file
    @room_repository = room_repository
    @patients = []
    @next_id = 1
    load_csv
  end

  def create(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    # save_csv
  end

  # private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == 'true'
      row[:room_id] = row[:room_id].to_i
      patient = Patient.new(row)

      room = @room_repository.find(row[:room_id] - 1)
      patient.room = room

      @patients << patient
    end
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end
end

roomr = RoomRepository.new('rooms.csv')
repository = PatientRepository.new('patients.csv', roomr)
# repository.load_csv
p roomr
p repository
