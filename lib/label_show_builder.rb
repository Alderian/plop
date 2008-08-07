require 'redcloth'

class LabelShowBuilder < ActionView::Helpers::FormBuilder
     helpers = field_helpers + 
               %w(date_select datetime_select time_select) + 
               %w(collection_select select country_select time_zone_select) - 
               %w(hidden_field label fields_for select) 
     helpers.each do |name| 
          define_method(name) do |field, *args| 
               options = args.last.is_a?(Hash) ? args.pop : {} 
               @template.content_tag(:p, label(field) + self.object[field].to_s,:class=>"show") 
          end 
     end
     def select(method, choices, options = {}, html_options = {})
       @template.content_tag(:p, label(method) + (choices.select {|e| e[1]==object[method]})[0][0].to_s,:class=>"show") 
     end
     def file_field(method, options = {})
       # handle versioned objects and paperclip attachements
       if object.class.name=~ /Version/i
         current_object = object.send(object.class.parent.name.underscore.to_sym)
       else
         current_object = object
       end
       file = current_object.send(method)
       case current_object.send("#{method}_content_type".to_sym)
          #course
          when "application/x-zip-compressed"
            @template.content_tag(:p, label(method) + current_object.send(method).url,:class=>"show") 
          #any other as image  
          else 
            @template.content_tag(:p, label(method) + @template.image_tag(current_object.send(method).url),:class=>"show") 
       end
     end

  # parse and return data as HTML
  def to_html(rawtext)
    return "" if rawtext.nil?
      
    r = RedCloth.new rawtext
    r.to_html    
  end
  def check_box(method, options = {})
    @template.content_tag(:p, super, :class=>"show") 
  end
end
