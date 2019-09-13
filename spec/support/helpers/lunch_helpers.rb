module LunchHelpers
  def create_lunch(members, user, date: Date.today)
    quarter = Quarter.find_or_create_quarter(date)
    create(:lunch, members: members, date: date, quarter: quarter, created_by: user)
  end
end
