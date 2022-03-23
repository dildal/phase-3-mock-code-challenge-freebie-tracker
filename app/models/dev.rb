class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one(item_name)
      self.freebies.any?{|freebie| freebie.item_name.downcase == item_name.downcase}
    end

    def give_away(dev, freebie)
        if(self.freebies.include?(freebie))
            freebie.dev_id = dev.id
            freebie.save
        else
            puts "That's not yours to give away!"
        end
    end
end
