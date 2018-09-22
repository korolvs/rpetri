RSpec.describe RPetri do
  describe 'basic net' do
    let(:net) do
      RPetri::Net.build do
        place 'Start', tokens: 1
        transition 'First' do
          @a = 1
        end
        place 'Middle' do
          expect(@a).to be(1)
        end
        transition 'Second' do
          @a += 1
        end
        place 'End' do
          expect(@a).to be(2)
        end
        arc 'Start', 'First'
        arc 'First', 'Middle'
        arc 'Middle', 'Second'
        arc 'Second', 'End'
      end
    end
    it 'runs' do
      net.run
    end
  end
end
