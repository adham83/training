class Post < ActiveRecord::Base

validates :body, :title, :blurp, :presence => true
#validates :body, :length => { :in => 1..20 , message:'is too long (maximum is 20 characters)' }

#validates_length_of :title,
   #:minimum => 8           # more than 8 characters
   #:maximum => 16          # shorter than 16 characters
#  :in => 4..8            # between 4 and 8 characters

end
