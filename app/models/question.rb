require 'elasticsearch/model'


class Question < ApplicationRecord

	include Elasticsearch::Model
  	include Elasticsearch::Model::Callbacks
	
	belongs_to :category
	has_many :answers
	belongs_to :owner,foreign_key: "asked_by",class_name: "User"  

	validates :name,:description,:presence=>true


	def self.search(query)
	__elasticsearch__.search(
	{
	  query: {
	    multi_match: {
	      query: query,
	      fields: ['name', 'description']
	    }
	  },
	  highlight: {
	    pre_tags: ['<em>'],
	    post_tags: ['</em>'],
	    fields: {
	      name: {},
	      description: {}
	    }
	  }
	}
	)
	end

	settings index: { number_of_shards: 1 } do
  		mappings dynamic: 'false' do
    		indexes :name, analyzer: 'english', index_options: 'offsets'
    		indexes :description, analyzer: 'english'
  		end
	end



end

Question.import(force: true)