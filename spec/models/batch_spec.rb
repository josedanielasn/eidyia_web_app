RSpec.describe Batch, type: :model do

    describe 'validations' do

        context 'when creating a batch' do
            let(:batch) { FactoryBot.create :batch }
    
            it 'is expected to validate the presence of batch_name ' do
                expect(batch).to be_valid
            end
            
            it "is not valid without a batch_name" do
                batch.batch_name = nil
                expect(batch).to_not be_valid
            end

            it "is not valid if batch_name has less than 2 characters" do
                batch.batch_name = "l"
                expect(batch).to_not be_valid
            end

            it "is not valid if batch_name has greater than 20 characters" do
                batch.batch_name = "Lecture 1: Ruby on Rails Basics"
                expect(batch).to_not be_valid
            end
        
        end
    end 
  
  end