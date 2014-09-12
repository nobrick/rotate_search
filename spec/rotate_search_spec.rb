require_relative '../lib/rotate_search.rb'
require 'spec_helper'

describe 'rotate search' do
  let(:list) { 10.times.collect { |e| e * 2 } }
  let(:exclusive_set) { list.map { |e| e + 1 }.unshift(-1) }

  describe '#bi_search' do
    it 'finds query' do
      list.each { |q| expect(bi_search(q, list)).to eq(true) }
    end

    it 'does not find non-exist query' do
      exclusive_set.each { |e| expect(bi_search(e, list)).to eq(false) }
    end
  end

  describe '#search' do
    let(:lists) { list.count.times.collect { |i| list[i..-1] + list[0...i] } }

    it 'finds query' do
      lists.each do |list|
        puts "list = #{list}"
        list.each { |q| expect(rotate_search(q, list)).to eq(true) }
      end
    end

    it 'does not find non-exist query' do
      lists.each do |list|
        exclusive_set.each do |query|
          puts "list = #{list}, query = #{query}"
          expect(rotate_search(query, list)).to eq(false)
        end
      end
    end

  end
end
