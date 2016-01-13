module Services
  class Project
    def initialize(project=nil)
      @project = project
    end

    def encrypted_id
      JWT.encode({
        id: @project.id
      }, self.class.encrypted_identifier_salt)
    end

    def csat_url
      Setting.protocol + '://' + Setting.host_name + '/csats/new?project_id=' + self.encrypted_id
    end

    def self.find_by_encrypted_id(eid)
      JWT.decode(eid, encrypted_identifier_salt)[0]['id'] rescue nil
    end

    def self.encrypted_identifier_salt
      'c37417926fb7f2d6c1f4717afaba017074c7308b2c2b4d1101a226587f6ce26ecae0318c85ea700e794ceeee4123b52270746fa698e0c49f493928180d76df67'
    end
  end
end
