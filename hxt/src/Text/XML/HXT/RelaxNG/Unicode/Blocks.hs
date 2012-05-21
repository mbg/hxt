-- ------------------------------------------------------------

{- |
   Module     : Text.XML.HXT.RelaxNG.Unicode.Blocks
   Copyright  : Copyright (C) 2005 Uwe Schmidt
   License    : MIT

   Maintainer : Uwe Schmidt (uwe@fh-wedel.de)
   Stability  : experimental
   Portability: portable
   Version    : $Id$

   Unicode Code Blocks

   don't edit this module
   it's generated from 'http:\/\/www.unicode.org\/Public\/UNIDATA\/Blocks.txt'
-}

-- ------------------------------------------------------------

module Text.XML.HXT.RelaxNG.Unicode.Blocks
  ( codeBlocks )
where

-- ------------------------------------------------------------

codeBlocks        :: [(String, (Char, Char))]
codeBlocks =
    [ ( "BasicLatin",   ( '\x0000', '\x007F') )
    , ( "Latin-1Supplement",    ( '\x0080', '\x00FF') )
    , ( "LatinExtended-A",      ( '\x0100', '\x017F') )
    , ( "LatinExtended-B",      ( '\x0180', '\x024F') )
    , ( "IPAExtensions",        ( '\x0250', '\x02AF') )
    , ( "SpacingModifierLetters",       ( '\x02B0', '\x02FF') )
    , ( "CombiningDiacriticalMarks",    ( '\x0300', '\x036F') )
    , ( "GreekandCoptic",       ( '\x0370', '\x03FF') )
    , ( "Cyrillic",     ( '\x0400', '\x04FF') )
    , ( "CyrillicSupplement",   ( '\x0500', '\x052F') )
    , ( "Armenian",     ( '\x0530', '\x058F') )
    , ( "Hebrew",       ( '\x0590', '\x05FF') )
    , ( "Arabic",       ( '\x0600', '\x06FF') )
    , ( "Syriac",       ( '\x0700', '\x074F') )
    , ( "ArabicSupplement",     ( '\x0750', '\x077F') )
    , ( "Thaana",       ( '\x0780', '\x07BF') )
    , ( "NKo",  ( '\x07C0', '\x07FF') )
    , ( "Samaritan",    ( '\x0800', '\x083F') )
    , ( "Devanagari",   ( '\x0900', '\x097F') )
    , ( "Bengali",      ( '\x0980', '\x09FF') )
    , ( "Gurmukhi",     ( '\x0A00', '\x0A7F') )
    , ( "Gujarati",     ( '\x0A80', '\x0AFF') )
    , ( "Oriya",        ( '\x0B00', '\x0B7F') )
    , ( "Tamil",        ( '\x0B80', '\x0BFF') )
    , ( "Telugu",       ( '\x0C00', '\x0C7F') )
    , ( "Kannada",      ( '\x0C80', '\x0CFF') )
    , ( "Malayalam",    ( '\x0D00', '\x0D7F') )
    , ( "Sinhala",      ( '\x0D80', '\x0DFF') )
    , ( "Thai", ( '\x0E00', '\x0E7F') )
    , ( "Lao",  ( '\x0E80', '\x0EFF') )
    , ( "Tibetan",      ( '\x0F00', '\x0FFF') )
    , ( "Myanmar",      ( '\x1000', '\x109F') )
    , ( "Georgian",     ( '\x10A0', '\x10FF') )
    , ( "HangulJamo",   ( '\x1100', '\x11FF') )
    , ( "Ethiopic",     ( '\x1200', '\x137F') )
    , ( "EthiopicSupplement",   ( '\x1380', '\x139F') )
    , ( "Cherokee",     ( '\x13A0', '\x13FF') )
    , ( "UnifiedCanadianAboriginalSyllabics",   ( '\x1400', '\x167F') )
    , ( "Ogham",        ( '\x1680', '\x169F') )
    , ( "Runic",        ( '\x16A0', '\x16FF') )
    , ( "Tagalog",      ( '\x1700', '\x171F') )
    , ( "Hanunoo",      ( '\x1720', '\x173F') )
    , ( "Buhid",        ( '\x1740', '\x175F') )
    , ( "Tagbanwa",     ( '\x1760', '\x177F') )
    , ( "Khmer",        ( '\x1780', '\x17FF') )
    , ( "Mongolian",    ( '\x1800', '\x18AF') )
    , ( "UnifiedCanadianAboriginalSyllabicsExtended",   ( '\x18B0', '\x18FF') )
    , ( "Limbu",        ( '\x1900', '\x194F') )
    , ( "TaiLe",        ( '\x1950', '\x197F') )
    , ( "NewTaiLue",    ( '\x1980', '\x19DF') )
    , ( "KhmerSymbols", ( '\x19E0', '\x19FF') )
    , ( "Buginese",     ( '\x1A00', '\x1A1F') )
    , ( "TaiTham",      ( '\x1A20', '\x1AAF') )
    , ( "Balinese",     ( '\x1B00', '\x1B7F') )
    , ( "Sundanese",    ( '\x1B80', '\x1BBF') )
    , ( "Lepcha",       ( '\x1C00', '\x1C4F') )
    , ( "OlChiki",      ( '\x1C50', '\x1C7F') )
    , ( "VedicExtensions",      ( '\x1CD0', '\x1CFF') )
    , ( "PhoneticExtensions",   ( '\x1D00', '\x1D7F') )
    , ( "PhoneticExtensionsSupplement", ( '\x1D80', '\x1DBF') )
    , ( "CombiningDiacriticalMarksSupplement",  ( '\x1DC0', '\x1DFF') )
    , ( "LatinExtendedAdditional",      ( '\x1E00', '\x1EFF') )
    , ( "GreekExtended",        ( '\x1F00', '\x1FFF') )
    , ( "GeneralPunctuation",   ( '\x2000', '\x206F') )
    , ( "SuperscriptsandSubscripts",    ( '\x2070', '\x209F') )
    , ( "CurrencySymbols",      ( '\x20A0', '\x20CF') )
    , ( "CombiningDiacriticalMarksforSymbols",  ( '\x20D0', '\x20FF') )
    , ( "LetterlikeSymbols",    ( '\x2100', '\x214F') )
    , ( "NumberForms",  ( '\x2150', '\x218F') )
    , ( "Arrows",       ( '\x2190', '\x21FF') )
    , ( "MathematicalOperators",        ( '\x2200', '\x22FF') )
    , ( "MiscellaneousTechnical",       ( '\x2300', '\x23FF') )
    , ( "ControlPictures",      ( '\x2400', '\x243F') )
    , ( "OpticalCharacterRecognition",  ( '\x2440', '\x245F') )
    , ( "EnclosedAlphanumerics",        ( '\x2460', '\x24FF') )
    , ( "BoxDrawing",   ( '\x2500', '\x257F') )
    , ( "BlockElements",        ( '\x2580', '\x259F') )
    , ( "GeometricShapes",      ( '\x25A0', '\x25FF') )
    , ( "MiscellaneousSymbols", ( '\x2600', '\x26FF') )
    , ( "Dingbats",     ( '\x2700', '\x27BF') )
    , ( "MiscellaneousMathematicalSymbols-A",   ( '\x27C0', '\x27EF') )
    , ( "SupplementalArrows-A", ( '\x27F0', '\x27FF') )
    , ( "BraillePatterns",      ( '\x2800', '\x28FF') )
    , ( "SupplementalArrows-B", ( '\x2900', '\x297F') )
    , ( "MiscellaneousMathematicalSymbols-B",   ( '\x2980', '\x29FF') )
    , ( "SupplementalMathematicalOperators",    ( '\x2A00', '\x2AFF') )
    , ( "MiscellaneousSymbolsandArrows",        ( '\x2B00', '\x2BFF') )
    , ( "Glagolitic",   ( '\x2C00', '\x2C5F') )
    , ( "LatinExtended-C",      ( '\x2C60', '\x2C7F') )
    , ( "Coptic",       ( '\x2C80', '\x2CFF') )
    , ( "GeorgianSupplement",   ( '\x2D00', '\x2D2F') )
    , ( "Tifinagh",     ( '\x2D30', '\x2D7F') )
    , ( "EthiopicExtended",     ( '\x2D80', '\x2DDF') )
    , ( "CyrillicExtended-A",   ( '\x2DE0', '\x2DFF') )
    , ( "SupplementalPunctuation",      ( '\x2E00', '\x2E7F') )
    , ( "CJKRadicalsSupplement",        ( '\x2E80', '\x2EFF') )
    , ( "KangxiRadicals",       ( '\x2F00', '\x2FDF') )
    , ( "IdeographicDescriptionCharacters",     ( '\x2FF0', '\x2FFF') )
    , ( "CJKSymbolsandPunctuation",     ( '\x3000', '\x303F') )
    , ( "Hiragana",     ( '\x3040', '\x309F') )
    , ( "Katakana",     ( '\x30A0', '\x30FF') )
    , ( "Bopomofo",     ( '\x3100', '\x312F') )
    , ( "HangulCompatibilityJamo",      ( '\x3130', '\x318F') )
    , ( "Kanbun",       ( '\x3190', '\x319F') )
    , ( "BopomofoExtended",     ( '\x31A0', '\x31BF') )
    , ( "CJKStrokes",   ( '\x31C0', '\x31EF') )
    , ( "KatakanaPhoneticExtensions",   ( '\x31F0', '\x31FF') )
    , ( "EnclosedCJKLettersandMonths",  ( '\x3200', '\x32FF') )
    , ( "CJKCompatibility",     ( '\x3300', '\x33FF') )
    , ( "CJKUnifiedIdeographsExtensionA",       ( '\x3400', '\x4DBF') )
    , ( "YijingHexagramSymbols",        ( '\x4DC0', '\x4DFF') )
    , ( "CJKUnifiedIdeographs", ( '\x4E00', '\x9FFF') )
    , ( "YiSyllables",  ( '\xA000', '\xA48F') )
    , ( "YiRadicals",   ( '\xA490', '\xA4CF') )
    , ( "Lisu", ( '\xA4D0', '\xA4FF') )
    , ( "Vai",  ( '\xA500', '\xA63F') )
    , ( "CyrillicExtended-B",   ( '\xA640', '\xA69F') )
    , ( "Bamum",        ( '\xA6A0', '\xA6FF') )
    , ( "ModifierToneLetters",  ( '\xA700', '\xA71F') )
    , ( "LatinExtended-D",      ( '\xA720', '\xA7FF') )
    , ( "SylotiNagri",  ( '\xA800', '\xA82F') )
    , ( "CommonIndicNumberForms",       ( '\xA830', '\xA83F') )
    , ( "Phags-pa",     ( '\xA840', '\xA87F') )
    , ( "Saurashtra",   ( '\xA880', '\xA8DF') )
    , ( "DevanagariExtended",   ( '\xA8E0', '\xA8FF') )
    , ( "KayahLi",      ( '\xA900', '\xA92F') )
    , ( "Rejang",       ( '\xA930', '\xA95F') )
    , ( "HangulJamoExtended-A", ( '\xA960', '\xA97F') )
    , ( "Javanese",     ( '\xA980', '\xA9DF') )
    , ( "Cham", ( '\xAA00', '\xAA5F') )
    , ( "MyanmarExtended-A",    ( '\xAA60', '\xAA7F') )
    , ( "TaiViet",      ( '\xAA80', '\xAADF') )
    , ( "MeeteiMayek",  ( '\xABC0', '\xABFF') )
    , ( "HangulSyllables",      ( '\xAC00', '\xD7AF') )
    , ( "HangulJamoExtended-B", ( '\xD7B0', '\xD7FF') )
    , ( "HighSurrogates",       ( '\xD800', '\xDB7F') )
    , ( "HighPrivateUseSurrogates",     ( '\xDB80', '\xDBFF') )
    , ( "LowSurrogates",        ( '\xDC00', '\xDFFF') )
    , ( "PrivateUseArea",       ( '\xE000', '\xF8FF') )
    , ( "CJKCompatibilityIdeographs",   ( '\xF900', '\xFAFF') )
    , ( "AlphabeticPresentationForms",  ( '\xFB00', '\xFB4F') )
    , ( "ArabicPresentationForms-A",    ( '\xFB50', '\xFDFF') )
    , ( "VariationSelectors",   ( '\xFE00', '\xFE0F') )
    , ( "VerticalForms",        ( '\xFE10', '\xFE1F') )
    , ( "CombiningHalfMarks",   ( '\xFE20', '\xFE2F') )
    , ( "CJKCompatibilityForms",        ( '\xFE30', '\xFE4F') )
    , ( "SmallFormVariants",    ( '\xFE50', '\xFE6F') )
    , ( "ArabicPresentationForms-B",    ( '\xFE70', '\xFEFF') )
    , ( "HalfwidthandFullwidthForms",   ( '\xFF00', '\xFFEF') )
    , ( "Specials",     ( '\xFFF0', '\xFFFF') )
    , ( "LinearBSyllabary",     ( '\x10000', '\x1007F') )
    , ( "LinearBIdeograms",     ( '\x10080', '\x100FF') )
    , ( "AegeanNumbers",        ( '\x10100', '\x1013F') )
    , ( "AncientGreekNumbers",  ( '\x10140', '\x1018F') )
    , ( "AncientSymbols",       ( '\x10190', '\x101CF') )
    , ( "PhaistosDisc", ( '\x101D0', '\x101FF') )
    , ( "Lycian",       ( '\x10280', '\x1029F') )
    , ( "Carian",       ( '\x102A0', '\x102DF') )
    , ( "OldItalic",    ( '\x10300', '\x1032F') )
    , ( "Gothic",       ( '\x10330', '\x1034F') )
    , ( "Ugaritic",     ( '\x10380', '\x1039F') )
    , ( "OldPersian",   ( '\x103A0', '\x103DF') )
    , ( "Deseret",      ( '\x10400', '\x1044F') )
    , ( "Shavian",      ( '\x10450', '\x1047F') )
    , ( "Osmanya",      ( '\x10480', '\x104AF') )
    , ( "CypriotSyllabary",     ( '\x10800', '\x1083F') )
    , ( "ImperialAramaic",      ( '\x10840', '\x1085F') )
    , ( "Phoenician",   ( '\x10900', '\x1091F') )
    , ( "Lydian",       ( '\x10920', '\x1093F') )
    , ( "Kharoshthi",   ( '\x10A00', '\x10A5F') )
    , ( "OldSouthArabian",      ( '\x10A60', '\x10A7F') )
    , ( "Avestan",      ( '\x10B00', '\x10B3F') )
    , ( "InscriptionalParthian",        ( '\x10B40', '\x10B5F') )
    , ( "InscriptionalPahlavi", ( '\x10B60', '\x10B7F') )
    , ( "OldTurkic",    ( '\x10C00', '\x10C4F') )
    , ( "RumiNumeralSymbols",   ( '\x10E60', '\x10E7F') )
    , ( "Kaithi",       ( '\x11080', '\x110CF') )
    , ( "Cuneiform",    ( '\x12000', '\x123FF') )
    , ( "CuneiformNumbersandPunctuation",       ( '\x12400', '\x1247F') )
    , ( "EgyptianHieroglyphs",  ( '\x13000', '\x1342F') )
    , ( "ByzantineMusicalSymbols",      ( '\x1D000', '\x1D0FF') )
    , ( "MusicalSymbols",       ( '\x1D100', '\x1D1FF') )
    , ( "AncientGreekMusicalNotation",  ( '\x1D200', '\x1D24F') )
    , ( "TaiXuanJingSymbols",   ( '\x1D300', '\x1D35F') )
    , ( "CountingRodNumerals",  ( '\x1D360', '\x1D37F') )
    , ( "MathematicalAlphanumericSymbols",      ( '\x1D400', '\x1D7FF') )
    , ( "MahjongTiles", ( '\x1F000', '\x1F02F') )
    , ( "DominoTiles",  ( '\x1F030', '\x1F09F') )
    , ( "EnclosedAlphanumericSupplement",       ( '\x1F100', '\x1F1FF') )
    , ( "EnclosedIdeographicSupplement",        ( '\x1F200', '\x1F2FF') )
    , ( "CJKUnifiedIdeographsExtensionB",       ( '\x20000', '\x2A6DF') )
    , ( "CJKUnifiedIdeographsExtensionC",       ( '\x2A700', '\x2B73F') )
    , ( "CJKCompatibilityIdeographsSupplement", ( '\x2F800', '\x2FA1F') )
    , ( "Tags", ( '\xE0000', '\xE007F') )
    , ( "VariationSelectorsSupplement", ( '\xE0100', '\xE01EF') )
    , ( "SupplementaryPrivateUseArea-A",        ( '\xF0000', '\xFFFFF') )
    , ( "SupplementaryPrivateUseArea-B",        ( '\x100000', '\x10FFFF') )
    ]

-- ------------------------------------------------------------
