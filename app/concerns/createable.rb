module Createable

  module ClassMethods
    def create_by_name(name)
      self.new.tap{|artist| artist.name = name}
    end
  end

  module InstanceMethods
  end

end