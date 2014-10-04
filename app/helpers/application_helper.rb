module  ApplicationHelper

#   def nav_link(name, href = nil, options = {}, html_options = {}, &block)
#     if current_page?(href.nil? ? name : href)
#       "<li class='active'>#{link_to(name, href, options, &block)}</li>".html_safe
#     else
#       "<li>#{link_to(name, href, options, &block)}</li>".html_safe
#     end
#   end

#   def form_group(attribute, label = attribute.to_s, options = {}, &block)
#     raw "<div class='form-group #{options['form-group-class']}'><label for='#{attribute}'>#{label}</label>" + capture(&block) + "</div>"
#   end

  def bo_box(title, options = {}, &block)
    options = {color: 'info'}.merge(options)
    raw %Q"<div id='#{options[:id]}' class='box box-#{options[:color]} #{options[:class]}'>
            <div class='box-header-#{options[:color]}'>
              <h4>#{title}</h4>
            </div>
            <div class='box-content'>
              #{capture(&block)}
              <div class='clearfix'></div>
            </div>
          </div>"
  end

#   def panel(title, options = {}, &block)
#     options = {color: 'info'}.merge(options)

#     raw %Q"<div class='#{options[:class]}'>
#             <div class='panel panel-#{options[:color]}'>
#               <div class='panel-heading'>
#                 <h3 class='panel-title'>#{title}</h3>
#               </div>
#               <div class='panel-body'>
#                 #{capture(&block)}
#               </div>
#             </div>
#           </div>"
#   end

#   def control_group(attribute, label = "", options = {}, &block)

#     raw  %Q{<div class='form-group #{options[:class]}' id="options[:id]">
#               <label class='control-label col-sm-3 col-lg-height col-middle' for='#{attribute}'>
#                 #{label}
#                 <small>#{options[:small]}</small>
#               </label>
#               <div class='col-sm-9 col-lg-height col-middle'>
#                 #{capture(&block)}
#               </div>
#               <div class='clearfix'></div>
#             </div>}
#   end

#   def panel_group(options, &block)
#     raise 'You must provide an :id to your panel_group' if options[:id].blank?

#     raw %Q{
#       <div class="panel-group #{options[:class]}" id="#{options[:id]}">
#         #{capture(&block)}
#       </div>
#     }
#   end

#   def panel_collapse(title, options={}, &block )
#     raise 'You must provide a :panel_group_id to your panel_collapse' if options[:panel_group_id].blank?

#     options = { color: 'info', href: SecureRandom.hex }.merge(options)

#     raw %Q{
#       <div class="panel panel-#{options[:color]} #{options[:class]}" id="#{options[:id]}">
#         <div class="panel-heading">
#           <h4 class="panel-title">
#             #{options[:title]}
#             <a data-toggle="collapse" data-parent="##{options[:panel_group_id]}" href="##{options[:href]}">
#               #{title}
#             </a>
#           </h4>
#         </div>
#         <div id="#{options[:href]}" class="panel-collapse collapse">
#           <div class="panel-body">
#             #{capture(&block)}
#           </div>
#         </div>
#       </div>
#     }

#   end


end