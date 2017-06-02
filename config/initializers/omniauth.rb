Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '305653159856405', 'ddbdb5c1b5543b17534c91b96003de99'
end