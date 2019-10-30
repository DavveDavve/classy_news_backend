describe ArticlePolicy do
  subject { described_class.new(user, article) }

  let(:article) { create(:article) }

  context 'user is a subscriber' do
    let(:user) { create(:user, role: 'subscriber') }

    it { is_expected.to permit_actions [:show, :index] }
    it { is_expected.to forbid_new_and_create_actions }
  end

  context 'user is a journalist' do
    let(:user) { create(:user, role: 'journalist') }

    it { is_expected.to permit_new_and_create_actions }
  end
end