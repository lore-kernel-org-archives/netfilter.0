From: Filippo Zeus <filippozeus@gmail.com>
Subject: Re: iptables ip_conntrack_ftp + proftpd TLS: PORT command not understood
Date: Tue, 27 May 2008 03:14:22 +0200
Message-ID: <483B606E.9050305@gmail.com>
References: <483B0E5E.4010209@gmail.com> <483B11DF.3050904@bofhland.org> <483B16F7.2010205@gmail.com> <483B2069.7010504@trash.net>
Reply-To: filippozeus@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:disposition-notification-to:date:from:reply-to:user-agent:mime-version:to:subject:references:in-reply-to:content-type:content-transfer-encoding;
        bh=VrKc7DKjwl/i6SMgbrynTJdMZgMDok1RkE9zTfZiwQU=;
        b=eEg3LaEU9W929V6vjC1thNOHv1lsjob8ar6ggGzgzMH61VUM2GB1uD+znNhQYCmjov38GQseHQsZlhjVAl2Kri9WZ4+NhY6PclRHeEeQCBPKqt1xfFBaKbOWxAdk0DgiyJZSXfBmAeyRLC9Ei/L/5krfLFhuSrmP7P8dNeMmaL8=
In-Reply-To: <483B2069.7010504@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Considering ftp-control port is text based i've dumped with -A switch. I 
hope it's ok

********** TCPDUMP LOG STARTS HERE **********
[zeus@augustus ~] % sudo tcpdump -A -i ppp0 -n
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ppp0, link-type PPP (PPP), capture size 96 bytes
03:05:57.045277 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: S 
834183062:834183062(0) win 8192 <mss 1460,nop,wscale 3,nop,nop,timestamp 
538543633 0,sackOK,eol>
2....1......... ................
 ...........
03:05:58.008113 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: S 
834183062:834183062(0) win 8192 <mss 1460,nop,wscale 3,nop,nop,timestamp 
538543642 0,sackOK,eol>
2....1......... ................
 ...........
03:05:58.289943 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: S 
3283700948:3283700948(0) ack 834183063 win 5840 <mss 
1420,nop,nop,sackOK,nop,wscale 7>
2.P.?......L.1.......................
03:05:58.290033 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: . ack 1 win 1024
2....1.....L.P....Y..+
03:05:59.103851 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: S 
3283700948:3283700948(0) ack 834183063 win 5840 <mss 
1420,nop,nop,sackOK,nop,wscale 7>
2.P.?......L.1.......................
03:05:59.103934 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: . ack 1 win 1024
2....1.....L.P....Y..+
03:05:59.149005 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: P 1:71(70) 
ack 1 win 46
2.P.?......L.1...P....`..220 FTP Server ready. Please use FTP-TLS or 
login wi
03:05:59.149078 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: . ack 71 win 1024
2....1.....M.P.......+
03:05:59.149759 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: P 1:11(10) 
ack 71 win 1024
2....1.....M.P.......AUTH TLS

03:05:59.700919 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: . ack 11 win 46
2.P.?......M.1...P.......
03:05:59.700939 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: P 71:96(25) 
ack 11 win 46
2.P.?......M.1...P...O...234 AUTH TLS successful

03:05:59.701036 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: . ack 96 win 1024
2....1.....M4P.......+
03:05:59.706276 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: P 11:95(84) 
ack 96 win 1024
2....1.....M4P...L.......O...K..H;^w.i} ..\*.+....'b..]...5`.O....$.3.E.9
03:06:00.416441 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: P 
1516:1666(150) ack 95 win 46
2.P.?......R.1...P....[...)E..5O......tsp.+).)..W[H..u.)IP..&....XZr...~.<...
03:06:00.416535 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: . ack 96 win 
1024 <nop,nop,sack 1 {1516:1666}>
2....1.....M4...........
..R...SV
03:06:00.435501 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: . 
96:1516(1420) ack 95 win 46
2.P.?......M41...P...........J...F..H;^x2...qYQP..H:=...H%I=3..X....
.......
03:06:00.435594 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: . ack 1666 
win 1024
2....1.....SVP....z..+
03:06:00.506622 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: P 95:234(139) 
ack 1666 win 1024
2....1.....SVP..................8......(......k.8.v.....~W.y...!Ot.......
03:06:01.200890 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: . ack 234 win 54
2.P.?......SV1...P..6....
03:06:01.200956 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: P 
234:437(203) ack 1666 win 1024
X?..A...M'........$..M.S.........../..X........
03:06:01.882933 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: . ack 437 win 63
2.P.?......SV1..KP..?....
03:06:01.882941 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: P 
1666:1725(59) ack 437 win 63
2.P.?......SV1..KP..?..............0....9.../!L.]..z^..5&VEL....D..^-...S...-
03:06:01.883016 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: . ack 1725 
win 1024
2....1..K..S.P.......+
03:06:01.903140 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: P 
437:650(213) ack 1725 win 1024
...&q..p0.......$]..........M.}..{..^`v..o....H.1..
03:06:02.666951 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: P 
1725:1794(69) ack 650 win 71
2.P.?......S.1.. 
P..Gz.......@)C.#.B1....9....6.=u..6......&..4<...,F..#.y..*
03:06:02.667022 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: . ack 1794 
win 1024
2....1.. ..S.P.......+
03:06:02.681297 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: P 650:719(69) 
ack 1794 win 1024
2....1.. ..S.P....`......@...T././......s.. D..k#......X..V.F......Phv,..
03:06:03.288189 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: P 
1794:1975(181) ack 719 win 71
2.P.?......S.1..eP..G..........,.........;......c7m.~r.._#..OFw.P.`d@F..%...f
03:06:03.288267 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: . ack 1975 
win 1024
2....1..e..T.P.......+
03:06:03.292196 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: P 
719:900(181) ack 1975 win 1024
2....1..e..T.P...W>.........>..
..D0.....@.M.'...c".... B........l.T.....
03:06:04.047064 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: P 
1975:2028(53) ack 900 win 80
2.P.?......T.1...P..P........0.7D...y..9iC..p%f...kM;.rg|n).l)I.&..-.!4.OH...
03:06:04.047141 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: . ack 2028 
win 1024
2....1.....T.P.......+
03:06:04.051879 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: P 900:953(53) 
ack 2028 win 1024
&....1.....T.P...........0.a.......rR..Y....}..:....7O.E.k.<    .'.m/..
03:06:04.781092 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: P 
2028:2097(69) ack 953 win 80
2.P.?......T.1..OP..Py.......@.u_U=.g........
.......^..c.|..9..
03:06:04.781176 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: . ack 2097 
win 1024
2....1..O..U.P....q..+
03:06:04.793662 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: P 
953:1054(101) ack 2097 win 1024
...!E...:
2....1..O..U.P...........`...8_B.|2.`..$.>....W&.#.8.D..J.o.8..Z,.......+
03:06:05.417095 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: P 
2097:2166(69) ack 1054 win 80
2.P.?......U.1...P..P\ 
......@..8.....]..K....=\...v3..;Z0K....A=u.....3MRg.M
03:06:05.417171 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: . ack 2166 
win 1024
2....1.....UJP.......
03:06:05.422336 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: P 
1054:1267(213) ack 2166 win 1024
2....1.....UJP....k............if6.J=.wyJ.....nIp....4cS.]....^2.x..*.D.I
03:06:06.211021 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: P 
2166:2219(53) ack 1267 win 88
2.P.?......UJ1...P..X........0mr...1......w....5..aD.k....H..A.I..5~...eHk#|:
03:06:06.211102 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: . ack 2219 
win 1024
2....1.....U.P.......+
03:06:06.215691 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: P 
1267:1480(213) ack 2219 win 1024
2....1.....U.P..............Y[,.s....d.)...h....]..W[W%...C4U.#... .}.c.A
03:06:06.985733 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: P 
2219:2304(85) ack 1480 win 96
2.P.?......U.1..^P..`.`......PH...5/.u.....!....8.z..V/{.qx..;..._.v...b.\.N"
03:06:06.985773 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: . ack 2304 
win 1024
2....1..^..U.P.......+
03:06:06.990020 IP 151.80.2.63.55195 > ***HIDDEN_IP***.42770: S 
2291999512:2291999512(0) win 8192 <mss 1460,nop,wscale 
3,nop,nop,timestamp 538543732 0,sackOK,eol>
2......#....... .R!.............
 ..t........
03:06:06.990156 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: P 
1480:1533(53) ack 2304 win 1024
2....1..^..U.P.....?M+  
......0..|c.%....RM.f.ja.*....s.....}..^]....l*m=eE+.Q
03:06:07.703988 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: . ack 1533 win 96
2.P.?......U.1...P..`....
03:06:07.921114 IP 151.80.2.63.55195 > ***HIDDEN_IP***.42770: S 
2291999512:2291999512(0) win 8192 <mss 1460,nop,wscale 
3,nop,nop,timestamp 538543741 0,sackOK,eol>
2......#....... .R..............
 ..}........
03:06:08.922451 IP 151.80.2.63.55195 > ***HIDDEN_IP***.42770: S 
2291999512:2291999512(0) win 8192 <mss 1460,nop,wscale 
3,nop,nop,timestamp 538543751 0,sackOK,eol>
2......#....... .R..............
 ...........
03:06:09.923976 IP 151.80.2.63.55195 > ***HIDDEN_IP***.42770: S 
2291999512:2291999512(0) win 8192 <mss 1460,sackOK,eol>
...!E..0<^@.@.
2......#.....p. .E...........
03:06:10.925518 IP 151.80.2.63.55195 > ***HIDDEN_IP***.42770: S 
2291999512:2291999512(0) win 8192 <mss 1460,sackOK,eol>
2......#.....p. .E...........
03:06:11.926834 IP 151.80.2.63.55195 > ***HIDDEN_IP***.42770: S 
2291999512:2291999512(0) win 8192 <mss 1460,sackOK,eol>
2......#.....p. .E...........
^C
52 packets captured
53 packets received by filter
0 packets dropped by kernel
[zeus@augustus ~] %
********** TCPDUMP LOG ENDS HERE **********


> Please send a tcpdump.
>
