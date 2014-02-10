class BidItemsController < ApplicationController

  def index

  end


  def search
    keyword = elaticsearch_query(params[:keyword])

    @bid_items =  BidItem.search(:per_page => 10,:page => params[:page]) do
      query do
        string keyword,:default_field => "title"

      end
      highlight :title ,:options => {:tag => "<label class='keywords'>"}
      sort { by :start_at ,'desc'}
    end

    #@bid_items = @bid_items.paginate


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
