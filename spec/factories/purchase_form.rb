FactoryBot.define do
  factory :purchase_form do

    token           { "tok_abcdefghijk00000000000000000" }
    postal          { "503-1264" }
    prefecture_id   { 1 }
    minicipalities  { "養老郡養老町" }
    residence       { "３番地" }
    phone           { "09012345678" }
  end
end