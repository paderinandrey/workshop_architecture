# frozen_string_literal: true

# Example consumer that prints messages payloads
class LikeConsumer < ApplicationConsumer
  def consume
    likes = messages.map do |message|
      data = message.payload

      Like.new(
        reader_id: data['reader_id'],
        book_id: data['book_id'],
      )
    end

    Like.import!(likes, validate: true, on_duplicate_key_ignore: true) unless likes.empty?

    Rails.logger.tagged("karafka").info("Импортировано #{likes.size} лайков")
  end
end
