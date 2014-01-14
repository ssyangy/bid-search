class BidItemsController < ApplicationController

  def index

  end


  def search
    keyword = elaticsearch_query(params[:keyword])

    @bid_items =  BidItem.search(keyword)


    render :action => "index"
  end


  def show
    @bid_item = BidItem.find params[:id]
    #render :layout => false
  end

  private

  def elaticsearch_query(q)
    return if q.blank?
    q.strip!
    if q.present?
      q.gsub!(/[\p{P}\p{S}]/, '')
    end
    q
  end
end
