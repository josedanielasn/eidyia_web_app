RSpec.describe Batch, type: :model do

    describe 'validations' do

        context 'when creating a batch' do
            let(:batch) { create :batch }
    
            it '1.) is expected to validate the presence of batch_name ' do
                expect(batch).to be_valid
            end
            
            it "2.) is not valid without a batch_name" do
                batch.batch_name = nil
                expect(batch).to_not be_valid
            end

            it "3.) is not valid if batch_name has less than 2 characters" do
                batch.batch_name = "l"
                expect(batch).to_not be_valid
            end

            it "4.) is not valid if batch_name has greater than 20 characters" do
                batch.batch_name = "Lecture 1: Ruby on Rails Basics"
                expect(batch).to_not be_valid
            end
        end
    end  
  end
  
  