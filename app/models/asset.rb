class Asset < ApplicationRecord
	belongs_to :user
	has_attached_file :uploaded_file,
					  :url => "/assets/get/:id", 
               		  :path => ":project_root/assets/:id/:basename.:extension"
	validates :uploaded_file,attachment_presence: true
	do_not_validate_attachment_file_type :uploaded_file
	#validates_attachment_content_type :uploaded_file, content_type:  /\Aimage\/.*\Z/
  	validates_attachment_presence :uploaded_file
end
