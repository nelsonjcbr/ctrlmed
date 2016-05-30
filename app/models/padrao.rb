class Padrao < ActiveRecord::Base

    validates_presence_of :campo, :valores

end
