module DashboardHelper

	def popup(field, style, name=nil)
		icon = ''
		if(field != "")
			icon = "icon-ok"
		else
			icon = "icon-remove"
		end
		title = (style == 'popover') ? name : field
		html = "<a class='dashboard-popup' rel='#{style}' data-original-title='#{title}' data-content='#{field[0,200]}'>"
		html << "<i class='#{icon}'></i></a>"
  end


end
