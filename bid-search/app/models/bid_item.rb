class BidItem < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  # 全文检索
  mapping do
    indexes :id, :index => :not_analyzed
    indexes :title, :analyzer => 'ik'
    indexes :organizer_id, :index => :not_analyzed
    indexes :auction_id, :index => :not_analyzed
    indexes :lot
    indexes :description, :analyzer => 'ik'
    indexes :condition
    indexes :start_at, :type => 'date'
    indexes :end_at, :type => 'date'
    indexes :status
    indexes :est_price_low
    indexes :est_price_high
    indexes :realized_price
    indexes :winner
    indexes :loser
    indexes :is_online
    indexes :small_img
    indexes :medium_img
    indexes :big_img
    indexes :source_url
    indexes :topic_name
    indexes :organizer_name
    indexes :created_at , :type => 'date'
    indexes :updated_at , :type => 'date'

  end


  def to_indexed_json
    self.to_json
  end

  def self.index_search(q)

  end




end
