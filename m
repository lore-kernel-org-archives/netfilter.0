From: Simone Sestini <simone.sestini@plugit.net>
Subject: iptables and ULOG
Date: Wed, 13 Aug 2003 17:38:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20030813173340.02455328@imap4.plugit.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_192534780==.ALT"
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

--=====================_192534780==.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

Hi all..

I'm trying to use ULOG with iptables for log all the nat traslation done by 
my nat box..
I would like to see something like a proxy server..

My iptables is something like

/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.50.72.0/23 -o eth0 -j 
ULOG --ulog-nlgroup 32 --ulog-prefix "ULOG"
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.50.72.0/23 -o eth0 -j 
SNAT --to 1.1.1.1


I run ulogd and all is correct but with nlgroup 32 i can see only the dns 
request and nothing more.. well is see..

Aug 13 19:18:27 gw2-709nat Userspace-LOG:  IN= OUT=eth0 
MAC=a7:5f:78:4b:d0:36:d9:36:bd:d3:dc:8a:81:a5:03:e7:10:7f:df:66:39:f9:ec:1c:39:2d:e1:2d:05:db:bd:c8:a7:ee:2f:a3:8a:f6:7e:30:ed:60:d2:ae:2b:6f:97:3e:fb:35:99:7d:1f:9d:96:96:72:45:49:4b:4b:d6:bd:50:25:ef:87:ec:2c:75:7f:cb:65:3c:d4:9b:6b:56:2e:71:45:00:00:41:26:2d:00:00:7e:11:1e:07:0a:32:48:04:c3:3e:e3:03:06:84:00:35:00:2d:d6:25:00:01:01:00:00:01:00:00:00:00:00:00:03:77:77:77:0b:63:6f:6e:6e:65:74:74:69:6f:72:61:03:63:6f:6d:00:00:01:00:01:0c:00:01:33:07:9d:00:00:00 
SRC=10.50.72.4 DST=1.1.1.3 LEN=65 TOS=00 PREC=0x00 TTL=126 ID=9773 
PROTO=UDP SPT=1668 DPT=53 LEN=45


I would like to use ulog for get something like.

Aug 13 19:18:27 gw2-709nat Userspace-LOG: SRC=10.50.72.4  DST=1.2.3.4 
/index.html

for examples...

Something like the normal squid logging options..

I can't use transparent proxy for my nt box so i have to use ulog for get 
directly the data..

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

--=====================_192534780==.ALT
Content-Type: text/html; charset="us-ascii"

<html>
<body>
Hi all..<br><br>
I'm trying to use ULOG with iptables for log all the nat traslation done
by my nat box..<br>
I would like to see something like a proxy server..<br><br>
My iptables is something like<br><br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.50.72.0/23 -o eth0
-j ULOG --ulog-nlgroup 32 --ulog-prefix &quot;ULOG&quot;<br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.50.72.0/23 -o eth0
-j SNAT --to 1.1.1.1<br><br>
<br>
I run ulogd and all is correct but with nlgroup 32 i can see only the dns
request and nothing more.. well is see..<br><br>
Aug 13 19:18:27 gw2-709nat Userspace-LOG:&nbsp; IN= OUT=eth0
MAC=a7:5f:78:4b:d0:36:d9:36:bd:d3:dc:8a:81:a5:03:e7:10:7f:df:66:39:f9:ec:1c:39:2d:e1:2d:05:db:bd:c8:a7:ee:2f:a3:8a:f6:7e:30:ed:60:d2:ae:2b:6f:97:3e:fb:35:99:7d:1f:9d:96:96:72:45:49:4b:4b:d6:bd:50:25:ef:87:ec:2c:75:7f:cb:65:3c:d4:9b:6b:56:2e:71:45:00:00:41:26:2d:00:00:7e:11:1e:07:0a:32:48:04:c3:3e:e3:03:06:84:00:35:00:2d:d6:25:00:01:01:00:00:01:00:00:00:00:00:00:03:77:77:77:0b:63:6f:6e:6e:65:74:74:69:6f:72:61:03:63:6f:6d:00:00:01:00:01:0c:00:01:33:07:9d:00:00:00&nbsp;
SRC=10.50.72.4 DST=1.1.1.3 LEN=65 TOS=00 PREC=0x00 TTL=126 ID=9773
PROTO=UDP SPT=1668 DPT=53 LEN=45 <br><br>
<br>
I would like to use ulog for get something like.<br><br>
Aug 13 19:18:27 gw2-709nat Userspace-LOG: SRC=10.50.72.4&nbsp;
DST=1.2.3.4 /index.html <br><br>
for examples...<br><br>
Something like the normal squid logging options..<br><br>
I can't use transparent proxy for my nt box so i have to use ulog for get
directly the data..<br><br>
Any idea ?<br><br>
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

--=====================_192534780==.ALT--


