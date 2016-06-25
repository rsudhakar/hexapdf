# -*- encoding: utf-8 -*-

require 'hexapdf/font/ttf/table'

module HexaPDF
  module Font
    module TTF

      # Represents a font in the TrueType font file format.
      class Font

        # The default configuration:
        #
        # font.ttf.table_mapping::
        #     The default mapping from table tag as symbol to table class name.
        #
        # font.ttf.cmap.unknown_format::
        #     Action to take when encountering unknown 'cmap' subtables. Can either be :ignore
        #     which ignores them or :raise which raises an error.
        DEFAULT_CONFIG = {
          'font.ttf.table_mapping' => {
            head: 'HexaPDF::Font::TTF::Table::Head',
            cmap: 'HexaPDF::Font::TTF::Table::Cmap',
            hhea: 'HexaPDF::Font::TTF::Table::Hhea',
            hmtx: 'HexaPDF::Font::TTF::Table::Hmtx',
            loca: 'HexaPDF::Font::TTF::Table::Loca',
            maxp: 'HexaPDF::Font::TTF::Table::Maxp',
            name: 'HexaPDF::Font::TTF::Table::Name',
            post: 'HexaPDF::Font::TTF::Table::Post',
            glyf: 'HexaPDF::Font::TTF::Table::Glyf',
            'OS/2': 'HexaPDF::Font::TTF::Table::OS2',
          },
          'font.ttf.cmap.unknown_format' => :ignore,
        }


        # The IO stream associated with this file. If this is +nil+ then the TrueType font wasn't
        # originally read from an IO stream.
        attr_reader :io

        # The configuration for the TTF font.
        attr_reader :config

        # Creates a new TrueType font file object. If an IO object is given, the TTF font data is
        # read from it.
        #
        # The +config+ hash can contain configuration options.
        def initialize(io: nil, config: {})
          @io = io
          @config = DEFAULT_CONFIG.merge(config)
          @tables = {}
        end

        # Returns the table instance for the given tag (a symbol), or +nil+ if no such table exists.
        def [](tag)
          return @tables[tag] if @tables.key?(tag)

          entry = directory.entry(tag.to_s.b)
          entry ? @tables[tag] = table_class(tag).new(self, entry) : nil
        end

        # Adds a new table instance for the given tag (a symbol) to the font if such a table
        # instance doesn't already exist. Returns the table instance for the tag.
        def add_table(tag)
          @tables[tag] ||= table_class(tag).new(self)
        end

        # Returns the font directory.
        def directory
          @directory ||= Table::Directory.new(self, io ? Table::Directory::SELF_ENTRY : nil)
        end

        # Returns the PostScript font name.
        def font_name
          self[:name][:postscript_name].preferred_record
        end

        # Returns the full name of the font.
        def full_name
          self[:name][:font_name].preferred_record
        end

        # Returns the family name of the font.
        def family_name
          self[:name][:font_family].preferred_record
        end

        # Returns the weight of the font.
        def weight
          self[:"OS/2"]&.weight_class || 0
        end

        # Returns the bounding of the font.
        def bounding_box
          self[:head].bbox
        end

        # Returns the cap height of the font.
        def cap_height
          self[:"OS/2"]&.cap_height
        end

        # Returns the x-height of the font.
        def x_height
          self[:"OS/2"]&.x_height
        end

        # Returns the ascender of the font.
        def ascender
          self[:"OS/2"]&.typo_ascender || self[:hhea].ascent
        end

        # Returns the descender of the font.
        def descender
          self[:"OS/2"]&.typo_descender || self[:hhea].descent
        end

        # Returns the italic angle of the font, in degrees counter-clockwise from the vertical.
        def italic_angle
          self[:post].italic_angle.to_f
        end

        # Returns the dominant width of vertical stems.
        #
        # Note: This attribute does not actually exist in TrueType fonts, so it is estimated based
        # on the #weight.
        def dominant_vertical_stem_width
          weight / 5
        end

        private

        # Returns the class that is used for handling tables of the given tag.
        def table_class(tag)
          klass = config['font.ttf.table_mapping'].fetch(tag, 'HexaPDF::Font::TTF::Table')
          ::Object.const_get(klass)
        end

      end

    end
  end
end