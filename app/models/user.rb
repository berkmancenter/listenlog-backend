# a class that interfaces with couch ; not activerecord
class User

  @@cr = CouchRest.new COUCHHOST
  @@db = @@cr.database(COUCHDB)

  attr_reader :raw, :parsed, :message_type
  def initialize
  end

  def self.create_doc(created_at = Time.now) # parameterized to make testing easier
    user_pin = "%.6d" % rand(1000000)
    new_user = {:createdAt => created_at, :pin => user_pin}
    doc_id = @@db.save_doc(new_user)['id'] 
    doc = @@db.get(doc_id)
  end



end
