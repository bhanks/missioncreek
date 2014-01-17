class BaseController < ApplicationController

	def index
		@posts = Post.find(:all, :order=>"created_at DESC")
		@artists = Artist.where("front_page != ?", 0).order("front_page")
		@features = Page.where("feature_order IS NOT NULL").order("feature_order")
		
		render :layout => "application"
	end

  def sponsors
		render :layout => "application"
  end

  def about
    @content = "about"
    @title = "About"
    @style = "font-size:18px"
    @paths = {:history => "about_history_path",
              :staff => "about_staff_path",
              :archive => "about_archive_path"}
		render :layout => "application"
  end
  
  def history
    @title= "History"
    @style = "font-size:15px"
    @paths = {:about => "about_path",
              :staff => "about_staff_path",
              :archive => "about_archive_path"}
    @p1 = "The first local Mission Creek Festival took place in Iowa City, Iowa in 2006 but its roots "
    @p1 << "stretch all the way back to San Francisco. 19 years ago an artist/thinker/community activist Jeff Ray "
    @p1 << "conceived the idea of Mission Creek Music and Arts Festival (MCMAF) in San Francisco. "
    @p1 << "He wanted to create a late-spring/early summer festival that celebrated the musicians and artists of "
    @p1 << "the Bay Area with a particular focus on emerging talent and underground artists. Over the years his "
    @p1 << "small festival blossomed into a city-wide event that takes over San Francisco's music venues and art spaces. "
    @p1 << "With the slightly more mainstream festival Noisepop already existing in San Francisco, Ray maintained a "
    @p1 << "sharp focus on presenting experimental and underrepresented artists. In the early 2000s, Ray became "
    @p1 << "friends with a local writer/musician Andre Perry through the Bay Area music scene. Ray invited Perry "
    @p1 << "to become a producer for MCMAF. Perry jumped at the opportunity and worked closely with Ray's team in shaping "
    @p1 <<  "the annual festival. In recent years, Ray has re-envisioned Mission Creek Music and Arts Festival as an Oakland-based project."
    @p2 =  "Moving to Iowa City in the late-summer of 2005, Perry quickly immersed himself in the local music scene by attending "
    @p2 << "as many shows as he could. He connected with Tanner Illingworth a native Iowan and a guitar player. They started playing music "
    @p2 << "together but also considered the possibility of bringing something like Mission Creek Festival to Iowa City, an idea that Ray "
    @p2 << "had suggested to Perry before he left the Bay Area. Excited by the close proximity of venues and art spaces in downtown Iowa City," 
    @p2 << "the energy of both the University population and the local residents, and the intimacy of venues which made for special "
    @p2 << "performance experiences, Perry and Illingworth decided to launch an Iowa City-based Mission Creek Festival. The idea was "
    @p2 << "not to copy their sister festival in San Francisco but rather to take Ray's idea as an inspiration while building upon "
    @p2 << "Iowa City's intrinsic artistic strengths: a healthy underground/experimental music scene, a strong tradition of folk and "
    @p2 << "Americana music and a vibrant literary culture. In March 2006, they hosted the first Mission Creek Festival in Iowa City "
    @p2 << "funded by the sparse funds in their own bank accounts. The first festival was a success: it brought together a wide-range of "
    @p2 << "musicians, writers, and fans to downtown Iowa City for four energetic days. Since 2006 it has grown into an annual, "
    @p2 << "week-long event featuring 100s of artists, attracting 10,000  fans, inhabiting countless venues and non-traditional "
    @p2 << "art spaces, and creating an undeniable energy that makes Iowa City come alive for both arts enthusiasts as well as casual observers."
    @content = "history"
    render :action => "about"
  end

  def tickets
		render :layout => "application"
  end

  def archive
    @title= "Archive"
    @style = "font-size:15px"
    @paths = {:about => "about_path",
              :history => "about_history_path",
              :staff => "about_staff_path"}
              
    @content = "archive"
    render :action => "about"

  end

  def staff
    @title= "Staff"
    @style = "font-size:15px"
    @staff = [
      {
        :name=>"Andre Perry",
        :title=>"Co-Founder & Director"
      },
      {
        :name=>"Chris Wiersema",
        :title=>"Associate Director of Programming"
      },
      {
        :name=>"Joe Tiefenthaler",
        :title=>"Associate Director of Literary Programming"
      },
      {
        :name=>"Matt Rebelskey",
        :title=>"Production Manager"
      },
      {
        :name=>"Zoey Miller",
        :title=>"Marketing Director"
      },
      {
        :name=>"Tanner Illingworth",
        :title=>"Co-Founder & Ticketing"
      },
      {
        :name=>"Emily Kane",
        :title=>"Volunteer Coordinator"
      },
      {
        :name=>"Becky Nasadowski",
        :title=>"Design"
      },
      {
        :name=>"Brendan Hanks",
        :title=>"Web Developer"
      },
      {
        :name=>"Courtenay Bouvier",
        :title=>"Assistant Producer"
      },
      {
        :name=>"Kyle Drea",
        :title=>"Assistant Producer"
      },
      {
        :name=>"Alexi Schlesinger",
        :title=>"Assistant Producer"
      },
      {
        :name=>"Andrew Miller",
        :title=>"Design Assistant"
      }
      
    ]
    @paths = {:about => "about_path",
              :history => "about_history_path",
              :archive => "about_archive_path"}
              
    @content = "staff"
    render :action => "about"
  end
end
