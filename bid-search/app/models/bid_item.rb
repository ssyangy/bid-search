class BidItem < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  belongs_to :organizer

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
    indexes :created_at, :type => 'date'
    indexes :updated_at, :type => 'date'
    indexes :organizer do
      indexes :short_name ,:index => :not_analyzed
    end

  end


  def to_indexed_json
    self.to_json({:include => {:organizer => {:only=>:short_name}}})
  end

  def self.index_search(keyword,per_page,page)
    BidItem.search(:per_page => per_page,:page => page) do
      query do
        string keyword,:default_field => "title"

      end
      highlight :title ,:options => {:tag => "<label class='keywords'>"}
      facet 'organizer' do
        terms 'organizer.short_name'
      end
      #sort { by :start_at ,'desc'}
    end
  end


end
