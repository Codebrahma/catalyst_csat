require 'JWT'

class Project < ActiveRecord::Base
  def encrypted_identifier
    JWT.encode({ id: self.id }, Project.encrypted_identifier_salt)
  end

  def self.encrypted_identifier_salt
    'c37417926fb7f2d6c1f4717afaba017074c7308b2c2b4d1101a226587f6ce26ecae0318c85ea700e794ceeee4123b52270746fa698e0c49f493928180d76df67'
  end
end
