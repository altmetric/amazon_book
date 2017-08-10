require 'spec_helper'

RSpec.describe AmazonBook::Link do
  it 'recognizes a valid amazon book' do
    link = described_class.new('https://www.amazon.co.uk/dp/0262029499/')

    expect(link).to be_book
  end

  it 'correctly recognizes a non-book item' do
    rubber_horse_head_mask_link = described_class.new('https://www.amazon.co.uk/dp/B00JS905Z4')

    expect(rubber_horse_head_mask_link).to_not be_book
  end

  it 'correctly recognizes an unsupported path' do
    rubber_horse_head_mask_link = described_class.new('https://www.amazon.co.uk/amazon_book_reviews/0262029499')

    expect(rubber_horse_head_mask_link).to_not be_book
  end

  it 'extracts an ISBN13 from a book link' do
    link = described_class.new('https://www.amazon.co.uk/dp/0262029499/')

    expect(link.isbn13).to eq('9780262029490')
  end

  it 'does not extract an ISBN13 from a Rubber Horse Head Mask page' do
    link = described_class.new('https://www.amazon.co.uk/dp/B00JS905Z4/')

    expect(link.isbn13).to be_nil
  end

  it 'extracts an ISBN13 from Japanese Amazon' do
    link = described_class.new('https://www.amazon.co.jp/dp/0262029499/')

    expect(link.isbn13).to eq('9780262029490')
  end
end
