require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(html)    
  end
  def get_courses
    doc = get_page
    doc.css(".post")
  end
  def make_courses
    get_courses.map do |course|
      the_course = Course.new()
      the_course.title = course.css("h2").text
      the_course.schedule = course.css(".date").text
      the_course.description =  course.css("p").text
      the_course
    end
  end
  
end



