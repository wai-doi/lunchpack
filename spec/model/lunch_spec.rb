require 'rails_helper'

describe Lunch do
  it '3人のメンバーが選ばれていないと有効ではないこと' do
    member1 = create(:member, real_name: '鈴木一郎')
    member2 = create(:member, real_name: '鈴木二郎')
    lunch = build(:lunch, members: [member1, member2])
    expect(lunch).to_not be_valid
  end

  it '同じクォーターの中で同じ組み合わせがあると、有効ではないこと' do
    members = [
      create(:member, real_name: '鈴木一郎'),
      create(:member, real_name: '鈴木二郎'),
      create(:member, real_name: '鈴木三郎')
    ]

    login_user = create(:user)
    create_lunch(members, login_user, date: Date.new(2019,9,15))

    lunch = build_lunch(members, login_user, date: Date.new(2019,9,16))

    expect(lunch).to_not be_valid
    expect(lunch.errors.messages[:went_to_lunch_in_same_quarter_and_members]).to eq ['鈴木一郎,鈴木二郎,鈴木三郎は2019-09-15にランチ済みです']
  end
end
