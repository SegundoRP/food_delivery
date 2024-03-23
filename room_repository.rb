require 'csv'
require_relative 'room'

class RoomRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    @next_id = 1
    load_csv
  end

  def create(room)
    room.id = @next_id
    @next_id += 1
    @rooms << room
    # save_csv
  end

  def find(index)
    @rooms[index]
  end

  # private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      @rooms << Room.new(row)
    end
    @next_id = @rooms.last.id + 1 unless @rooms.empty?
    # @next_id = @rooms.empty? ? 1 : @rooms.last.id + 1
  end
end

repository = RoomRepository.new('rooms.csv')
p repository.load_csv
p repository
