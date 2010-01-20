module W3CTestData where

testListW3C=[
		"$h - $i",
		"$hotelnode/location/@country",
		"$in//text()",
		"$l10n.name",
		"$lookup/@text",
		"$start + $step",
		"$texts[position() &gt; 1]",
		"$var1|$var2",
		"$var1|child::child2",
		"$var1|key('key1','Lynne Rosenthal')",
		"$x=''",
		"$x='foo'",
		"$xml-source",
		"$y='foo'",
		"$zoo:bear",
		"' #text'",
		"' 6 ' div 2",
		"' 6 '*div",
		"' x 4'",
		"' x 4'",
		"'....5....|'",
		"'1' and '0'",
		"'2'&gt;'1'",
		"'200'",
		"'ABC'",
		"($terms/table/expand[@language=$lang]/gentext[@key=$key])[1]",
		"((((((n3+5)*(3)+(((n2)+2)*(n1 - 6)))-(n4 - n2))+(-(4-6)))))",
		"(((ancestor::foo)[1])/@att1)",
		"((ancestor::foo))[1]/@att1",
		"(* - 4) div 2",
		"(* - 4)**",
		"(2 + number('xxx'))",
		"(24 div 3 +2) div (40 div 8 -3)",
		"(5 mod 2 = 1) and (5 mod -2 = 1) and (-5 mod 2 = -1) and (-5 mod -2 = -1)",
		"(77 mod $anum + n5 mod 8) mod $anum",
		"(ancestor-or-self::*)[@att1][1]/@att1",
		"(ancestor::foo)[1]/@att1",
		"(ancestor::foo[1])/@att1",
		"(ancestor::section|ancestor::simplesect         |ancestor::articleinfo)[last()]",
		"(chapter//footnote)[2]",
		"(child::chapter/descendant-or-self::node())/footnote[2]",
		"(n1*n2*n3*n4*n5*n6)div n7 div n8 div n9 div n10",
		"(n1/@attrib)*(n2/@attrib)",
		"(n1/@attrib)+(n2/@attrib)",
		"(preceding-sibling::*|following-sibling::*)/ancestor::*[last()]/*[last()]",
		"(preceding-sibling::foo)[1]/@att1",
		"(preceding::foo)[1]/@att1",
		"(section//@title)[7]",
		"(xalan:nodeset($rtf)/default:docelem/test:elem3)", -- namespaces noch mal ueberdenken
		"* +3",
		"*//la | //Bflat | re",
		"*/p",
		"*[$index]",
		"*[$index]",
		"*[$index]",
		"*[1]",
		"*[3]",
		"*[4]",
		"*[@test and position()=1]",
		"*[@test and position()=4]",
		"*[@test and position()=7]",
		"*[@test and position()=8]",
		"*[@test='true']",
		"*[@test][1]/num",
		"*[@test][position()=1]/num",
		"*[last()=position()]",
		"*[last()]",
		"*[local-name()='bar']",
		"*[not(@test)][last()=position()]",
		"*[not(@test)][last()]",
		"*[position()=1]",
		"*[position()=3]",
		"*[position()=4]",
		"*[starts-with(name(.),'f')]",
		"*|@*",
		"*|@*|comment()|processing-instruction()|text()",
		"-(n-2/@attrib) - -(n-1/@attrib)",
		"-(n1|n2)",
		"-.0000000000000000000000000000000000000000123456789",
		"-.01",
		"-n-2 --n-1",
		"-n-2/@attrib --n-1/@attrib",
		"..",
		"../../a/b[1]",
		"..//foo",
		"../@id",
		"../node()",
		"./*[name(.) = $sortcol]",
		".//*[@so]",
		".//PERSONA",
		".//a",
		".//center",
		".//center",
		".//comment()",
		".//f",
		".//near-south/preceding-sibling::*|following-sibling::east/ancestor-or-self::*[2]",
		".//text()",
		".//title",
		"./@id",
		"./@theattrib",
		".0000000000000000000000000000000000000000123456789",
		".01",
		".123456789",
		"/",   
		"/*/@group",
		"//*",
		"//*",
		"//*[count(./*/*) &gt; 0]",
		"//*[count(ancestor::*) &gt;= 2]/../parent::*",
		"//ACT",
		"//ancestor::*",
		"//child1[parent::element1]",
		"//child1|//child2",
		"//child2[ancestor-or-self::element2]",
		"//child2[ancestor::element2]",
		"//child5|//child2|//child4",
		"//comment()",
		"//inc/node4",
		"//item[@type=current()/@name]",
		"//noChild1|//noChild2",
		"//north/dup2 | south/preceding-sibling[4] | north/dup1 | north/*",
		"//processing-instruction()",
		"//xx/descendant::*",
		"/doc/*[@test='true']",
		"/doc/a/b/@attr",
		"/doc/critter[@type='cat']",
		"/doc/mid/inner",
		"/doc/sub1/child1|/doc/sub2/child2",
		"/docs/a",
		"/docs/a",
		"/page/contents/avail/hotel",
		"/sss/sss/i",
		"/sss/sss/i",
		"0 &gt; -0",
		"0 = -0",
		"0 div 0 &gt;= 0",
		"0 div 0 &lt; 0",
		"0 div 0",
		"0 or ''",
		"0",
		"0000000000",
		"1 = '001'",
		"1 = 1.00",
		"1 div -0 = 1 div 0",
		"1 div -0 = 2 div -0",
		"1&gt;1",
		"1&lt;1",
		"1&lt;=1",
		"1-2",
		"10+5+25+20+15+50+35+40",
		"10+7",
		"100-$anum -5-15-$anum",
		"100-9-7-4-17-18-5",
		"100-n6 -4-n1 -1-11",
		"12",
		"123",
		"1234",
		"12345",
		"123456",
		"1234567",
		"12345678",
		"123456789",
		"1234567890",
		"12345678901",
		"123456789012",
		"1234567890123",
		"12345678901234",
		"123456789012345",
		"1234567890123456",
		"12345678901234567",
		"123456789012345678",
		"16-div",
		"1=1",
		"2 * -number('xxx')",
		"2 - number('xxx')",
		"2 div number('xxx')",
		"2 mod number('xxx')",
		"2",
		"2&gt;1",
		"2&gt;=1",
		"2&gt;=2",
		"2&lt;1",
		"2&lt;=1",
		"2*3",
		"2+n5+7+n3",
		"20",
		"25-*",
		"256",
		"3",
		"3",
		"3*2+5*4-4*2-1",
		"3+6",
		"3-1",
		"32",
		"4",
		"4",
		"444 + $t1num",
		"48 mod 17 - 2 mod 9 + 13 mod 5",
		"5 mod 2",
		"5",
		"5",
		"5.*.",
		"5.+*",
		"54 div*",
		"555",
		"56 mod round(n5*2+1.444) - n6 mod 4 + 7 mod n4",
		"6 div -2",
		"6 div 2",
		"6",
		"60",
		"7 - -3",
		"7",
		"7",
		"7+-3",
		"70 div $anum - 18 div n6 + $anum div n2",
		"8",
		"80 div n2 + 12 div 2 - n4 div n2",
		"9",
		"9.87654321012345",
		"98.7654321012345",
		"987.654321012345",
		"9876.54321012345",
		"98765.4321012345",
		"987654.321012345",
		"9876543.21012345",
		"98765432.1012345",
		"987654321.012345",
		"9876543210",
		"9876543210.12345",
		"98765432101.2345",
		"987654321012.345",
		"9876543210123.45",
		"98765432101234.5",
		"FM|PERSONAE|ACT",
		"Name/@First",
		"OL",
		"Personal_Information/Age",
		"Spr/State[. = 'Open']",
		"a/*[last()]",
		"a/child::*[last()]",
		"a/child::comment()[last()]",
		"a/child::node()[last()]",
		"a/child::text()[last()]",
		"a/descendant::*[last()]",
		"a/x",
		"a['3.5' &lt; 4]",
		"a['target'!=descendant::*]",
		"a['target'=descendant::*]",
		"a[('target'=descendant::*) or @squish]",
		"a[(@squeesh or @squish) and @squash]",
		"a[*=9]",
		"a[0 &lt; true()]",
		"a[0]",
		"a[1 &lt; 2]",
		"a[1 &lt; 3]",
		"a[1]",
		"a[3 &gt; following-sibling::*]",
		"a[3 &gt;= following-sibling::*]",
		"a[3 &lt; following-sibling::*]",
		"a[3 &lt;= following-sibling::*]",
		"a[3-2]",
		"a[3.0='3.0']",
		"a[3=following-sibling::*]",
		"a[3]",
		"a[4 != following-sibling::*]",
		"a[4]",
		"a[@squeesh or (@squish and @squash)]",
		"a[@squeesh or @squish and @squash]",
		"a[descendant::*!='target']",
		"a[descendant::*='target']",
		"a[div=9]",
		"a[false()!=following-sibling::*]",
		"a[following-sibling::* != 4]",
		"a[following-sibling::* &gt; 3]",
		"a[following-sibling::* &gt;= 3]",
		"a[following-sibling::* &lt; 3]",
		"a[following-sibling::* &lt;= 3]",
		"a[following-sibling::*!=false()]",
		"a[following-sibling::*=3]",
		"a[following-sibling::*=descendant::*]",
		"a[following-sibling::*=true()]",
		"a[not(('target'=descendant::*) or @squish)]",
		"a[not(@*)]",
		"a[number('3')]",
		"a[position() &lt;=3]",
		"a[position()!=2]",
		"a[position()&gt;2]",
		"a[position()&gt;=2]",
		"a[position()&lt;3]",
		"a[position()=$first]",
		"a[position()=1]",
		"a[position()=3]",
		"a[position()=4]",
		"a[true()='stringwithchars']",
		"a[true()=4]",
		"a[true()=following-sibling::*]",
		"alternate/name/first",
		"ancestor-or-self::*",
		"ancestor-or-self::*[1]",
		"ancestor-or-self::*[1]/text()",
		"ancestor-or-self::*[@att1][1]/@att1",
		"ancestor-or-self::sub | ancestor-or-self::sub-sub",
		"ancestor::*",
		"ancestor::*[3]",
		"ancestor::*[count(child::*) &gt; 1]/*[not(. = current()/ancestor-or-self::*)]",
		"ancestor::foo[1]/@att1",
		"ancestor::sub1|ancestor::sub2",
		"attribute :: *",
		"attribute :: div",
		"attribute*(div - 4)",
		"attribute::*",
		"attribute::*[2]",
		"attribute::attr1|attribute::attr2",
		"attribute::center-attr-2",
		"author/name|author/bibliography/author/chapters",
		"author/name|author/bibliography/author/name",
		"author/name|author/noElement",
		"author[(name/@real='no' and position()=1)]|author[(name/@real='yes' and position()=last())]",
		"author[name/@real='no']|author[name/@real='yes']",
		"author[name='Mary Brady']|author[name/@real='no']",
		"bar | joes:bar",
		"bar[(@a='1' and @b='1') or (@c='1' and @d='1')]",
		"bar[(@a='1' or @b='1') and (@c='1' or @d='1')]",
		"bar[(@a='1' or @b='1') and @c='1']",
		"bar[@a='1' and (@b='1' or @c='1') and @d='1']",
		"bar[@a='1' and @b='1' or @c='1' and @d='1']",
		"bar[@a='1' and @b='1']",
		"bar[@a='1' or (@b='1' and @c='1') or @d='1']",
		"bar[@a='1' or @b='1' and @c='1' or @d='1']",
		"bar[@a='1' or @b='1' or @c='1']",
		"boolean($ResultTreeFragTest)",
		"boolean($emptyResultTreeFragTest)",
		"boolean('')",
		"boolean('0')",
		"boolean(-0)",
		"boolean(0 div 0)",
		"boolean(0)",
		"boolean(1 div 0)",
		"boolean(1)",
		"boolean(doc)",
		"boolean(foo)",
		"ceiling(-1.5)=-1",
		"ceiling(0.0)",
		"ceiling(1)=1",
		"ceiling(1.1)=2",
		"ceiling(1.54)",
		"ceiling(2.999999)",
		"ceiling(n0)",
		"ceiling(n1)",
		"ceiling(n2)",
		"ceiling(number('xxx'))",
		"center//*",
		"center//child::*",
		"center//descendant::*",
		"center/child::*",
		"center/descendant::*",
		"chapter//footnote[1]",
		"chapter//footnote[2]",
		"chapter/descendant::footnote[6]",
		"chapter/note",
		"chapter/note",
		"child :: sub",
		"child1[child::child2]",
		"child::*",
		"child::*/child::*",
		"child::*/descendant::*",
		"child::*[2]",
		"child::article|key('key1','Carmelo Montanez')",
		"child::near-south-west",
		"child::node()",
		"child::sub",
		"child::sub1|child::sub2",
		"child[@deep='3']|child[@wide='3']",
		"child[@wide='3'] | key('one','3')",
		"child[@wide='3']|child[@deep='3']",
		"chooser",
		"comment ()",
		"concat(         substring(subj,1,number(not(starts-with(.,'Re: ')))*string-length(subj)),         substring(substring-after(subj,'Re: '),1,           		number(starts-with(.,'Re: '))*string-length(substring-after(subj,'Re: '))))",
		"concat($act,' - ',TITLE,'   ')",
		"concat($mParam,$nParam,$oParam,$pParam)",
		"concat($str,'....5....|')",
		"concat('id=', string($p2))",
		"concat(/*, /*[@attr='whatsup'])",
		"concat(a, 34)",
		"concat(a, b)",
		"concat(a, b, c, d, e)",
		"concat(false(),'ly')",
		"concat(left,right,orig)",
		"concat(left,right,orig)",
		"concat(team[1], ' versus ', team[2])",
		"concat(team[1]/@score, '-', team[2]/@score)",
		"contains(       unparsed-entity-uri('hatch-pic'),'grafix/OpenHatch.gif')",
		"contains($node,$find)",
		"contains('','')",
		"contains('ENCYCLOPEDIA', 'CYCL')",
		"contains('ENCYCLOPEDIA', 'TEST')",
		"contains('ab', 'abc')",
		"contains('abc', '')",
		"contains('abc', 'bc')",
		"contains('abc', 'bcd')",
		"contains('foo','o')",
		"contains('true()', 'e')",
		"contains(., '&amp;')",
		"contains(concat(.,'BC'),concat('A','B','C'))",
		"contains(doc, 'CYCL')",
		"contains(doc, 'TEST')",
		"contains(doc/@attr, 'TEST')",
		"contains(doc/@attr, 'amwi')",
		"contains(main,sub)",
		"contains(main,sub)",
		"contains(main,sub)",
		"contains(main,sub)",
		"count($var1)",
		"count($var2)",
		"count(*)",
		"count(*)",
		"count(*/z[2])",
		"count(.//SPEECH)",
		"count(.//comment())",
		"count(/doc/alpha[last()]/h)",
		"count(/doc/chapter/note)",
		"count(a/@*)",
		"count(a/attribute::*)",
		"count(alpha/*[last()][name()='z'])",
		"count(ancestor::section             |../ednote|following::title|../bogus)",
		"count(ancestor::section             |ancestor::simplesect|ancestor::article)",
		"count(ancestor::section           |ancestor::simplesect|ancestor::articleinfo)",
		"count(div)",
		"count(following-sibling::*)",
		"count(key('mykey', 'Introduction'))",
		"count(namespace::*)",
		"count(preceding::text())",
		"count(preceding::text())",
		"count(xalan:nodeset($rtf)/default:docelem/default:elem3)",
		"counter:read('index')",
		"counter:read('index')",
		"critter",
		"critter",
		"current()",
		"current()",
		"current()",
		"customers/customer",
		"d",
		"dat",
		"date",
		"date:getYear()",
		"day",
		"day",
		"day",
		"day",
		"day",
		"descendant-or-self::*",
		"descendant-or-self::*",
		"descendant-or-self::*[3]",
		"descendant-or-self::center",
		"descendant-or-self::far-south",
		"descendant-or-self::sub1|descendant-or-self::sub2",
		"descendant::*",
		"descendant::*",
		"descendant::*/child::*",
		"descendant::*[3]",
		"descendant::*[string-length(name(.))=1]",
		"descendant::child1|descendant::child2",
		"descendant::far-south",
		"display",
		"display",
		"display",
		"div +3",
		"div div mod",
		"div mod mod",
		"div",
		"div/@attrib div mod/@attrib",
		"div/@attrib mod mod/@attrib",
		"div/para[lang('en')]",
		"doc/element1[2]/child1[last()]",
		"document($typefile,/)",
		"document('')/*/xsl:template[@name=$whichtmplt]",
		"document('')/*/xsl:template[@name=$whichtmplt]",
		"document('')/*/xsl:template[@name='qq']/node()",
		"document('')/xsl:stylesheet/ped:test[@attrib='yeha']",
		"document('')/xsl:stylesheet/ped:test[@attrib='yeha']",
		"document('../impincl-test/mdocs11a.xml')//body",
--		"document('..\mdocs\compu.xml')/market.participant/address.set/*", -- \ mag er nicht
		"document('bib.xml')",
		"document('level3/xreluri09a.xml',document('level1/level2/xreluri09b.xml'))",
		"document('mdocs01a.xml')//body",
		"document('mdocs03a.xml',section)",
		"document('select68.xml')//inside",
		"document('select68.xml')//inside",
		"document('terms.xml')",
		"document('variable20.xml')",
		"document('x14template.html')",
		"document(a)//body",
		"document(a)//body",
		"document(a)//body",
		"document(document(places))",
		"document(filename,document('level1/level2/xreluri10b.xml'))/*/body",
		"document(places)",
		"document(places)//body",
		"document(places,second)/*",
		"document(pointer/urlref/@urlstr)/market.participant/business.identity.group/business.name",
		"element",
		"element1[(((((2*10)-4)+9) div 5) mod 3 )]",
		"element1[(((((2*10)-4)+9) div 5) mod floor(3))]",
		"element1[descendant-or-self::child2]",
		"element1[floor(2)]",
		"em:foo",
		"expense-report/total",
		"expense-report/total",
		"ext:getPIData(doc/processing-instruction('a-pi'))",
		"extn1:getPIData(doc/processing-instruction('a-pi')[1])",
		"extn1:getPIData(doc/processing-instruction('b-pi'))",
		"fa/../mi | Aflat/natural/la | Csharp//* | /doc/do | *//ti",
		"false() and 1 div 0",
		"false() and false()",
		"false() and true()",
		"false() or false()",
		"false() or true()",
		"false()",
		"false()=''",
		"false()=0",
		"floor(-1.5)",
		"floor(-1.5)=-2",
		"floor(0.0)",
		"floor(1)=1",
		"floor(1.9)",
		"floor(1.9)=1",
		"floor(2.999999)",
		"floor(n0)",
		"floor(number('xxx'))",
		"following-sibling::*",
		"following-sibling::*/preceding-sibling::*",
		"following-sibling::*[1]",
		"following-sibling::*[2]/preceding-sibling::*",
		"following-sibling::*[2]/preceding-sibling::*[4]",
		"following-sibling::*[2]/preceding-sibling::*[4]/following-sibling::*[5]/preceding-sibling::*[4]/preceding-sibling::*[2]",
		"following-sibling::east",
		"following-sibling::node()",
		"following::*",
		"following::*[4]",
		"following::*[4]/../*[2]",
		"foo[(bar[2])='this']",
		"foo[(bar[2][(baz[2])='goodbye'])]",
		"format-number('foo','#############')",
		"format-number('foo','#############')",
		"format-number(-1 div 0,'###############################')",
		"format-number(-1 div 0,'###############################')",
		"format-number(-26931.4,'!!!,!!!.!!!')",
		"format-number(-26931.4,'###,###.###')",
		"format-number(-26931.4,'###,###.###','myminus')",
		"format-number(-26931.4,'###,###.###;###,###.###')",
		"format-number(-26931.4,'###.###,###','periodgroup')",
		"format-number(-26931.4,'###.###,###','periodgroup')",
		"format-number(-26931.4,'###.###,###','periodgroup')",
		"format-number(-26931.4,'###.###,###','periodgroup')",
--		"format-number(-26931.4,'+!!,!!!.!!!\-!!!,!!!.!!!')", -- vom W3C auskommentiert
		"format-number(-26931.4,'+###,###.###;-###,###.###')",
		"format-number(-26931.4,'+###,###.###;_###,###.###')",
		"format-number(-26931.4,'-###,###.###')",
		"format-number(-26931.4,'-###,###.###','myminus')",
		"format-number(-26931.4,'_###,###.###','myminus')",
		"format-number(-42857.1,'###,###.###')",
		"format-number(-42857.1,'###,###.###','myminus')",
		"format-number(-42857.1,'###,###.###','myminus')",
		"format-number(-42857.1,'###,###.###','newminus')",
		"format-number(-42857.1,'###,###.###','newminus')",
		"format-number(-73816.9,'###,###.###')",
		"format-number(-73816.9,'###,###.###')",
		"format-number(-73816.9,'###,###.###')",
		"format-number(-73816.9,'###,###.###')",
		"format-number(0.25, '00%')",
		"format-number(0.4857,'###.###%')",
		"format-number(0.4857,'###.###c')",
		"format-number(0.4857,'###.###m')",
		"format-number(0.4857,'###.###â€°')",
		"format-number(1 div 0,'###############################')",
		"format-number(1 div 0,'###############################')",
		"format-number(1, '#,##0')",
		"format-number(1, '00')",
		"format-number(1, '00.0')",
		"format-number(1000, '###0')",
		"format-number(1234.567,'#*###*###!###','foo:decimal1')",
		"format-number(12792.14*96.58,'##,###,000.000###')",
		"format-number(2.14*86.58,'PREFIX##00.000###SUFFIX')",
		"format-number(2392.14*(-36.58),'000,000.000###;###,###.000###')",
		"format-number(2392.14*(-36.58),'000,000.000###;-###,###.000###')",
		"format-number(2392.14*36.58,'000,000.000000')",
		"format-number(2392.14*36.58,'000,000.000000','myminus')",
		"format-number(2392.14*36.58,'000,000.000000;###,###.000###')",
		"format-number(2392.14*36.58,'000,000.000000;###,###.000###','myminus')",
		"format-number(239236.588,'00000.00')",
--		"format-number(26931.4,'+!!!,!!!.!!!\-!!,!!!.!!!')", -- vom W3C auskommentiert
		"format-number(2792.14*(-36.58),'000,000.000###')",
		"format-number(4030201.0506,'#!!!,!!!,aaa.aaaaaa0')",
		"format-number(7654321.4857,'### ### ###,#####')",
		"format-number(931.4857,'###!###!###')",
		"format-number(931.4857,'000.000|###')",
		"format-number(95.4857,'Â¤###.####')",
		"format-number(987654321,'###,##0,00.00')",
		"generate-id(d)",
		"generate-id(xalan:nodeset($rtf)/default:docelem/default:elem4)",
		"growth",
		"growth",
		"human",
		"id('c')/@id",
		"id('c')/@id",
		"id('d b c')",
		"id('id0')/a/b",
		"id('id0')/c/c/a",
		"id('id10')/a",
		"id('id13')",
		"id('id2')/a | id('id5') | id('id15')/a",
		"id('id4')",
		"id('id8')/b/b",
		"id('id9')",
		"id('nomatch')/@id",
		"id(main/b)",
		"id(main/b)",
		"item[$n1]",
		"item[position()=$n]",
		"java:format($formatter, $date)",
		"java:format($formatter, $javadate)",
		"java:get ($counter-table, 'index')",
		"java:java.lang.Long.parseLong(string(.))",
		"java:java.text.SimpleDateFormat.new('yyyy.MM.dd hh:mm')",
		"java:java.util.Calendar.getInstance()",
		"java:java.util.Date.new($date)",
		"java:java.util.Hashtable.new ()",
		"key($keysp, 'Expressions')/subdiv/p",
		"key($keysp, 'Introduction')/subdiv/p",
		"key($keysp, 'Stylesheet Structure')/subdiv/p",
		"key('MonthNum',month)",
		"key('MonthNum',month)",
		"key('baz:mykey', 'Expressions')/p",
		"key('baz:mykey', 'Introduction')/p",
		"key('baz:mykey', 'Stylesheet Structure')/p",
		"key('bib',$lookup)",
		"key('bigspace', 'Expressions')/subdiv/p",
		"key('bigspace', 'Expressions')/subdiv/p",
		"key('bigspace', 'Introduction')/subdiv/p",
		"key('bigspace', 'Introduction')/subdiv/p",
		"key('bigspace', 'Stylesheet Structure')/subdiv/p",
		"key('bigspace', 'Stylesheet Structure')/subdiv/p",
		"key('filterspace', 'Expressions')/subdiv/p",
		"key('filterspace', 'Expressions')/subdiv/p",
		"key('filterspace', 'Introduction')/subdiv/p",
		"key('filterspace', 'Introduction')/subdiv/p",
		"key('filterspace', 'Stylesheet Structure')/subdiv/p",
		"key('filterspace', 'Stylesheet Structure')/subdiv/p",
		"key('k','Albany')",
		"key('k','Albany')",
		"key('k','false')[position()=1]/num",
		"key('k','false')[position()=2]/num",
		"key('k','true')[1]/num",
		"key('k','true')[1]/num",
		"key('k','true')[3]/num",
		"key('k','true')[3]/num",
		"key('k','true')[4]/num",
		"key('k','true')[4]/num",
		"key('k','true')[last()=position()]",
		"key('k','true')[last()]",
		"key('k','true')[position()=1]/num",
		"key('k','true')[position()=4]/num",
		"key('key1','Mary Brady')|key('key2','Rick Rivello')",
		"key('marks',key('titles', 'Expressions')/finder)",
		"key('mykey', 'Expressions')",
		"key('mykey', 'Expressions')/p",
		"key('mykey', 'Introduction')/p",
		"key('mykey', 'Patterns')",
		"key('mykey', 'Second Title in Structure')/p",
		"key('mykey', 'Stylesheet Structure')",
		"key('mykey', 'Stylesheet Structure')/p",
		"key('mykey', 1 )/p",
		"key('mykey', 1+1 )/p",
		"key('mykey', 3.0 )/p",
		"key('mykey', 3.7 )/p",
		"key('mykey',' ')/@title",
		"key('mykey','')/p",
		"key('mykey','Exp Section')/@title",
		"key('mykey','Expressions')/p",
		"key('mykey','Expressions')/p",
		"key('mykey','Intro Section')/@title",
		"key('mykey','Introduction')/p",
		"key('mykey','Introduction')/p",
		"key('mykey','SS Section')/@title",
		"key('mykey','Sort Section')/@title",
		"key('mykey','Sorting')/p",
		"key('mykey','Sorting')/p",
		"key('mykey','Stylesheet Structure')/p",
		"key('mykey','Stylesheet Structure')/p",
		"key('mykey',*//title)",
		"key('mykey1','foo' )/p",
		"key('mykey2', 1 )/p",
		"key('one','3') | key('two','3')",
		"key('smallspace', 'Expressions')/p",
		"key('smallspace', 'Expressions')/p",
		"key('smallspace', 'Introduction')/p",
		"key('smallspace', 'Introduction')/p",
		"key('smallspace', 'Stylesheet Structure')/p",
		"key('smallspace', 'Stylesheet Structure')/p",
		"key('test','foey')",
		"key('titles', .)",
		"key('two','3') | document('select59.xml')/child[@wide='3'] | child[@deep='3']",
		"key('which','3')",
		"keyword[@tag='sector']",
		"keyword[@tag='ticker']",
		"keyword[@tag='ticker']",
		"keyword[@tag='ticker']",
		"keyword[@tag='ticker']",
		"lang('en')",
		"last()",
		"local-name()",
		"local-name(.)",
		"local-name(baz1:a)",
		"local-name(baz2:b)",
		"local-name(baz2:b/@baz1:attrib2)",
		"local-name(namespace::*[1])",
		"local-name(namespace::*[string()='http://www.w3.org/1999/XMLSchema-instance'])",
		"local-name(namespace::*[string()='test'])",
		"local-name(xalan:nodeset($rtf)/*)",
		"main/a/descendant-or-self::*/@*",
		"main/size[@for='d']",
		"mi | do | fa | re",
		"mi[@mi2='mi2'] | do | fa/so/@so | fa | mi/@* | re | fa/@fa | do/@do",
		"month",
		"month",
		"month",
		"n",
		"n-2 - -n-1",
		"n-2 - n-1",
		"n-2+-n-1",
		"n0 div n1 div n2 div n3 div n4 div n5",
		"n0 div n1 div n2 div n3 div n4",
		"n0 div n1 div n2 div n3",
		"n1 div n2",
		"n1 mod n2",
		"n1*n2",
		"n1*n2*n3*n4",
		"n1*n2*n3*n4*n5*n6*n7*n8*n9*n10",
		"n1+n2",
		"n1/@attrib + n2/@attrib",
		"n1/@attrib div n2/@attrib",
		"n1/@attrib mod n2/@attrib",
		"n2+3+$anum+7+n5",
		"n4",
		"n6*5-8*n2+5*2",
		"name",
		"name",
		"name",
		"name",
		"name",
		"name",
		"name",
		"name((ancestor::section|../ednote           |following::title|../bogus)[1])",
		"name((ancestor::section|ancestor::simplesect           |ancestor::article)[last()])",
		"name(/descendant-or-self::node()/child::near-north)",
		"name(/descendant-or-self::node()/descendant-or-self::north)",
		"name(/descendant-or-self::north)",
		"name(/descendant-or-self::north/child::near-north)",
		"name(/descendant-or-self::north/descendant-or-self::north)",
		"name(/descendant::near-north)",
		"name(/descendant::near-north/descendant-or-self::near-north)",
		"name(/descendant::node()/descendant-or-self::near-north)",
		"name(ancestor::*[1])",
		"name(ancestor::*[1])",
		"name(ancestor::*[2])",
		"name(ancestor::*[2])",
		"name(ancestor::*[3])",
		"name(ancestor::*[3])",
		"name(baz1:a)",
		"name(baz1:a/@baz2:attrib1)",
		"name(baz2:b)",
		"name(baz2:b/@baz1:attrib2)",
		"name(descendant-or-self::node()/child::near-north)",
		"name(descendant-or-self::node()/child::node()/child::far-west)",
		"name(descendant-or-self::node()/child::node()/descendant-or-self::near-north)",
		"name(descendant-or-self::node()/descendant-or-self::node()/child::near-north)",
		"name(descendant-or-self::node()/descendant-or-self::node()/descendant-or-self::north)",
		"name(descendant-or-self::node()/descendant-or-self::north)",
		"name(descendant-or-self::node()/descendant::near-north)",
		"name(descendant-or-self::node()/descendant::node()/child::far-west)",
		"name(descendant-or-self::node()/descendant::node()/descendant-or-self::near-north)",
		"name(descendant-or-self::north/child::near-north)",
		"name(descendant-or-self::north/child::near-north/child::far-west)",
		"name(descendant-or-self::north/child::near-north/descendant-or-self::near-north)",
		"name(descendant-or-self::north/descendant-or-self::north)",
		"name(descendant-or-self::north/descendant-or-self::north/child::near-north)",
		"name(descendant-or-self::north/descendant-or-self::north/descendant-or-self::north)",
		"name(descendant-or-self::north/descendant::near-north)",
		"name(descendant-or-self::north/descendant::near-north/child::far-west)",
		"name(descendant-or-self::north/descendant::near-north/descendant-or-self::near-north)",
		"name(descendant::near-north/descendant-or-self::near-north)",
		"name(descendant::near-north/descendant-or-self::near-north/child::far-west)",
		"name(descendant::near-north/descendant-or-self::near-north/descendant-or-self::near-north)",
		"name(descendant::near-north/descendant::far-west)",
		"name(descendant::near-north/descendant::far-west/descendant-or-self::far-west)",
		"name(descendant::node()/descendant-or-self::near-north)",
		"name(descendant::node()/descendant-or-self::node()/child::far-west)",
		"name(descendant::node()/descendant-or-self::node()/descendant-or-self::near-north)",
		"name(descendant::node()/descendant::far-west)",
		"name(descendant::node()/descendant::node()/descendant-or-self::far-west)",
		"name(namespace::*[1])",
		"name(self::node()/descendant-or-self::node()/child::near-north)",
		"name(self::node()/descendant-or-self::node()/descendant-or-self::north)",
		"name(self::node()/descendant-or-self::north)",
		"name(self::node()/descendant-or-self::north/child::near-north)",
		"name(self::node()/descendant-or-self::north/descendant-or-self::north)",
		"name(self::node()/descendant::near-north)",
		"name(self::node()/descendant::near-north/child::far-west)",
		"name(self::node()/descendant::near-north/descendant-or-self::far-west)",
		"name(self::node()/descendant::node()/child::far-west)",
		"name(self::node()/descendant::node()/descendant-or-self::far-west)",
		"name(xalan:nodeset($rtf)/*)",
		"namespace-uri(baz1:a-two/@attrib1)",
		"namespace-uri(baz1:a/@baz2:attrib1)",
		"namespace-uri(baz2:b)",
		"namespace-uri(baz2:b-three)",
		"namespace-uri(baz2:b-three/@baz1:attrib2)",
		"namespace-uri(baz2:b-three/c-four)",
		"namespace-uri(baz2:b/@baz1:attrib2)",
		"namespace-uri(namespace::*[string()='http://www.w3.org/1999/XMLSchema-instance'])",
		"namespace-uri(namespace::*[string()='test'])",
		"namespace-uri(x)",
		"namespace-uri(xalan:nodeset($rtf)/default:docelem)",
		"namespace-uri(xalan:nodeset($rtf)/default:docelem/default:elem1)",
		"namespace-uri(xalan:nodeset($rtf)/default:docelem/test:elem3)",
		"namespace::*",
		"namespace::node()",
		"nitro:element(.)",
		"node",
		"node()|@*",
		"normalize-space($texts[1])",
		"normalize-space($thisvalue)",
		"normalize-space('	&#10;&#13;        ab           cd	&#10;&#13;       ef	&#10;&#13; ')",
		"normalize-space()",
		"normalize-space(a)",
		"north/* | north/dup1 | north/dup2",
		"north/dup2 | document('select71.xml')/south/preceding-sibling[4] | north/*",
		"north/dup2 | north/dup1 | north/*",
		"not($x!='foo')",
		"not('')",
		"not('0')",
		"not(false() = false())",
		"not(false())",
		"not(true() = false())",
		"not(true())",
		"note[1]",
		"note[1]",
		"number($ResultTreeFragTest)",
		"number($emptyResultTreeFragTest)",
		"number($pvar2)",
		"number('')",
		"number('3')",
		"number('abc')",
		"number('xxx') - 10",
		"number('xxx') div 3",
		"number('xxx') mod 3",
		"number('xxx')=0",
		"number('xxx')=number('xxx')",
		"number()",
		"number(2)",
		"number(false())=0",
		"number(foo)",
		"number(n1)",
		"number(string(1.0))=1",
		"number(true())=1",
		"number(xalan:nodeset($rtf)/default:docelem/default:elem3[2])",
		"para[@id='1' and lang('en')]",
		"parent::*",
		"parent::*[1]",
		"parent::foo",
		"parent::near-north",
		"position()",
		"position()=1",
		"preceding-sibling::*",
		"preceding-sibling::*/following-sibling::*",
		"preceding-sibling::*[2]",
		"preceding-sibling::*[2]",
		"preceding-sibling::*[2]/following-sibling::*",
		"preceding-sibling::*[2]/following-sibling::*[4]",
		"preceding-sibling::*[2]/following-sibling::*[4]/preceding-sibling::*[5]/following-sibling::*[4]/following-sibling::*[2]",
		"preceding-sibling::*|following-sibling::*",
		"preceding-sibling::child1|//child3",
		"preceding-sibling::child1|following-sibling::child3",
		"preceding-sibling::foo[1]/@att1",
		"preceding-sibling::west",
		"preceding::*",
		"preceding::*[2]/../descendant::*[10]/following-sibling::east",
		"preceding::*[2]/../following::*",
		"preceding::*[4]",
		"preceding::foo[1]/@att1",
		"preceding::out-yonder-west",
		"preceding::text()",
		"preceding::text()[$this]",
		"primary/name/first",
		"primary/name/first",
		"processing-instruction()",
		"pt:xif('test')",
		"pt:xif(string($val))",
		"round(-1.1)=-1",
		"round(-1.5)",
		"round(-1.9)=-2",
		"round(-2.5)=-2",
		"round(0.0)",
		"round(1.1)=1",
		"round(1.24)",
		"round(1.5)=2",
		"round(1.9)=2",
		"round(2.5)",
		"round(2.999999)",
		"round(count(.//LINE) div count(.//SPEECH))",
		"round(n0)",
		"round(n1)",
		"round(n2)",
		"round(number('xxx'))",
		"row",
		"self::*",
		"self::*",
		"self::*[1]",
		"self::*[@center-attr-2]",
		"self::*[near-south]",
		"self::center",
		"self::child1|self::child2",
		"self::comment()",
		"self::foo",
		"self::node()",
		"self::node()",
		"self::node()",
		"self::node()",
		"self::processing-instruction()",
		"self::text()",
		"sigs",
		"sss//i",
		"sss//i",
		"sss/sss",
		"sss/sss",
		"starts-with('','')",
		"starts-with('ENCYCLOPEDIA', 'EN')",
		"starts-with('ENCYCLOPEDIA', 'ENCY')",
		"starts-with('ENCYCLOPEDIA', 'en')",
		"starts-with('ab', 'abc')",
		"starts-with('abc', '')",
		"starts-with('abc', 'bc')",
		"starts-with('true()', 'tr')",
		"starts-with(doc, 'ENCY')",
		"starts-with(doc, 'test')",
		"starts-with(doc/@attr, 'slam')",
		"starts-with(doc/@attr, 'wich')",
		"str:new(string(doc))",
		"str:toUpperCase($str-obj)",
		"string($ResultTreeFragTest)",
		"string($ResultTreeFragTest)",
		"string($emptyResultTreeFragTest)",
		"string($which)",
		"string('!From m!')",
		"string('!From n!')",
		"string('!From o!')",
		"string('!From p!')",
		"string('')",
		"string('test')",
		"string()",
		"string()",
		"string(0)",
		"string(2)",
		"string(av//*)",
		"string(doc)",
		"string(foo)",
		"string-length ()",
		"string-length($str)",
		"string-length('This is a test')",
		"string-length()",
		"string-length()",
		"string-length(.)",
		"string-length(doc)",
		"string-length(doc/a)",
		"sub1/child1|/doc/sub2/child2",
		"sub1/child1|sub2/child2",
		"subj",
		"substring('1999/04/01', 1, 0)",
		"substring('1999/04/01', 1, 4)",
		"substring('ENCYCLOPEDIA', 8)",
		"substring('ENCYCLOPEDIA', 8, 3)",
		"substring('abcdefghi',2,4)",
		"substring('abcdefghijk',0 div 0, 5)",
		"substring('abcdefghijk',4, 6)",
		"substring(@key,2,1)",
		"substring(doc, 1, 4)",
		"substring(doc/@attr, 1, 3)",
		"substring(doc/@attr, 2.5, 3.6)",
		"substring(doc/@attr, 4)",
		"substring(foo, 12, 3)",
		"substring(foo, 2, 2)",
		"substring-after($words,' ')",
		"substring-after('1999/04/01', '/')",
		"substring-after('1999/04/01', '1')",
		"substring-after('ENCYCLOPEDIA', '/')",
		"substring-after('ENCYCLOPEDIA', 'C')",
		"substring-after('abcdefghijk','l')",
		"substring-after(doc, '/')",
		"substring-after(doc/@attr, 'D')",
		"substring-after(doc/@attr, 'd')",
		"substring-after(doc/@attr, 'z')",
		"substring-after(foo, '/')",
		"substring-before('1999/04/01', '/')",
		"substring-before('ENCYCLOPEDIA', '/')",
		"substring-before('ENCYCLOPEDIA', 'C')",
		"substring-before('ENCYCLOPEDIA', 'c')",
		"substring-before('a','z')",
		"substring-before(doc, '/')",
		"substring-before(doc/@attr, 'D')",
		"substring-before(doc/@attr, 'd')",
		"substring-before(doc/@attr, 'z')",
		"substring-before(foo, '/')",
		"sum($rtf)",
		"sum(e)",
		"sum(e)",
		"sum(n)",
		"sum(n/@attrib)",
		"sum(x)",
		"sum(xalan:nodeset($rtf)/default:docelem/default:elem3)",
		"system-property('xsl:vendor')",
		"true() and false()",
		"true() and true()",
		"true() or 1 div 0",
		"true() or false()",
		"true() or true()",
		"true()",
		"true()=2",
		"width * depth",
		"xalan:nodeset($rtf)/default:docelem",
		"xalan:nodeset($rtf)/default:docelem/*",
		"xalan:nodeset($rtf)/default:docelem/default:elem1",
		"xalan:nodeset($rtf)/default:docelem/default:elem1/default:elem1b",
		"xalan:nodeset($rtf)/default:docelem/default:elem2/*",
		"xalan:nodeset($rtf)/default:docelem/default:elem4",
		"xalan:nodeset($rtf)/default:docelem/test:elem3",
		"xalan:nodeset($sorted)/item",
	    "deep-equal(/,foo)"
	]


-- die folgenden tests wurden vom W3C auskommentiert
-- ab hier ersetzen alle ersten -- durch <
-- <!-- arg value="concat(&quot;a&quot;,&quot;b&quot;,&quot;c&quot;,&quot;d&quot;,&quot;ef&quot;)"/ -->
-- <!-- arg value="concat(&quot;bc&quot;, string(23))"/>
-- <test value="concat(&quot;cd&quot;, &quot;34&quot;)"/>
-- <test value="concat(&quot;cd&quot;, 34)"/>
-- <test value="concat(&quot;x&quot;,&quot;yz&quot;)"/ -->

-- <!-- arg value="document(&quot;&quot;)//bdd:test"/>
-- <test value="document(&quot;&quot;)//ped:test"/>
-- <test value="document(&quot;&quot;)/xsl:stylesheet/ped:test[@attrib=&quot;yeha&quot;]"/>
-- <test value="document(&quot;../impincl-test/mdocstest.xml&quot;)//a"/>
-- <test value="document(&quot;../impincl-test/mdocstest.xml&quot;)//b"/ -->

-- <!-- arg value="substring(&quot;12345&quot;, -1 div 0, 1 div 0)"/>
-- <test value="substring(&quot;12345&quot;, -42, 1 div 0)"/>
-- <test value="substring(&quot;12345&quot;, 0 div 0, 3)"/>
-- <test value="substring(&quot;12345&quot;, 0, 3)"/>
-- <test value="substring(&quot;12345&quot;, 1, 0 div 0)"/>
-- <test value="substring(&quot;12345&quot;, 1.5, 2.6)"/ -->

-- <!-- arg value="translate(&quot;B'B&quot;,&quot;'&quot;,&quot;`&quot;)"/>
-- <test value="translate(&quot;BAR&quot;,&quot;Rab&quot;,&quot;TxX&quot;)"/>
-- <test value="translate(&quot;BAR&quot;,&quot;abc&quot;,&quot;ABC&quot;)"/>
-- <test value="translate(&quot;bar&quot;,&quot;RAB&quot;,&quot;xyz&quot;)"/>
-- <test value="translate(&quot;bar&quot;,&quot;abc&quot;,&quot;ABC&quot;)"/>
-- <test value="translate(&quot;ddaaadddd&quot;,&quot;abcd&quot;,&quot;ABCxy&quot;)"/>
-- <test value="translate(&quot;zzaaazzz&quot;,&quot;abcz&quot;,&quot;ABC&quot;)"/>
-- <test value="translate(.,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
-- <test value="translate(a,&quot;abc&quot;,&quot;ABC&quot;)"/>
-- <test value="translate(a/@attrib,&quot;lo&quot;,&quot;IT&quot;)"/>
-- <test value="translate(b,&quot;ABC&quot;,&quot;abc&quot;)"/>
-- <test value="translate(b/@attrib,&quot;LO&quot;,&quot;it&quot;)"/>
-- <test value="translate(b/@attrib,&quot;lo&quot;,&quot;it&quot;)"/>
-- <test value="translate(normalize-space($s), &quot; &quot;, &quot;_&quot;)"/ -->