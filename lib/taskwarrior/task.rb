require 'active_model'

module TaskWarrior
  class Task
    attr_accessor :description, :id, :entry, :status, :uuid, :project, :dependencies, :parent, :children, :priority

    include ActiveModel::Validations
    validates :description, :id, :entry, :status, :uuid, :presence => true

    validates :id, :numericality => { :only_integer => true, :greater_than => 0}

    validates :uuid, :format => {:with => /[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}/,
                                 :message => "'%{value}' does not match the expected format of a UUID"}

    validates :status, :inclusion => {:in => [:pending, :waiting, :complete], :message => "%{value} is not a valid status"}

    validates :priority, :inclusion => {
      :in => [:high, :medium, :low],
      :allow_nil => true,
      :allow_blank => true,
      :message => "%{value} is not a valid priority"
    }

    validate :entry_cannot_be_in_the_future

    def initialize(description)
      @description = description
      @dependencies = []
      @children = []
      @tags = []
    end

    def tags
      @tags
    end

    def to_s
      "Task '#{description}'".tap{|result| result << " <#{uuid}>" if uuid}
    end

    private
    def entry_cannot_be_in_the_future
      begin
        if !entry.blank? and entry > DateTime.now
          errors.add(:entry, "can't be in the future")
        end
      rescue
        errors.add(:entry, "must be comparable to DateTime")
      end
    end
  end
end
