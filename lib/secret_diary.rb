class SecretDiary

attr_reader :locked, :diary

  def initialize
    @diary = []
    @locked = true
  end

  def lock
    @locked
  end

  def unlock
    @locked = false
  end

  def add_entries(entry)
    raise "diary is locked!" if lock
    @diary << entry
  end

  def get_entries
    raise "diary is locked!" if lock
    @diary
  end
end
