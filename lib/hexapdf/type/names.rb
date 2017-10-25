# -*- encoding: utf-8 -*-
#
#--
# This file is part of HexaPDF.
#
# HexaPDF - A Versatile PDF Creation and Manipulation Library For Ruby
# Copyright (C) 2014-2017 Thomas Leitner
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
require 'hexapdf/name_tree_node'

module HexaPDF
  module Type

    # Represents the PDF's names dictionary which associates names with data for various purposes.
    #
    # Each field corresponds to a name tree that holds the information and can be used to find,
    # add or delete an entry.
    #
    # This dictionary is linked via the /Names entry from the HexaPDF::Catalog.
    #
    # See: PDF1.7 s7.7.4, HexaPDF::Catalog, HexaPDF::NameTreeNode
    class Names < Dictionary

      define_type :XXNames

      define_field :Dests,                  type: NameTreeNode, version: '1.2'
      define_field :AP,                     type: NameTreeNode, version: '1.3'
      define_field :JavaScript,             type: NameTreeNode, version: '1.3'
      define_field :Pages,                  type: NameTreeNode, version: '1.3'
      define_field :Templates,              type: NameTreeNode, version: '1.3'
      define_field :IDS,                    type: NameTreeNode, version: '1.3'
      define_field :URLS,                   type: NameTreeNode, version: '1.3'
      define_field :EmbeddedFiles,          type: NameTreeNode, version: '1.4'
      define_field :AlternatePresentations, type: NameTreeNode, version: '1.4'
      define_field :Renditions,             type: NameTreeNode, version: '1.5'

    end

  end
end
