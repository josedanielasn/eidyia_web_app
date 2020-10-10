RSpec.describe Session, type: :model do
    describe 'validations' do
        context 'when creating a session' do            
            subject(:session)  {create :session}
            it '1.) is expected to validate the presence of session_name ' do
              expect(session).to be_valid
            end      
            it "2. is not valid without a session_name" do
                session.session_name = nil
                expect(session).to_not be_valid
            end
       end
    end  
  end
  