module Paperclip
  module SchemaStatements
    
    # Adds paperclip columns to the table definition.
    # ===== Examples
    #  add_paperclip_attachment(:user, :avatar)
    #  add_paperclip_attachment(:user, :avatar, :profile_photo)
    def add_paperclip_attachment(table_name, *attachment_names)
      attachment_names.each do |name|
        add_column table_name, "#{name}_file_name", :string
        add_column table_name, "#{name}_content_type", :string
        add_column table_name, "#{name}_file_size", :integer
        add_column table_name, "#{name}_updated_at", :datetime
      end
    end
    
    # Removes paperclip columns from the table definition.
    # ===== Examples
    #  remove_paperclip_attachment(:user, :avatar)
    #  remove_paperclip_attachment(:user, :avatar, :profile_photo)
    def remove_paperclip_attachment(table_name, *attachment_names)
      attachment_names.each do |name|
        remove_column table_name, "#{name}_file_name", "#{name}_content_type", "#{name}_file_size", "#{name}_updated_at"
      end
    end
    
  end
end