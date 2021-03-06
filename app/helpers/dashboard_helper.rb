module DashboardHelper

	def popup(field, style, name=nil)
		if !field.nil?
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

    #just return the html for an icon if a url is present or not
    def url_present(field)
    	icon = ''
		if(field == "" || field == nil)
			icon = "icon-remove"
		else
			icon = "icon-ok"
		end


		html = "<i class='#{icon}'></i>"
    end

end
