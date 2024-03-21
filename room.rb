class Room
  def initialize(attributes = {})
    @capacity = attributes[:capacity] || 0
    @patients = attributes[:patients] || []
  end

  def full?
    @patients.size == @capacity
  end

  def add_patient(patient)
    raise StandardError, 'The room is full' if full?
    patient.room = self
    @patients << patient
  end
end
