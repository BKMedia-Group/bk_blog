class BlogAttachment < ActiveRecord::Base
  attr_accessible :file, :title

  has_attached_file :file

  belongs_to :blog

  before_save do
    self.title = file.original_filename if title.blank?
  end
end
