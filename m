From: Simone Sestini <simone.sestini@plugit.net>
Subject: NAT Information
Date: Wed, 29 Jan 2003 11:13:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20030129110905.058ac020@imap4.plugit.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_75867681==.ALT"
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

--=====================_75867681==.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

Hi folks....

I did a special NAT-Firewall box for a dialup server..

I use the rules like that..

/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.2.0/23 -o eth0 -j 
SNAT --to PUBLIC_IP1
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.4.0/23 -o eth0 -j 
SNAT --to PUBLIC_IP2
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.6.0/23 -o eth0 -j 
SNAT --to PUBLIC_IP3
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.8.0/23 -o eth0 -j 
SNAT --to PUBLIC_IP4
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.10.0/23 -o eth0 -j 
SNAT --to PUBLIC_IP5
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.12.0/23 -o eth0 -j 
SNAT --to PUBLIC_IP6

now.. i need to set for examples the class 10.20.10.0/23 to browse only 
www.microsoft.com and www.ibm.com.

How can i modify my chain ?

I have try to insert a -t nat -A OUTPUT or a -t nat -A PREROUTING rules but 
nothing is blocking the browsinf over internet..

Any idea ?



::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Simone Sestini [ SS971-RIPE ]

Plug IT s.p.a. - Technical Office
Via Galileo Ferraris 216
52100 Arezzo

Titles:
System and Network Administrator
Data Transmission Manager

Fax             +39 199 440088
E-mail  simone.sestini@plugit.net
Web             http://www.plugit.it

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

--=====================_75867681==.ALT
Content-Type: text/html; charset="us-ascii"

<html>
<body>
Hi folks....<br><br>
I did a special NAT-Firewall box for a dialup server..<br><br>
I use the rules like that..<br><br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.2.0/23 -o eth0 -j
SNAT --to PUBLIC_IP1<br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.4.0/23 -o eth0 -j
SNAT --to PUBLIC_IP2<br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.6.0/23 -o eth0 -j
SNAT --to PUBLIC_IP3<br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.8.0/23 -o eth0 -j
SNAT --to PUBLIC_IP4<br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.10.0/23 -o eth0
-j SNAT --to PUBLIC_IP5<br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.12.0/23 -o eth0
-j SNAT --to PUBLIC_IP6<br><br>
now.. i need to set for examples the class 10.20.10.0/23 to browse only
<a href="http://www.microsoft.com/" eudora="autourl">www.microsoft.com</a>
and <a href="http://www.ibm.com/" eudora="autourl">www.ibm.com</a>.<br><br>
How can i modify my chain ?<br><br>
I have try to insert a -t nat -A OUTPUT or a -t nat -A PREROUTING rules but nothing is blocking the browsinf over internet..<br><br>
Any idea ?<br><br>
<br>
<x-sigsep><p></x-sigsep>
<font face="Verdana">::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::<br><br>
</font><font face="Verdana" color="#FF0000"><b>Simone Sestini </font><font face="Verdana" size=2 color="#FF0000">[ SS971-RIPE ]<br><br>
</b></font>Plug IT s.p.a. - Technical Office<br>
Via Galileo Ferraris 216<br>
52100 Arezzo<br><br>
<tt><font face="Courier New, Courier" color="#0000FF">Titles:<br>
System and Network Administrator<br>
Data Transmission Manager<br><br>
Fax<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>+39 199 440088<br>
E-mail<x-tab>&nbsp;&nbsp;</x-tab>simone.sestini@plugit.net<br>
Web<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><a href="http://www.plugit.it/" eudora="autourl">http://www.plugit.it</a><br><br>
</font></tt><font face="Verdana"><u>:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: <br>
</font></u></body>
</html>

--=====================_75867681==.ALT--


