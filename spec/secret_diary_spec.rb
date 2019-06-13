require 'secret_diary'

describe SecretDiary do

  context 'when new' do
    it 'should be locked by default' do
      expect(subject.locked).to eq(true)
    end
    it 'should be empty by default' do
      expect(subject.diary).to be_empty
    end
  end

  context 'when locked' do
    it 'can unlock the diary' do
      expect(subject.unlock).to eq(false)
    end
    it 'add_entries raises an error' do
      subject.lock
      expect { subject.add_entries("hello") }.to raise_error "diary is locked!"
    end
    it 'get_entries raises an error' do
      subject.lock
      expect { subject.get_entries }.to raise_error "diary is locked!"
    end
  end

  context 'when unlocked' do
    it 'can lock the diary' do
      expect(subject.lock).to eq(true)
    end
    it 'can add an entry to the diary' do
      subject.unlock
      expect(subject.add_entries("hello")).to eq(["hello"])
    end
    it 'can get entries from the diary' do
      subject.unlock
      subject.add_entries("hello")
      expect(subject.get_entries).to eq(["hello"])
    end
  end
end
