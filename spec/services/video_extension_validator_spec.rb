RSpec.describe VideoExtensionValidator, type: :service do
  let(:url) { 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8' }
  let(:instance) { described_class.new(url) }

  before do
    allow(described_class).to receive(:new).and_return(instance)
  end

  describe '.validate' do
    subject { described_class.validate(url) }

    it 'creates an instance' do
      expect(described_class).to receive(:new).with(url)

      subject
    end

    it 'calls validate on instance with correct parameters' do
      expect(instance).to receive(:validate)

      subject
    end
  end

  describe '#validate' do
    subject { instance.validate }

    context 'with a valid url' do
      it 'returns truth' do
        expect(subject).to be_truthy
      end
    end

    context 'with a invalid extension' do
      let(:url ) { 'https://content.jwplatform.com/manifests/yp34SRmf.m4u9' }

      it 'does not validate and returns false' do
        expect(subject).to be_falsy
      end
    end

    context 'with a invalid URL' do
      let(:url ) { 'content.com/yp34SRmf.m3u8' }

      it 'does not validate and returns false' do
        expect(subject).to be_falsy
      end
    end
  end
end
