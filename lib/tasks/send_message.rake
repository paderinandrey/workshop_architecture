namespace :karafka do
  namespace :producer do
    desc 'Отправка лайков в топик like_in'
    task like: :environment do
      10.times do
        payload = {
          book_id: Book.ids.sample,
          reader_id: Reader.ids.sample
        }
        Karafka.producer.produce_sync(topic: 'like_in', payload: payload.to_json)
      end
    end
  end
end
