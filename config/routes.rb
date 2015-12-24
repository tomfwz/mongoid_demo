Rails.application.routes.draw do
  resources 'people' do
    resources 'articles'
  end

  root 'people#index'
end
