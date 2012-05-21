-- ------------------------------------------------------------

{- |
   Module     : Text.XML.HXT.DOM.Unicode
   Copyright  : Copyright (C) 2005-2008 Uwe Schmidt
   License    : MIT

   Maintainer : Uwe Schmidt (uwe@fh-wedel.de)
   Stability  : experimental
   Portability: portable

   Unicode and UTF-8 Conversion Functions

-}

-- ------------------------------------------------------------

module Text.XML.HXT.DOM.Unicode
    (
     -- * Unicode Type declarations
     Unicode,
     UString,
     UTF8Char,
     UTF8String,
     UStringWithErrors,
     DecodingFct,
     DecodingFctEmbedErrors,

      -- * XML char predicates

      isXmlChar
    , isXmlLatin1Char
    , isXmlSpaceChar
    , isXml11SpaceChar
    , isXmlNameChar
    , isXmlNameStartChar
    , isXmlNCNameChar
    , isXmlNCNameStartChar
    , isXmlPubidChar
    , isXmlLetter
    , isXmlBaseChar
    , isXmlIdeographicChar
    , isXmlCombiningChar
    , isXmlDigit
    , isXmlExtender
    , isXmlControlOrPermanentlyUndefined

      -- * UTF-8 and Unicode conversion functions
    , utf8ToUnicode
    , utf8ToUnicodeEmbedErrors
    , latin1ToUnicode
    , ucs2ToUnicode
    , ucs2BigEndianToUnicode
    , ucs2LittleEndianToUnicode
    , utf16beToUnicode
    , utf16leToUnicode

    , unicodeCharToUtf8

    , unicodeToUtf8
    , unicodeToXmlEntity
    , unicodeToLatin1
    , unicodeRemoveNoneAscii
    , unicodeRemoveNoneLatin1

    , intToCharRef
    , intToCharRefHex

    , getDecodingFct
    , getDecodingFctEmbedErrors
    , getOutputEncodingFct

    , normalizeNL
    , guessEncoding
    )
where

import Data.Char( toUpper )

import Text.XML.HXT.DOM.Util ( swap, partitionEither )

import Text.XML.HXT.DOM.IsoLatinTables
import Text.XML.HXT.DOM.UTF8Decoding    ( decodeUtf8, decodeUtf8EmbedErrors )
import Text.XML.HXT.DOM.Util            ( intToHexString )
import Text.XML.HXT.DOM.XmlKeywords

-- ------------------------------------------------------------

-- | Unicode is represented as the Char type
--   Precondition for this is the support of Unicode character range
--   in the compiler (e.g. ghc but not hugs)

type Unicode    = Char

-- | the type for Unicode strings

type UString    = [Unicode]

-- | UTF-8 charachters are represented by the Char type

type UTF8Char   = Char

-- | UTF-8 strings are implemented as Haskell strings

type UTF8String = String

-- | Decoding function with a pair containing the result string and a list of decoding errors as result

type DecodingFct = String -> (UString, [String])

type UStringWithErrors = [Either String Char]

-- | Decoding function where decoding errors are interleaved with decoded characters

type DecodingFctEmbedErrors = String -> UStringWithErrors

-- ------------------------------------------------------------
--
-- Unicode predicates

-- |
-- test for a legal 1 byte XML char

is1ByteXmlChar          :: Unicode -> Bool
is1ByteXmlChar c
    = c < '\x80'
      && ( c >= ' '
           ||
           c == '\n'
           ||
           c == '\t'
           ||
           c == '\r'
         )

-- |
-- test for a legal latin1 XML char

isXmlLatin1Char         :: Unicode -> Bool
isXmlLatin1Char i
    = is1ByteXmlChar i
      ||
      (i >= '\x80' && i <= '\xff')

-- ------------------------------------------------------------

-- |
-- conversion from Unicode strings (UString) to UTF8 encoded strings.

unicodeToUtf8           :: UString -> UTF8String
unicodeToUtf8           = concatMap unicodeCharToUtf8

-- |
-- conversion from Unicode (Char) to a UTF8 encoded string.

unicodeCharToUtf8       :: Unicode -> UTF8String
unicodeCharToUtf8 c
    | i >= 0          && i <= 0x0000007F        -- 1 byte UTF8 (7 bits)
        = [ toEnum i ]
    | i >= 0x00000080 && i <= 0x000007FF        -- 2 byte UTF8 (5 + 6 bits)
        = [ toEnum (0xC0 + i `div` 0x40)
          , toEnum (0x80 + i                  `mod` 0x40)
          ]
    | i >= 0x00000800 && i <= 0x0000FFFF        -- 3 byte UTF8 (4 + 6 + 6 bits)
        = [ toEnum (0xE0 +  i `div`   0x1000)
          , toEnum (0x80 + (i `div`     0x40) `mod` 0x40)
          , toEnum (0x80 +  i                 `mod` 0x40)
          ]
    | i >= 0x00010000 && i <= 0x001FFFFF        -- 4 byte UTF8 (3 + 6 + 6 + 6 bits)
        = [ toEnum (0xF0 +  i `div`    0x40000)
          , toEnum (0x80 + (i `div`     0x1000) `mod` 0x40)
          , toEnum (0x80 + (i `div`       0x40) `mod` 0x40)
          , toEnum (0x80 +  i                   `mod` 0x40)
          ]
    | i >= 0x00200000 && i <= 0x03FFFFFF        -- 5 byte UTF8 (2 + 6 + 6 + 6 + 6 bits)
        = [ toEnum (0xF8 +  i `div`  0x1000000)
          , toEnum (0x80 + (i `div`    0x40000) `mod` 0x40)
          , toEnum (0x80 + (i `div`     0x1000) `mod` 0x40)
          , toEnum (0x80 + (i `div`       0x40) `mod` 0x40)
          , toEnum (0x80 +  i                   `mod` 0x40)
          ]
    | i >= 0x04000000 && i <= 0x7FFFFFFF        -- 6 byte UTF8 (1 + 6 + 6 + 6 + 6 + 6 bits)
        = [ toEnum (0xFC +  i `div` 0x40000000)
          , toEnum (0x80 + (i `div`  0x1000000) `mod` 0x40)
          , toEnum (0x80 + (i `div`    0x40000) `mod` 0x40)
          , toEnum (0x80 + (i `div`     0x1000) `mod` 0x40)
          , toEnum (0x80 + (i `div`       0x40) `mod` 0x40)
          , toEnum (0x80 +  i                   `mod` 0x40)
          ]
    | otherwise                                 -- other values not supported
        = error ("unicodeCharToUtf8: illegal integer argument " ++ show i)
    where
    i = fromEnum c

-- ------------------------------------------------------------

-- |
-- checking for valid XML characters

isXmlChar               :: Unicode -> Bool
isXmlChar c
    = isInList c
      [ ('\x0009', '\x000A')
      , ('\x000D', '\x000D')
      , ('\x0020', '\xD7FF')
      , ('\xE000', '\xFFFD')
      , ('\x10000', '\x10FFFF')
      ]

-- |
-- checking for XML space character: \\\n, \\\r, \\\t and \" \"

isXmlSpaceChar          :: Unicode -> Bool
isXmlSpaceChar c
    = c `elem` ['\x20', '\x09', '\x0D', '\x0A']

-- |
-- checking for XML1.1 space character: additional space 0x85 and 0x2028
--
-- see also : 'isXmlSpaceChar'

isXml11SpaceChar                :: Unicode -> Bool
isXml11SpaceChar c
    = c `elem` ['\x20', '\x09', '\x0D', '\x0A', '\x85', '\x2028']

-- |
-- checking for XML name character

isXmlNameChar           :: Unicode -> Bool
isXmlNameChar c
    = isXmlLetter c
      ||
      isXmlDigit c
      ||
      (c == '\x2D' || c == '\x2E')              -- '-' | '.'
      ||
      (c == '\x3A' || c == '\x5F')              -- Letter | ':' | '_'
      ||
      isXmlCombiningChar c
      ||
      isXmlExtender c

-- |
-- checking for XML name start character
--
-- see also : 'isXmlNameChar'

isXmlNameStartChar              :: Unicode -> Bool
isXmlNameStartChar c
    = isXmlLetter c
      ||
      (c == '\x3A' || c == '\x5F')              -- Letter | ':' | '_'

-- |
-- checking for XML NCName character: no \":\" allowed
--
-- see also : 'isXmlNameChar'

isXmlNCNameChar                 :: Unicode -> Bool
isXmlNCNameChar c
    = c /= '\x3A'
      &&
      isXmlNameChar c

-- |
-- checking for XML NCName start character: no \":\" allowed
--
-- see also : 'isXmlNameChar', 'isXmlNCNameChar'

isXmlNCNameStartChar            :: Unicode -> Bool
isXmlNCNameStartChar c
    = c /= '\x3A'
      &&
      isXmlNameStartChar c

-- |
-- checking for XML public id character

isXmlPubidChar          :: Unicode -> Bool
isXmlPubidChar c
    = isInList c [ ('0', '9')
                 , ('A', 'Z')
                 , ('a', 'z')
                 ]
      ||
      ( c `elem` " \r\n-'()+,./:=?;!*#@$_%" )

-- |
-- checking for XML letter

isXmlLetter             :: Unicode -> Bool
isXmlLetter c
    = isXmlBaseChar c
      ||
      isXmlIdeographicChar c

-- |
-- checking for XML base charater

isXmlBaseChar           :: Unicode -> Bool
isXmlBaseChar c
    = isInList c
      [ ('\x0041', '\x005A')
      , ('\x0061', '\x007A')
      , ('\x00C0', '\x00D6')
      , ('\x00D8', '\x00F6')
      , ('\x00F8', '\x0131')
      , ('\x0134', '\x013E')
      , ('\x0141', '\x0148')
      , ('\x014A', '\x017E')
      , ('\x0180', '\x01C3')
      , ('\x01CD', '\x01F0')
      , ('\x01F4', '\x01F5')
      , ('\x01FA', '\x0217')
      , ('\x0250', '\x02A8')
      , ('\x02BB', '\x02C1')
      , ('\x0386', '\x0386')
      , ('\x0388', '\x038A')
      , ('\x038C', '\x038C')
      , ('\x038E', '\x03A1')
      , ('\x03A3', '\x03CE')
      , ('\x03D0', '\x03D6')
      , ('\x03DA', '\x03DA')
      , ('\x03DC', '\x03DC')
      , ('\x03DE', '\x03DE')
      , ('\x03E0', '\x03E0')
      , ('\x03E2', '\x03F3')
      , ('\x0401', '\x040C')
      , ('\x040E', '\x044F')
      , ('\x0451', '\x045C')
      , ('\x045E', '\x0481')
      , ('\x0490', '\x04C4')
      , ('\x04C7', '\x04C8')
      , ('\x04CB', '\x04CC')
      , ('\x04D0', '\x04EB')
      , ('\x04EE', '\x04F5')
      , ('\x04F8', '\x04F9')
      , ('\x0531', '\x0556')
      , ('\x0559', '\x0559')
      , ('\x0561', '\x0586')
      , ('\x05D0', '\x05EA')
      , ('\x05F0', '\x05F2')
      , ('\x0621', '\x063A')
      , ('\x0641', '\x064A')
      , ('\x0671', '\x06B7')
      , ('\x06BA', '\x06BE')
      , ('\x06C0', '\x06CE')
      , ('\x06D0', '\x06D3')
      , ('\x06D5', '\x06D5')
      , ('\x06E5', '\x06E6')
      , ('\x0905', '\x0939')
      , ('\x093D', '\x093D')
      , ('\x0958', '\x0961')
      , ('\x0985', '\x098C')
      , ('\x098F', '\x0990')
      , ('\x0993', '\x09A8')
      , ('\x09AA', '\x09B0')
      , ('\x09B2', '\x09B2')
      , ('\x09B6', '\x09B9')
      , ('\x09DC', '\x09DD')
      , ('\x09DF', '\x09E1')
      , ('\x09F0', '\x09F1')
      , ('\x0A05', '\x0A0A')
      , ('\x0A0F', '\x0A10')
      , ('\x0A13', '\x0A28')
      , ('\x0A2A', '\x0A30')
      , ('\x0A32', '\x0A33')
      , ('\x0A35', '\x0A36')
      , ('\x0A38', '\x0A39')
      , ('\x0A59', '\x0A5C')
      , ('\x0A5E', '\x0A5E')
      , ('\x0A72', '\x0A74')
      , ('\x0A85', '\x0A8B')
      , ('\x0A8D', '\x0A8D')
      , ('\x0A8F', '\x0A91')
      , ('\x0A93', '\x0AA8')
      , ('\x0AAA', '\x0AB0')
      , ('\x0AB2', '\x0AB3')
      , ('\x0AB5', '\x0AB9')
      , ('\x0ABD', '\x0ABD')
      , ('\x0AE0', '\x0AE0')
      , ('\x0B05', '\x0B0C')
      , ('\x0B0F', '\x0B10')
      , ('\x0B13', '\x0B28')
      , ('\x0B2A', '\x0B30')
      , ('\x0B32', '\x0B33')
      , ('\x0B36', '\x0B39')
      , ('\x0B3D', '\x0B3D')
      , ('\x0B5C', '\x0B5D')
      , ('\x0B5F', '\x0B61')
      , ('\x0B85', '\x0B8A')
      , ('\x0B8E', '\x0B90')
      , ('\x0B92', '\x0B95')
      , ('\x0B99', '\x0B9A')
      , ('\x0B9C', '\x0B9C')
      , ('\x0B9E', '\x0B9F')
      , ('\x0BA3', '\x0BA4')
      , ('\x0BA8', '\x0BAA')
      , ('\x0BAE', '\x0BB5')
      , ('\x0BB7', '\x0BB9')
      , ('\x0C05', '\x0C0C')
      , ('\x0C0E', '\x0C10')
      , ('\x0C12', '\x0C28')
      , ('\x0C2A', '\x0C33')
      , ('\x0C35', '\x0C39')
      , ('\x0C60', '\x0C61')
      , ('\x0C85', '\x0C8C')
      , ('\x0C8E', '\x0C90')
      , ('\x0C92', '\x0CA8')
      , ('\x0CAA', '\x0CB3')
      , ('\x0CB5', '\x0CB9')
      , ('\x0CDE', '\x0CDE')
      , ('\x0CE0', '\x0CE1')
      , ('\x0D05', '\x0D0C')
      , ('\x0D0E', '\x0D10')
      , ('\x0D12', '\x0D28')
      , ('\x0D2A', '\x0D39')
      , ('\x0D60', '\x0D61')
      , ('\x0E01', '\x0E2E')
      , ('\x0E30', '\x0E30')
      , ('\x0E32', '\x0E33')
      , ('\x0E40', '\x0E45')
      , ('\x0E81', '\x0E82')
      , ('\x0E84', '\x0E84')
      , ('\x0E87', '\x0E88')
      , ('\x0E8A', '\x0E8A')
      , ('\x0E8D', '\x0E8D')
      , ('\x0E94', '\x0E97')
      , ('\x0E99', '\x0E9F')
      , ('\x0EA1', '\x0EA3')
      , ('\x0EA5', '\x0EA5')
      , ('\x0EA7', '\x0EA7')
      , ('\x0EAA', '\x0EAB')
      , ('\x0EAD', '\x0EAE')
      , ('\x0EB0', '\x0EB0')
      , ('\x0EB2', '\x0EB3')
      , ('\x0EBD', '\x0EBD')
      , ('\x0EC0', '\x0EC4')
      , ('\x0F40', '\x0F47')
      , ('\x0F49', '\x0F69')
      , ('\x10A0', '\x10C5')
      , ('\x10D0', '\x10F6')
      , ('\x1100', '\x1100')
      , ('\x1102', '\x1103')
      , ('\x1105', '\x1107')
      , ('\x1109', '\x1109')
      , ('\x110B', '\x110C')
      , ('\x110E', '\x1112')
      , ('\x113C', '\x113C')
      , ('\x113E', '\x113E')
      , ('\x1140', '\x1140')
      , ('\x114C', '\x114C')
      , ('\x114E', '\x114E')
      , ('\x1150', '\x1150')
      , ('\x1154', '\x1155')
      , ('\x1159', '\x1159')
      , ('\x115F', '\x1161')
      , ('\x1163', '\x1163')
      , ('\x1165', '\x1165')
      , ('\x1167', '\x1167')
      , ('\x1169', '\x1169')
      , ('\x116D', '\x116E')
      , ('\x1172', '\x1173')
      , ('\x1175', '\x1175')
      , ('\x119E', '\x119E')
      , ('\x11A8', '\x11A8')
      , ('\x11AB', '\x11AB')
      , ('\x11AE', '\x11AF')
      , ('\x11B7', '\x11B8')
      , ('\x11BA', '\x11BA')
      , ('\x11BC', '\x11C2')
      , ('\x11EB', '\x11EB')
      , ('\x11F0', '\x11F0')
      , ('\x11F9', '\x11F9')
      , ('\x1E00', '\x1E9B')
      , ('\x1EA0', '\x1EF9')
      , ('\x1F00', '\x1F15')
      , ('\x1F18', '\x1F1D')
      , ('\x1F20', '\x1F45')
      , ('\x1F48', '\x1F4D')
      , ('\x1F50', '\x1F57')
      , ('\x1F59', '\x1F59')
      , ('\x1F5B', '\x1F5B')
      , ('\x1F5D', '\x1F5D')
      , ('\x1F5F', '\x1F7D')
      , ('\x1F80', '\x1FB4')
      , ('\x1FB6', '\x1FBC')
      , ('\x1FBE', '\x1FBE')
      , ('\x1FC2', '\x1FC4')
      , ('\x1FC6', '\x1FCC')
      , ('\x1FD0', '\x1FD3')
      , ('\x1FD6', '\x1FDB')
      , ('\x1FE0', '\x1FEC')
      , ('\x1FF2', '\x1FF4')
      , ('\x1FF6', '\x1FFC')
      , ('\x2126', '\x2126')
      , ('\x212A', '\x212B')
      , ('\x212E', '\x212E')
      , ('\x2180', '\x2182')
      , ('\x3041', '\x3094')
      , ('\x30A1', '\x30FA')
      , ('\x3105', '\x312C')
      , ('\xAC00', '\xD7A3')
      ]

-- |
-- checking for XML ideographic charater

isXmlIdeographicChar    :: Unicode -> Bool
isXmlIdeographicChar c
    = isInList c
      [ ('\x3007', '\x3007')
      , ('\x3021', '\x3029')
      , ('\x4E00', '\x9FA5')
      ]

-- |
-- checking for XML combining charater

isXmlCombiningChar      :: Unicode -> Bool
isXmlCombiningChar c
    = isInList c
      [ ('\x0300', '\x0345')
      , ('\x0360', '\x0361')
      , ('\x0483', '\x0486')
      , ('\x0591', '\x05A1')
      , ('\x05A3', '\x05B9')
      , ('\x05BB', '\x05BD')
      , ('\x05BF', '\x05BF')
      , ('\x05C1', '\x05C2')
      , ('\x05C4', '\x05C4')
      , ('\x064B', '\x0652')
      , ('\x0670', '\x0670')
      , ('\x06D6', '\x06DC')
      , ('\x06DD', '\x06DF')
      , ('\x06E0', '\x06E4')
      , ('\x06E7', '\x06E8')
      , ('\x06EA', '\x06ED')
      , ('\x0901', '\x0903')
      , ('\x093C', '\x093C')
      , ('\x093E', '\x094C')
      , ('\x094D', '\x094D')
      , ('\x0951', '\x0954')
      , ('\x0962', '\x0963')
      , ('\x0981', '\x0983')
      , ('\x09BC', '\x09BC')
      , ('\x09BE', '\x09BE')
      , ('\x09BF', '\x09BF')
      , ('\x09C0', '\x09C4')
      , ('\x09C7', '\x09C8')
      , ('\x09CB', '\x09CD')
      , ('\x09D7', '\x09D7')
      , ('\x09E2', '\x09E3')
      , ('\x0A02', '\x0A02')
      , ('\x0A3C', '\x0A3C')
      , ('\x0A3E', '\x0A3E')
      , ('\x0A3F', '\x0A3F')
      , ('\x0A40', '\x0A42')
      , ('\x0A47', '\x0A48')
      , ('\x0A4B', '\x0A4D')
      , ('\x0A70', '\x0A71')
      , ('\x0A81', '\x0A83')
      , ('\x0ABC', '\x0ABC')
      , ('\x0ABE', '\x0AC5')
      , ('\x0AC7', '\x0AC9')
      , ('\x0ACB', '\x0ACD')
      , ('\x0B01', '\x0B03')
      , ('\x0B3C', '\x0B3C')
      , ('\x0B3E', '\x0B43')
      , ('\x0B47', '\x0B48')
      , ('\x0B4B', '\x0B4D')
      , ('\x0B56', '\x0B57')
      , ('\x0B82', '\x0B83')
      , ('\x0BBE', '\x0BC2')
      , ('\x0BC6', '\x0BC8')
      , ('\x0BCA', '\x0BCD')
      , ('\x0BD7', '\x0BD7')
      , ('\x0C01', '\x0C03')
      , ('\x0C3E', '\x0C44')
      , ('\x0C46', '\x0C48')
      , ('\x0C4A', '\x0C4D')
      , ('\x0C55', '\x0C56')
      , ('\x0C82', '\x0C83')
      , ('\x0CBE', '\x0CC4')
      , ('\x0CC6', '\x0CC8')
      , ('\x0CCA', '\x0CCD')
      , ('\x0CD5', '\x0CD6')
      , ('\x0D02', '\x0D03')
      , ('\x0D3E', '\x0D43')
      , ('\x0D46', '\x0D48')
      , ('\x0D4A', '\x0D4D')
      , ('\x0D57', '\x0D57')
      , ('\x0E31', '\x0E31')
      , ('\x0E34', '\x0E3A')
      , ('\x0E47', '\x0E4E')
      , ('\x0EB1', '\x0EB1')
      , ('\x0EB4', '\x0EB9')
      , ('\x0EBB', '\x0EBC')
      , ('\x0EC8', '\x0ECD')
      , ('\x0F18', '\x0F19')
      , ('\x0F35', '\x0F35')
      , ('\x0F37', '\x0F37')
      , ('\x0F39', '\x0F39')
      , ('\x0F3E', '\x0F3E')
      , ('\x0F3F', '\x0F3F')
      , ('\x0F71', '\x0F84')
      , ('\x0F86', '\x0F8B')
      , ('\x0F90', '\x0F95')
      , ('\x0F97', '\x0F97')
      , ('\x0F99', '\x0FAD')
      , ('\x0FB1', '\x0FB7')
      , ('\x0FB9', '\x0FB9')
      , ('\x20D0', '\x20DC')
      , ('\x20E1', '\x20E1')
      , ('\x302A', '\x302F')
      , ('\x3099', '\x3099')
      , ('\x309A', '\x309A')
      ]

-- |
-- checking for XML digit

isXmlDigit              :: Unicode -> Bool
isXmlDigit c
    = isInList c
      [ ('\x0030', '\x0039')
      , ('\x0660', '\x0669')
      , ('\x06F0', '\x06F9')
      , ('\x0966', '\x096F')
      , ('\x09E6', '\x09EF')
      , ('\x0A66', '\x0A6F')
      , ('\x0AE6', '\x0AEF')
      , ('\x0B66', '\x0B6F')
      , ('\x0BE7', '\x0BEF')
      , ('\x0C66', '\x0C6F')
      , ('\x0CE6', '\x0CEF')
      , ('\x0D66', '\x0D6F')
      , ('\x0E50', '\x0E59')
      , ('\x0ED0', '\x0ED9')
      , ('\x0F20', '\x0F29')
      ]

-- |
-- checking for XML extender

isXmlExtender           :: Unicode -> Bool
isXmlExtender c
    = isInList c
      [ ('\x00B7', '\x00B7')
      , ('\x02D0', '\x02D0')
      , ('\x02D1', '\x02D1')
      , ('\x0387', '\x0387')
      , ('\x0640', '\x0640')
      , ('\x0E46', '\x0E46')
      , ('\x0EC6', '\x0EC6')
      , ('\x3005', '\x3005')
      , ('\x3031', '\x3035')
      , ('\x309D', '\x309E')
      , ('\x30FC', '\x30FE')
      ]

-- |
-- checking for XML control or permanently discouraged char
--
-- see Errata to XML1.0 (http:\/\/www.w3.org\/XML\/xml-V10-2e-errata) No 46
--
-- Document authors are encouraged to avoid "compatibility characters",
-- as defined in section 6.8 of [Unicode] (see also D21 in section 3.6 of [Unicode3]).
-- The characters defined in the following ranges are also discouraged.
-- They are either control characters or permanently undefined Unicode characters:


isXmlControlOrPermanentlyUndefined      :: Unicode -> Bool
isXmlControlOrPermanentlyUndefined c
    = isInList c
      [ ('\x7F', '\x84')
      , ('\x86', '\x9F')
      , ('\xFDD0', '\xFDDF')
      , ('\x1FFFE', '\x1FFFF')
      , ('\x2FFFE', '\x2FFFF')
      , ('\x3FFFE', '\x3FFFF')
      , ('\x4FFFE', '\x4FFFF')
      , ('\x5FFFE', '\x5FFFF')
      , ('\x6FFFE', '\x6FFFF')
      , ('\x7FFFE', '\x7FFFF')
      , ('\x8FFFE', '\x8FFFF')
      , ('\x9FFFE', '\x9FFFF')
      , ('\xAFFFE', '\xAFFFF')
      , ('\xBFFFE', '\xBFFFF')
      , ('\xCFFFE', '\xCFFFF')
      , ('\xDFFFE', '\xDFFFF')
      , ('\xEFFFE', '\xEFFFF')
      , ('\xFFFFE', '\xFFFFF')
      , ('\x10FFFE', '\x10FFFF')
      ]

-- ------------------------------------------------------------

isInList        :: Unicode -> [(Unicode, Unicode)] -> Bool
isInList i =
   foldr (\(lb, ub) b -> i >= lb && (i <= ub || b)) False
   {- The expression (i>=lb && i<=ub) || b would work more generally,
      but in a sorted list, the above one aborts the computation as early as possible. -}

{-
isInList'       :: Unicode -> [(Unicode, Unicode)] -> Bool
isInList' i ((lb, ub) : l)
    | i <  lb   = False
    | i <= ub   = True
    | otherwise = isInList' i l

isInList' _ []
    = False

{- works, but is not so fast -}
isInList''      :: Unicode -> [(Unicode, Unicode)] -> Bool
isInList'' i = any (flip isInRange i)

-- move to an Utility module?
isInRange       :: Ord a => (a,a) -> a -> Bool
isInRange (l,r) x = l<=x && x<=r

propIsInList :: Bool
propIsInList =
   all
     (\c -> let dict = [ ('\x0041', '\x005A'), ('\x0061', '\x007A') ]
                b0 = isInList c dict
                b1 = isInList' c dict
                b2 = isInList'' c dict
            in  b0 == b1 && b0 == b2)
     ['\x00'..'\x100']
-}

-- ------------------------------------------------------------

-- |
-- code conversion from latin1 to Unicode

latin1ToUnicode :: String -> UString
latin1ToUnicode = id

latinToUnicode  :: [(Char, Char)] -> String -> UString
latinToUnicode tt
    = map charToUni
    where
    charToUni c =
       foldr (\(src,dst) r ->
          case compare c src of
             EQ -> dst
             LT -> c {- not found in table -}
             GT -> r) c tt

-- | conversion from ASCII to unicode with check for legal ASCII char set
--
-- Structure of decoding function copied from 'Data.Char.UTF8.decode'.

decodeAscii     :: DecodingFct
decodeAscii
    = swap . partitionEither . decodeAsciiEmbedErrors

decodeAsciiEmbedErrors  :: String -> UStringWithErrors
decodeAsciiEmbedErrors str
    = map (\(c,pos) -> if isValid c
                         then Right c
                         else Left (toErrStr c pos)) posStr
    where
    posStr = zip str [(0::Int)..]
    toErrStr errChr pos
        = " at input position " ++ show pos ++ ": none ASCII char " ++ show errChr
    isValid x = x < '\x80'

-- |
-- UCS-2 big endian to Unicode conversion

ucs2BigEndianToUnicode  :: String -> UString

ucs2BigEndianToUnicode (b : l : r)
    = toEnum (fromEnum b * 256 + fromEnum l) : ucs2BigEndianToUnicode r

ucs2BigEndianToUnicode []
    = []

ucs2BigEndianToUnicode _
    = []                                -- error "illegal UCS-2 byte input sequence with odd length"
                                        -- is ignored (garbage in, garbage out)

-- ------------------------------------------------------------

-- |
-- UCS-2 little endian to Unicode conversion

ucs2LittleEndianToUnicode       :: String -> UString

ucs2LittleEndianToUnicode (l : b : r)
    = toEnum (fromEnum b * 256 + fromEnum l) : ucs2LittleEndianToUnicode r

ucs2LittleEndianToUnicode []
    = []

ucs2LittleEndianToUnicode [_]
    = []                                -- error "illegal UCS-2 byte input sequence with odd length"
                                        -- is ignored

-- ------------------------------------------------------------

-- |
-- UCS-2 to UTF-8 conversion with byte order mark analysis

ucs2ToUnicode           :: String -> UString

ucs2ToUnicode ('\xFE':'\xFF':s)         -- 2 byte mark for big endian encoding
    = ucs2BigEndianToUnicode s

ucs2ToUnicode ('\xFF':'\xFE':s)         -- 2 byte mark for little endian encoding
    = ucs2LittleEndianToUnicode s

ucs2ToUnicode s
    = ucs2BigEndianToUnicode s          -- default: big endian

-- ------------------------------------------------------------

-- |
-- UTF-8 to Unicode conversion with deletion of leading byte order mark, as described in XML standard F.1

utf8ToUnicode           :: DecodingFct

utf8ToUnicode ('\xEF':'\xBB':'\xBF':s)  -- remove byte order mark ( XML standard F.1 )
    = decodeUtf8 s

utf8ToUnicode s
    = decodeUtf8 s

utf8ToUnicodeEmbedErrors        :: DecodingFctEmbedErrors

utf8ToUnicodeEmbedErrors ('\xEF':'\xBB':'\xBF':s)       -- remove byte order mark ( XML standard F.1 )
    = decodeUtf8EmbedErrors s

utf8ToUnicodeEmbedErrors s
    = decodeUtf8EmbedErrors s

-- ------------------------------------------------------------

-- |
-- UTF-16 big endian to UTF-8 conversion with removal of byte order mark

utf16beToUnicode                :: String -> UString

utf16beToUnicode ('\xFE':'\xFF':s)              -- remove byte order mark
    = ucs2BigEndianToUnicode s

utf16beToUnicode s
    = ucs2BigEndianToUnicode s

-- ------------------------------------------------------------

-- |
-- UTF-16 little endian to UTF-8 conversion with removal of byte order mark

utf16leToUnicode                :: String -> UString

utf16leToUnicode ('\xFF':'\xFE':s)              -- remove byte order mark
    = ucs2LittleEndianToUnicode s

utf16leToUnicode s
    = ucs2LittleEndianToUnicode s


-- ------------------------------------------------------------

-- |
-- substitute all Unicode characters, that are not legal 1-byte
-- UTF-8 XML characters by a character reference.
--
-- This function can be used to translate all text nodes and
-- attribute values into pure ascii.
--
-- see also : 'unicodeToLatin1'

unicodeToXmlEntity      :: UString -> String
unicodeToXmlEntity
    = escape is1ByteXmlChar (intToCharRef . fromEnum)

-- |
-- substitute all Unicode characters, that are not legal latin1
-- UTF-8 XML characters by a character reference.
--
-- This function can be used to translate all text nodes and
-- attribute values into ISO latin1.
--
-- see also : 'unicodeToXmlEntity'

unicodeToLatin1 :: UString -> String
unicodeToLatin1
    = escape isXmlLatin1Char (intToCharRef . fromEnum)


-- |
-- substitute selected characters
-- The @check@ function returns 'True' whenever a character needs to substitution
-- The function @esc@ computes a substitute.
escape :: (Unicode -> Bool) -> (Unicode -> String) -> UString -> String
escape check esc =
    concatMap (\uc -> if check uc then [uc] else esc uc)

-- |
-- removes all non ascii chars, may be used to transform
-- a document into a pure ascii representation by removing
-- all non ascii chars from tag and attibute names
--
-- see also : 'unicodeRemoveNoneLatin1', 'unicodeToXmlEntity'

unicodeRemoveNoneAscii  :: UString -> String
unicodeRemoveNoneAscii
    = filter is1ByteXmlChar

-- |
-- removes all non latin1 chars, may be used to transform
-- a document into a pure ascii representation by removing
-- all non ascii chars from tag and attibute names
--
-- see also : 'unicodeRemoveNoneAscii', 'unicodeToLatin1'

unicodeRemoveNoneLatin1 :: UString -> String
unicodeRemoveNoneLatin1
    = filter isXmlLatin1Char

-- ------------------------------------------------------------

-- |
-- convert an Unicode into a XML character reference.
--
-- see also : 'intToCharRefHex'

intToCharRef            :: Int -> String
intToCharRef i
    = "&#" ++ show i ++ ";"

-- |
-- convert an Unicode into a XML hexadecimal character reference.
--
-- see also: 'intToCharRef'

intToCharRefHex         :: Int -> String
intToCharRefHex i
    = "&#x" ++ h2 ++ ";"
      where
      h1 = intToHexString i
      h2 = if length h1 `mod` 2 == 1
           then '0': h1
           else h1

-- ------------------------------------------------------------
--
-- | White Space (XML Standard 2.3) and
-- end of line handling (2.11)
--
-- \#x0D and \#x0D\#x0A are mapped to \#x0A

normalizeNL     :: String -> String
normalizeNL ('\r' : '\n' : rest)        = '\n' : normalizeNL rest
normalizeNL ('\r' : rest)               = '\n' : normalizeNL rest
normalizeNL (c : rest)                  = c    : normalizeNL rest
normalizeNL []                          = []


-- ------------------------------------------------------------

-- |
-- the table of supported character encoding schemes and the associated
-- conversion functions into Unicode:q

{-
This table could be derived from decodingTableEither,
but this way it is certainly more efficient.
-}

decodingTable   :: [(String, DecodingFct)]
decodingTable
    = [ (utf8,          utf8ToUnicode                           )
      , (isoLatin1,     liftDecFct latin1ToUnicode              )
      , (usAscii,       decodeAscii                             )
      , (ucs2,          liftDecFct ucs2ToUnicode                )
      , (utf16,         liftDecFct ucs2ToUnicode                )
      , (utf16be,       liftDecFct utf16beToUnicode             )
      , (utf16le,       liftDecFct utf16leToUnicode             )
      , (iso8859_2,     liftDecFct (latinToUnicode iso_8859_2)  )
      , (iso8859_3,     liftDecFct (latinToUnicode iso_8859_3)  )
      , (iso8859_4,     liftDecFct (latinToUnicode iso_8859_4)  )
      , (iso8859_5,     liftDecFct (latinToUnicode iso_8859_5)  )
      , (iso8859_6,     liftDecFct (latinToUnicode iso_8859_6)  )
      , (iso8859_7,     liftDecFct (latinToUnicode iso_8859_7)  )
      , (iso8859_8,     liftDecFct (latinToUnicode iso_8859_8)  )
      , (iso8859_9,     liftDecFct (latinToUnicode iso_8859_9)  )
      , (iso8859_10,    liftDecFct (latinToUnicode iso_8859_10) )
      , (iso8859_11,    liftDecFct (latinToUnicode iso_8859_11) )
      , (iso8859_13,    liftDecFct (latinToUnicode iso_8859_13) )
      , (iso8859_14,    liftDecFct (latinToUnicode iso_8859_14) )
      , (iso8859_15,    liftDecFct (latinToUnicode iso_8859_15) )
      , (iso8859_16,    liftDecFct (latinToUnicode iso_8859_16) )
      , (unicodeString, liftDecFct id                           )
      , ("",            liftDecFct id                           )       -- default
      ]
    where
    liftDecFct df = \ s -> (df s, [])

-- |
-- the lookup function for selecting the decoding function

getDecodingFct          :: String -> Maybe DecodingFct
getDecodingFct enc
    = lookup (map toUpper enc) decodingTable


-- |
-- Similar to 'decodingTable' but it embeds errors
-- in the string of decoded characters.

decodingTableEmbedErrors        :: [(String, DecodingFctEmbedErrors)]
decodingTableEmbedErrors
    = [ (utf8,          utf8ToUnicodeEmbedErrors                )
      , (isoLatin1,     liftDecFct latin1ToUnicode              )
      , (usAscii,       decodeAsciiEmbedErrors                  )
      , (ucs2,          liftDecFct ucs2ToUnicode                )
      , (utf16,         liftDecFct ucs2ToUnicode                )
      , (utf16be,       liftDecFct utf16beToUnicode             )
      , (utf16le,       liftDecFct utf16leToUnicode             )
      , (iso8859_2,     liftDecFct (latinToUnicode iso_8859_2)  )
      , (iso8859_3,     liftDecFct (latinToUnicode iso_8859_3)  )
      , (iso8859_4,     liftDecFct (latinToUnicode iso_8859_4)  )
      , (iso8859_5,     liftDecFct (latinToUnicode iso_8859_5)  )
      , (iso8859_6,     liftDecFct (latinToUnicode iso_8859_6)  )
      , (iso8859_7,     liftDecFct (latinToUnicode iso_8859_7)  )
      , (iso8859_8,     liftDecFct (latinToUnicode iso_8859_8)  )
      , (iso8859_9,     liftDecFct (latinToUnicode iso_8859_9)  )
      , (iso8859_10,    liftDecFct (latinToUnicode iso_8859_10) )
      , (iso8859_11,    liftDecFct (latinToUnicode iso_8859_11) )
      , (iso8859_13,    liftDecFct (latinToUnicode iso_8859_13) )
      , (iso8859_14,    liftDecFct (latinToUnicode iso_8859_14) )
      , (iso8859_15,    liftDecFct (latinToUnicode iso_8859_15) )
      , (iso8859_16,    liftDecFct (latinToUnicode iso_8859_16) )
      , (unicodeString, liftDecFct id                           )
      , ("",            liftDecFct id                           )       -- default
      ]
    where
    liftDecFct df = map Right . df

-- |
-- the lookup function for selecting the decoding function

getDecodingFctEmbedErrors       :: String -> Maybe DecodingFctEmbedErrors
getDecodingFctEmbedErrors enc
    = lookup (map toUpper enc) decodingTableEmbedErrors



-- |
-- the table of supported output encoding schemes and the associated
-- conversion functions from Unicode

outputEncodingTable     :: [(String, (UString -> String))]
outputEncodingTable
    = [ (utf8,          unicodeToUtf8           )
      , (isoLatin1,     unicodeToLatin1         )
      , (usAscii,       unicodeToXmlEntity      )
      , (ucs2,          ucs2ToUnicode           )
      , (unicodeString, id                      )
      , ("",            unicodeToUtf8           )       -- default
      ]

-- |
-- the lookup function for selecting the encoding function

getOutputEncodingFct            :: String -> Maybe (String -> UString)
getOutputEncodingFct enc
    = lookup (map toUpper enc) outputEncodingTable

-- ------------------------------------------------------------
--

guessEncoding           :: String -> String

guessEncoding ('\xFF':'\xFE':'\x00':'\x00':_)   = "UCS-4LE"             -- with byte order mark
guessEncoding ('\xFF':'\xFE':_)                 = "UTF-16LE"            -- with byte order mark

guessEncoding ('\xFE':'\xFF':'\x00':'\x00':_)   = "UCS-4-3421"          -- with byte order mark
guessEncoding ('\xFE':'\xFF':_)                 = "UTF-16BE"            -- with byte order mark

guessEncoding ('\xEF':'\xBB':'\xBF':_)          = utf8                  -- with byte order mark

guessEncoding ('\x00':'\x00':'\xFE':'\xFF':_)   = "UCS-4BE"             -- with byte order mark
guessEncoding ('\x00':'\x00':'\xFF':'\xFE':_)   = "UCS-4-2143"          -- with byte order mark

guessEncoding ('\x00':'\x00':'\x00':'\x3C':_)   = "UCS-4BE"             -- "<" of "<?xml"
guessEncoding ('\x3C':'\x00':'\x00':'\x00':_)   = "UCS-4LE"             -- "<" of "<?xml"
guessEncoding ('\x00':'\x00':'\x3C':'\x00':_)   = "UCS-4-2143"          -- "<" of "<?xml"
guessEncoding ('\x00':'\x3C':'\x00':'\x00':_)   = "UCS-4-3412"          -- "<" of "<?xml"

guessEncoding ('\x00':'\x3C':'\x00':'\x3F':_)   = "UTF-16BE"            -- "<?" of "<?xml"
guessEncoding ('\x3C':'\x00':'\x3F':'\x00':_)   = "UTF-16LE"            -- "<?" of "<?xml"

guessEncoding ('\x4C':'\x6F':'\xA7':'\x94':_)   = "EBCDIC"              -- "<?xm" of "<?xml"

guessEncoding _                                 = ""                    -- no guess

-- ------------------------------------------------------------