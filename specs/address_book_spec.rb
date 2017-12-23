require_relative '../models/address_book'

RSpec.describe AddressBook do
  describe "attributes" do
    it "responds to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq(0)
    end
  end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book = AddressBook.new
      book.add_entry(
        'Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book = AddressBook.new
      book.add_entry(
        'Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]
      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end

  describe "#remove_entry" do
    it "removes all entries from the address book equal to a specified entry" do
      book = AddressBook.new
      book.add_entry(
        'First Last', '101.202.3030', 'first.last@email.com')
      book.add_entry(
        'Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      book.add_entry(
        'Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      book.remove_entry(
        'Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(1)
    end

    it "removes the correct entry" do
      book = AddressBook.new
      book.add_entry(
        'First Last', '101.202.3030', 'first.last@email.com')
      book.add_entry(
        'Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      book.remove_entry(
        'Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      first_entry = book.entries[0]
      expect(first_entry.name).to eq('First Last')
      expect(first_entry.phone_number).to eq('101.202.3030')
      expect(first_entry.email).to eq('first.last@email.com')
    end
  end
end
