class Person < ApplicationRecord
  has_many :addresses
  has_one :profile
  default_scope { order(id: 'asc') }
  attr_accessor :street_number, :city, :state

  def male?
    gender == "Male" || gender == "M"
  end

  filterrific(
    available_filters: [
      :search_query,
      :with_date_of_birth,
      :with_gender
    ]
  )

  self.per_page = 5

  scope :search_query, lambda { |query|
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.to_s.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    num_or_conditions = 2
    where(
      terms.map {
        or_clauses = [
          "LOWER(people.f_name) LIKE ?",
          "LOWER(people.phone_number) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^f_name/
      order("LOWER(people.f_name) #{ direction }")
    when /^phone_number/
      order("LOWER(people.phone_number) #{ direction }")
    when /^date_of_birth/
      order("LOWER(people.date_of_birth) #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option:")
    end
  }
  scope :with_date_of_birth, lambda { |ref_date|
    where('people.date_of_birth = ?', ref_date)
  }
  scope :with_gender, lambda { |gender|
    where('people.gender = ?', gender) unless gender == "All"
  }

  def decorated_created_at
    created_at.to_date.to_s(:long)
  end


end
