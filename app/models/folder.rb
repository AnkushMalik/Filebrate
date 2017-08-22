class Folder < ApplicationRecord
	belongs_to :user
	has_many :assets, :dependent => :destroy
	has_ancestry
end
