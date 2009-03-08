class <%= migration_name %> < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %> do |t|
<% attributes.each do |attribute| -%>
<% if attribute.type == :paperclip -%>
      t.string :<%= attribute.name %>_file_name
      t.string :<%= attribute.name %>_content_type
      t.integer :<%= attribute.name %>_file_size
      t.datetime :<%= attribute.name %>_updated_at
<% else -%>
      t.<%= attribute.type %> :<%= attribute.name %>
<% end -%>
<% end -%>
<% unless options[:skip_timestamps] -%>
      t.timestamps
<% end -%>
    end

<% attributes.select(&:reference?).each do |attribute| -%>
    add_index :<%= table_name %>, :<%= attribute.name %>_id
<% end -%>
  end

  def self.down
<% attributes.select(&:reference?).each do |attribute| -%>
    remove_index :<%= table_name %>, :<%= attribute.name %>_id
<% end -%>
    drop_table :<%= table_name %>
  end
end
