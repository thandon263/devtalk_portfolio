class Portfolio < ApplicationRecord
    has_many :technologies
    accepts_nested_attributes_for :technologies, 
                                    reject_if: ->(attributes){ 
                                        attributes['name'].blank? 
                                    }, allow_destroy: true
            # On the console when testing the application
            # Portfolio.create!(title:"My New App", subtitle ..., technologies_attributes: [{ hashes }, { hashes }])
                # These attributes are used to scope or nest technologies
    includes Portfolio
    validates_presence_of :title, :body, :main_image, :thumb_image

    # Scopes
    # This is a way of creating a scope
    def self.angular
        where(subtitle: "Angular")
    end

    def self.by_position
        order("position ASC")
    end

    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails')}

    # Setting a default using a callback
    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= Placeholder.image_generator(height: 600, width: 400)
        self.thumb_image ||= Placeholder.image_generator(height: 350, width: 200)
    end
    
end

=begin
    
What ||= on the set_defaults method means, this is a short form
of saying:

    if self.main_image == nil
        self.main_image = "http://via.placeholder.com/600x400"
    end

Its there to prevent the program from setting defaults even when you have set
The values on (:new).
    
=end