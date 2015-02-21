my_logger = Logger.new(STDOUT)

$pubnub = Pubnub.new(
    :publish_key   => ENV['PUBNUB_PUBLISH_KEY'],
    :subscribe_key => ENV['PUBNUB_SUBSCRIBE_KEY'],
    :logger => my_logger
)