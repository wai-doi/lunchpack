require 'rails_helper'

describe Project do
  it '名前がないと有効ではないこと' do
    project = described_class.new(name: '')
    expect(project).not_to be_valid
  end
end
