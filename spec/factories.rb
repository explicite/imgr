FactoryGirl.define do 
	factory :user do
		name 		"Jan Paw"
		email 		"jan@paw.com"
		password 	"foobar"
		password_confirmation "foobar"
  	end
end