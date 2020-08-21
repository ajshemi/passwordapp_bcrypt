class Eater < ApplicationRecord
    # has_secure_password
    attr_reader :password
    has_many :foods
    validates :username, uniqueness: true
    validates :password_confirmation, presence: true
    # validates :password,  confirmation: true
    # validates :password, presence: true, on: :create
    # def password=(plaintext)
        # encrypted= BCrypt::Password.create(plaintext)
        # byebug
        # self.password_digest=encrypted

        # self.create(username:username)
    # end

    # def authenticate(plaintext)
        # pw=BCrypt::Password.new(self.password_digest)
        # byebug
        # Eater.find_by(self.password_diget)
    #     pw == plaintext
    # end
end
