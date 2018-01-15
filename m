From: volga629@networklab.ca
Subject: ulogd2 doc
Date: Mon, 15 Jan 2018 00:17:23 -0400
Message-ID: <1515989843.1831.12@smtp.networklab.ca>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello Everyone,
In ulogd 2.0.5 having issue generate doc for rpmbuild.
Any help thank you

[volga629@canldev01-fedora27 ulogd-2.0.5]$ make -C doc
make: Entering directory '/home/volga629/rpmbuild/BUILD/ulogd-2.0.5/doc'
sgml2txt ulogd.sgml
Processing file ulogd.sgml
nsgmls:<OSFD>0:3:8:E: document type does not allow element "ARTICLE" 
here; assuming missing "LINUXDOC" start-tag
nsgmls:<OSFD>0:5:6:E: document type does not allow element "TITLE" 
here; assuming missing "TITLEPAG" start-tag
nsgmls:<OSFD>0:6:8:E: character data is not allowed here
nsgmls:<OSFD>0:6:90:E: end tag for "AUTHOR" which is not finished
nsgmls:<OSFD>0:16:4:E: document type does not allow element "TOC" here
nsgmls:<OSFD>0:18:5:E: document type does not allow element "SECT" here
nsgmls:<OSFD>0:18:6:E: character data is not allowed here
nsgmls:<OSFD>0:20:6:E: document type does not allow element "SECT1" here
nsgmls:<OSFD>0:20:7:E: character data is not allowed here
nsgmls:<OSFD>0:21:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:25:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:29:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:32:0:E: character data is not allowed here
nsgmls:<OSFD>0:34:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:35:0:E: character data is not allowed here
nsgmls:<OSFD>0:38:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:39:0:E: character data is not allowed here
nsgmls:<OSFD>0:44:9:E: end tag for "DESCRIP" which is not finished
nsgmls:<OSFD>0:45:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:50:1:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:51:6:E: document type does not allow element "SECT1" here
nsgmls:<OSFD>0:51:7:E: character data is not allowed here
nsgmls:<OSFD>0:52:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:63:1:E: document type does not allow element "P" here
nsgmls:<OSFD>0:64:5:E: document type does not allow element "SECT" here
nsgmls:<OSFD>0:64:6:E: character data is not allowed here
nsgmls:<OSFD>0:65:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:66:6:E: document type does not allow element "SECT1" here
nsgmls:<OSFD>0:66:7:E: character data is not allowed here
nsgmls:<OSFD>0:67:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:70:1:E: document type does not allow element "P" here
nsgmls:<OSFD>0:71:6:E: document type does not allow element "SECT1" here
nsgmls:<OSFD>0:71:7:E: character data is not allowed here
nsgmls:<OSFD>0:72:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:78:1:E: document type does not allow element "P" here
nsgmls:<OSFD>0:79:1:E: document type does not allow element "P" here
nsgmls:<OSFD>0:80:6:E: document type does not allow element "SECT1" here
nsgmls:<OSFD>0:80:7:E: character data is not allowed here
nsgmls:<OSFD>0:81:6:E: document type does not allow element "SECT2" here
nsgmls:<OSFD>0:81:7:E: character data is not allowed here
nsgmls:<OSFD>0:82:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:85:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:87:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:89:1:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:90:5:E: document type does not allow element "SECT" here
nsgmls:<OSFD>0:90:6:E: character data is not allowed here
nsgmls:<OSFD>0:91:6:E: document type does not allow element "SECT1" here
nsgmls:<OSFD>0:91:7:E: character data is not allowed here
nsgmls:<OSFD>0:92:6:E: document type does not allow element "SECT2" here
nsgmls:<OSFD>0:92:7:E: character data is not allowed here
nsgmls:<OSFD>0:93:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:99:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:109:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:113:6:E: document type does not allow element "SECT2" 
here
nsgmls:<OSFD>0:113:7:E: character data is not allowed here
nsgmls:<OSFD>0:114:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:117:0:E: character data is not allowed here
nsgmls:<OSFD>0:120:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:121:0:E: character data is not allowed here
nsgmls:<OSFD>0:123:63:E: document type does not allow element "TT" 
here; assuming missing "P" start-tag
nsgmls:<OSFD>0:125:4:E: document type does not allow element "TAG" 
here; assuming missing "DESCRIP" start-tag
nsgmls:<OSFD>0:126:0:E: character data is not allowed here
nsgmls:<OSFD>0:130:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:131:0:E: character data is not allowed here
nsgmls:<OSFD>0:133:9:E: end tag for "DESCRIP" which is not finished
nsgmls:<OSFD>0:135:6:E: document type does not allow element "SECT1" 
here
nsgmls:<OSFD>0:135:7:E: character data is not allowed here
nsgmls:<OSFD>0:136:6:E: document type does not allow element "SECT2" 
here
nsgmls:<OSFD>0:136:7:E: character data is not allowed here
nsgmls:<OSFD>0:137:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:143:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:153:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:157:6:E: document type does not allow element "SECT2" 
here
nsgmls:<OSFD>0:157:7:E: character data is not allowed here
nsgmls:<OSFD>0:158:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:161:0:E: character data is not allowed here
nsgmls:<OSFD>0:164:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:165:0:E: character data is not allowed here
nsgmls:<OSFD>0:167:63:E: document type does not allow element "TT" 
here; assuming missing "P" start-tag
nsgmls:<OSFD>0:168:4:E: document type does not allow element "TAG" 
here; assuming missing "DESCRIP" start-tag
nsgmls:<OSFD>0:169:0:E: character data is not allowed here
nsgmls:<OSFD>0:173:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:174:0:E: character data is not allowed here
nsgmls:<OSFD>0:176:9:E: end tag for "DESCRIP" which is not finished
nsgmls:<OSFD>0:178:6:E: document type does not allow element "SECT2" 
here
nsgmls:<OSFD>0:178:7:E: character data is not allowed here
nsgmls:<OSFD>0:179:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:184:0:E: character data is not allowed here
nsgmls:<OSFD>0:193:6:E: document type does not allow element "SECT2" 
here
nsgmls:<OSFD>0:193:7:E: character data is not allowed here
nsgmls:<OSFD>0:194:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:199:0:E: character data is not allowed here
nsgmls:<OSFD>0:200:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:201:0:E: character data is not allowed here
nsgmls:<OSFD>0:202:9:E: end tag for "DESCRIP" which is not finished
nsgmls:<OSFD>0:203:1:E: document type does not allow element "P" here
nsgmls:<OSFD>0:204:6:E: document type does not allow element "SECT1" 
here
nsgmls:<OSFD>0:204:7:E: character data is not allowed here
nsgmls:<OSFD>0:205:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:207:1:E: document type does not allow element "P" here
nsgmls:<OSFD>0:208:6:E: document type does not allow element "SECT2" 
here
nsgmls:<OSFD>0:208:7:E: character data is not allowed here
nsgmls:<OSFD>0:209:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:220:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:223:0:E: character data is not allowed here
nsgmls:<OSFD>0:224:3:E: document type does not allow element "TT" here; 
assuming missing "P" start-tag
nsgmls:<OSFD>0:225:9:E: end tag for "P" omitted, but OMITTAG NO was 
specified
nsgmls:<OSFD>0:224:0: start tag was here
nsgmls:<OSFD>0:226:1:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:227:6:E: document type does not allow element "SECT2" 
here
nsgmls:<OSFD>0:227:7:E: character data is not allowed here
nsgmls:<OSFD>0:228:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:231:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:234:15:E: character data is not allowed here
nsgmls:<OSFD>0:235:3:E: document type does not allow element "TT" here; 
assuming missing "P" start-tag
nsgmls:<OSFD>0:236:4:E: document type does not allow element "TAG" 
here; assuming missing "DESCRIP" start-tag
nsgmls:<OSFD>0:236:15:E: character data is not allowed here
nsgmls:<OSFD>0:238:32:E: document type does not allow element "TT" 
here; assuming missing "P" start-tag
nsgmls:<OSFD>0:239:9:E: end tag for "P" omitted, but OMITTAG NO was 
specified
nsgmls:<OSFD>0:238:29: start tag was here
nsgmls:<OSFD>0:241:6:E: document type does not allow element "SECT2" 
here
nsgmls:<OSFD>0:241:7:E: character data is not allowed here
nsgmls:<OSFD>0:242:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:246:1:E: document type does not allow element "P" here
nsgmls:<OSFD>0:247:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:254:1:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:255:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:259:1:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:260:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:262:1:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:263:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:267:0:E: character data is not allowed here
nsgmls:<OSFD>0:268:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:269:0:E: character data is not allowed here
nsgmls:<OSFD>0:273:8:E: document type does not allow element "ITEMIZE" 
here; assuming missing "P" start-tag
nsgmls:<OSFD>0:283:4:E: document type does not allow element "TAG" 
here; assuming missing "DESCRIP" start-tag
nsgmls:<OSFD>0:284:0:E: character data is not allowed here
nsgmls:<OSFD>0:285:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:286:0:E: character data is not allowed here
nsgmls:<OSFD>0:287:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:288:0:E: character data is not allowed here
nsgmls:<OSFD>0:289:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:290:0:E: character data is not allowed here
nsgmls:<OSFD>0:291:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:292:0:E: character data is not allowed here
nsgmls:<OSFD>0:293:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:294:0:E: character data is not allowed here
nsgmls:<OSFD>0:296:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:297:0:E: character data is not allowed here
nsgmls:<OSFD>0:298:9:E: end tag for "DESCRIP" which is not finished
nsgmls:<OSFD>0:300:6:E: document type does not allow element "SECT2" 
here
nsgmls:<OSFD>0:300:7:E: character data is not allowed here
nsgmls:<OSFD>0:301:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:305:1:E: document type does not allow element "P" here
nsgmls:<OSFD>0:306:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:313:1:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:314:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:318:1:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:319:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:321:1:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:322:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:326:0:E: character data is not allowed here
nsgmls:<OSFD>0:327:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:328:0:E: character data is not allowed here
nsgmls:<OSFD>0:330:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:331:0:E: character data is not allowed here
nsgmls:<OSFD>0:332:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:333:0:E: character data is not allowed here
nsgmls:<OSFD>0:334:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:335:0:E: character data is not allowed here
nsgmls:<OSFD>0:336:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:337:0:E: character data is not allowed here
nsgmls:<OSFD>0:338:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:339:0:E: character data is not allowed here
nsgmls:<OSFD>0:340:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:341:0:E: character data is not allowed here
nsgmls:<OSFD>0:342:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:343:0:E: character data is not allowed here
nsgmls:<OSFD>0:345:4:E: document type does not allow element "TAG" here
nsgmls:<OSFD>0:346:0:E: character data is not allowed here
nsgmls:<OSFD>0:347:9:E: end tag for "DESCRIP" which is not finished
nsgmls:<OSFD>0:348:1:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:349:6:E: document type does not allow element "SECT2" 
here
nsgmls:<OSFD>0:349:7:E: character data is not allowed here
nsgmls:<OSFD>0:350:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:354:1:E: document type does not allow element "P" here
nsgmls:<OSFD>0:358:0:E: character data is not allowed here
nsgmls:<OSFD>0:359:3:E: document type does not allow element "TT" here; 
assuming missing "P" start-tag
nsgmls:<OSFD>0:360:4:E: document type does not allow element "TAG" 
here; assuming missing "DESCRIP" start-tag
nsgmls:<OSFD>0:361:0:E: character data is not allowed here
nsgmls:<OSFD>0:361:15:E: document type does not allow element "TT" 
here; assuming missing "P" start-tag
nsgmls:<OSFD>0:364:9:E: end tag for "P" omitted, but OMITTAG NO was 
specified
nsgmls:<OSFD>0:361:12: start tag was here
nsgmls:<OSFD>0:366:6:E: document type does not allow element "SECT2" 
here
nsgmls:<OSFD>0:366:7:E: character data is not allowed here
nsgmls:<OSFD>0:367:2:E: document type does not allow element "P" here
nsgmls:<OSFD>0:371:1:E: document type does not allow element "P" here
nsgmls:<OSFD>0:372:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:378:1:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:379:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:383:1:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:384:2:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:<OSFD>0:389:1:E: document type does not allow element "P" here; 
missing one of "DESCRIP", "LQ", "QUOTE", "TSCREEN", "DEF", "PROP", 
"LEMMA", "COROLL", "PROOF", "THEOREM" start-tag
nsgmls:I: maximum number of errors (200) reached; change with -E option
LinuxdocTools::process_file: nsgmls failed with exit status 1. Aborting 
...
make: *** [Makefile:2: all] Error 25
make: Leaving directory '/home/volga629/rpmbuild/BUILD/ulogd-2.0.5/doc'

