From: Simone Sestini <simone.sestini@plugit.net>
Subject: NAT and logging options
Date: Fri, 06 Dec 2002 17:29:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20021206172731.05585a90@imap4.plugit.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_1402998244==.ALT"
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
To: netfilter@lists.samba.org

--=====================_1402998244==.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

Hi folks..

I have a NAT gateway box that have to NAT billions of connection from 
private ips to public world.

I have thousand of strings like that

/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.10.0.0/23 -o eth0 -j 
SNAT --to PUBLIC_IP
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.10.2.0/23 -o eth0 -j 
SNAT --to PUBLIC_IP

Now i want to be able to log all that traffic to a specific file ?
Anyonw know how to do this ?


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Simone Sestini [ SS971-RIPE ]

Plug IT s.p.a. - Technical Office
Via Galileo Ferraris 216
52100 Arezzo

Titles:
System and Network Administrator
Data Transmission Manager

Fax             +39 199 440088
E-mail          simone.sestini@plugit.net
Web             http://www.plugit.it

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

--=====================_1402998244==.ALT
Content-Type: text/html; charset="us-ascii"

<html>
<body>
Hi folks..<br><br>
I have a NAT gateway box that have to NAT billions of connection from
private ips to public world.<br><br>
I have thousand of strings like that<br><br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.10.0.0/23 -o eth0 -j
SNAT --to PUBLIC_IP<br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.10.2.0/23 -o eth0 -j
SNAT --to PUBLIC_IP<br><br>
Now i want to be able to log all that traffic to a specific file ?<br>
Anyonw know how to do this ?<br><br>
<x-sigsep><p></x-sigsep>
<font face="Verdana">::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::<br><br>
</font><font face="Verdana" color="#FF0000"><b>Simone Sestini
</font><font face="Verdana" size=2 color="#FF0000">[ SS971-RIPE
]<br><br>
</b></font>Plug IT s.p.a. - Technical Office<br>
Via Galileo Ferraris 216<br>
52100 Arezzo<br><br>
<tt><font face="Courier New, Courier" color="#0000FF">Titles:<br>
System and Network Administrator<br>
Data Transmission Manager<br><br>
</font></tt><font color="#0000FF">Fax<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>+39
199 440088<br>
E-mail<x-tab>&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>simone.sestini@plugit.net<br>
Web<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><a href="http://www.plugit.it/" eudora="autourl">http://www.plugit.it</a><br><br>
</font><font face="Verdana"><u>::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
<br>
</font></u></body>
</html>

--=====================_1402998244==.ALT--


