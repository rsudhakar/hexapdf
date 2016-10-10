# -*- encoding: utf-8 -*-
#
#--
# This file is part of HexaPDF.
#
# HexaPDF - A Versatile PDF Creation and Manipulation Library For Ruby
# Copyright (C) 2016 Thomas Leitner
#
# HexaPDF is free software: you can redistribute it and/or modify it
# under the terms of the GNU Affero General Public License version 3 as
# published by the Free Software Foundation with the addition of the
# following permission added to Section 15 as permitted in Section 7(a):
# FOR ANY PART OF THE COVERED WORK IN WHICH THE COPYRIGHT IS OWNED BY
# THOMAS LEITNER, THOMAS LEITNER DISCLAIMS THE WARRANTY OF NON
# INFRINGEMENT OF THIRD PARTY RIGHTS.
#
# HexaPDF is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public
# License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with HexaPDF. If not, see <http://www.gnu.org/licenses/>.
#
# The interactive user interfaces in modified source and object code
# versions of HexaPDF must display Appropriate Legal Notices, as required
# under Section 5 of the GNU Affero General Public License version 3.
#
# In accordance with Section 7(b) of the GNU Affero General Public
# License, a covered work must retain the producer line in every PDF that
# is created or manipulated using HexaPDF.
#++

require 'hexapdf/dictionary'

module HexaPDF
  module Type

    # Represents a graphics state parameter dictionary.
    #
    # This dictionary can be used to define most graphics state parameters that are available.
    # Some parameters can only be set by an operator, some only by the dictionary but most by
    # both.
    #
    # See: PDF1.7 s8.4.5, s8.1
    class GraphicsStateParameter < Dictionary

      define_field :Type,          type: Symbol, required: true, default: :ExtGState
      define_field :LW,            type: Numeric, version: "1.3"
      define_field :LC,            type: Integer, version: "1.3"
      define_field :LJ,            type: Integer, version: "1.3"
      define_field :ML,            type: Numeric, version: "1.3"
      define_field :D,             type: Array, version: "1.3"
      define_field :RI,            type: Symbol, version: "1.3"
      define_field :OP,            type: Boolean
      define_field :op,            type: Boolean, version: "1.3"
      define_field :OPM,           type: Integer, version: "1.3"
      define_field :Font,          type: Array, version: "1.3"
      define_field :BG,            type: [Dictionary, Hash, Stream]
      define_field :BG2,           type: [Dictionary, Hash, Stream, Symbol], version: "1.3"
      define_field :UCR,           type: [Dictionary, Hash, Stream]
      define_field :UCR2,          type: [Dictionary, Hash, Stream, Symbol], version: "1.3"
      define_field :TR,            type: [Dictionary, Hash, Stream, Array, Symbol]
      define_field :TR2,           type: [Dictionary, Hash, Stream, Array, Symbol], version: "1.3"
      define_field :HT,            type: [Dictionary, Hash, Stream, Symbol]
      define_field :FL,            type: Numeric, version: "1.3"
      define_field :SM,            type: Numeric, version: "1.3"
      define_field :SA,            type: Boolean
      define_field :BM,            type: [Symbol, Array], version: "1.4"
      define_field :SMask,         type: [Dictionary, Hash, Symbol], version: "1.4"
      define_field :CA,            type: Numeric, version: "1.4"
      define_field :ca,            type: Numeric, version: "1.4"
      define_field :AIS,           type: Boolean, version: "1.4"
      define_field :TK,            type: Boolean, version: "1.4"

    end

  end
end
