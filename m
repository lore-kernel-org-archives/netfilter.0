From: Simone Sestini <simone.sestini@plugit.net>
Subject: nat logging
Date: Mon, 11 Aug 2003 09:34:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20030811092514.026a82c8@imap4.plugit.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_325829738==.ALT"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

--=====================_325829738==.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

Hi all..


I have a system with two nat box in front of it..
i use iptables for nat and i would like to know if is possible to log all 
the connection like a proxy server (es: squid)..

right now i'm able to log the connection using

iptables -t nat -A POSTROUTING -s 10.50.72.0/23 -o eth0 -j LOG --log-level 
debug --log-prefix "POSTRT: "
iptables -t nat -A POSTROUTING -s 10.50.72.0/23 -o eth0 -j SNAT --to 
111.111.111.111

but on  my nat.log file i can get only

Aug 11 11:20:53 gw2-709nat kernel: POSTRT: IN= OUT=eth0 SRC=10.50.72.6 
DST=213.199.150.90 LEN=78 TOS=0x00 PREC=0x00 TTL=126 ID=4530 PROTO=UDP 
SPT=137 DPT=137 LEN=58



Anyone know if it's possible to see what kind of files the client has 
requested too ? i need a debug similar to squid..

Any idea ?

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Simone Sestini [ SS971-RIPE ]

Plug IT s.p.a. - Technical Office
Via Ernesto Rossi
52100 Arezzo

Fax             +39-199-440088
E-mail  simone.sestini@plugit.net
Web             http://www.plugit.it

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

--=====================_325829738==.ALT
Content-Type: text/html; charset="us-ascii"

<html>
<body>
Hi all..<br><br>
<br>
I have a system with two nat box in front of it..<br>
i use iptables for nat and i would like to know if is possible to log all
the connection like a proxy server (es: squid)..<br><br>
right now i'm able to log the connection using<br><br>
iptables -t nat -A POSTROUTING -s 10.50.72.0/23 -o eth0 -j LOG
--log-level debug --log-prefix &quot;POSTRT: &quot;<br>
iptables -t nat -A POSTROUTING -s 10.50.72.0/23 -o eth0 -j SNAT --to
111.111.111.111<br><br>
but on&nbsp; my nat.log file i can get only<br><br>
Aug 11 11:20:53 gw2-709nat kernel: POSTRT: IN= OUT=eth0 SRC=10.50.72.6
DST=213.199.150.90 LEN=78 TOS=0x00 PREC=0x00 TTL=126 ID=4530 PROTO=UDP
SPT=137 DPT=137 LEN=58<br><br>
<br><br>
Anyone know if it's possible to see what kind of files the client has
requested too ? i need a debug similar to squid..<br><br>
Any idea ?<br>
<x-sigsep><p></x-sigsep>
<font face="Verdana">::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::<br><br>
</font><font face="Verdana" color="#FF0000"><b>Simone Sestini
</font><font face="Verdana" size=2 color="#FF0000">[ SS971-RIPE
]<br><br>
</b></font>Plug IT s.p.a. - Technical Office<br>
Via Ernesto Rossi<br>
52100 Arezzo<br><br>
<tt><font face="Courier New, Courier" color="#0000FF">Fax<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>+39-199-440088<br>
E-mail<x-tab>&nbsp;&nbsp;</x-tab>simone.sestini@plugit.net<br>
Web<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><a href="http://www.plugit.it/" eudora="autourl">http://www.plugit.it</a><br><br>
</font></tt><font face="Verdana"><u>::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
<br>
</font></u></body>
</html>

--=====================_325829738==.ALT--


