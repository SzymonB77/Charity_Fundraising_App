# frozen_string_literal: true

require 'pagy/extras/headers'
require 'pagy/extras/items'
require 'pagy/extras/overflow'

Pagy::DEFAULT[:items] = 8
Pagy::DEFAULT[:overflow] = :empty_page
Pagy::DEFAULT.freeze
