class User < Sequel::Model

  many_to_one :company

  def self.find_by_id(id)
    User[id]
        .to_json(
            only: [:email, :first_name, :last_name],
            root: true,
            include: {company: {only: :name}},
            associations: :company)
  end

end