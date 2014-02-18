# encoding: utf-8
class Organizer < ActiveRecord::Base
  has_many :bid_items
end
