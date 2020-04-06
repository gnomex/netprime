RSpec.describe Video, type: :model do
  let(:user) { User.new(id: 1) }
  let(:url) { nil }
  let(:instance) {
    described_class.new(
      id: 1, user: user, name: "Video T", view_count: 0, url: url
    )
  }

  describe 'up count' do
    subject { instance.up_count }

    before do
      allow(instance).to receive(:update)
    end

    it 'update itself by one' do
      expect(instance).to receive(:update).with({:view_count=>1})

      subject
    end
  end

  describe 'URL validation' do
    subject { instance }

    context 'when got an invalid url' do
      before do
        allow(VideoExtensionValidator).to receive(:validate).and_return(false)
      end

      it 'adds erros' do
        expect(subject).to_not be_valid
      end
    end

    context 'with a valid url' do
      let(:url) { "lvh.me" }

      before do
        allow(VideoExtensionValidator).to receive(:validate).and_return(true)
      end

      it 'does not add errors' do
        expect(subject).to be_valid
      end
    end
  end
end
