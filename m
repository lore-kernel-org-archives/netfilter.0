From: Simone Sestini <simone.sestini@plugit.net>
Subject: Redirection
Date: Wed, 09 Apr 2003 12:15:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20030409121155.02472d98@imap4.plugit.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_63945879==.ALT"
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

--=====================_63945879==.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

Hi all.. i have a situation where i need to use iptables..

I have a public www with some virtual hosts on a machine with public ip 
2.2.2.2.
I have with another provider a second server with public ip 1.1.1.1

On dns server i wrote that intra.pippo.foo has address 1.1.1.1 so all the 
internet request come to machine 1.1.1.1 port 80.
I want that the server 1.1.1.1 redirects all the call on port 80 and 443 to 
the server 2.2.2.2 in transparent mode.. i don't want end user to know that 
datas are over server 2.2.2.2.

Naturally the www server on 2.2.2.2 listen on port 80 for intra.pippo.foo

How can i menage the packets with iptables for do that ?

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Simone Sestini [ SS971-RIPE ]

Plug IT s.p.a. - Technical Office
Via Galileo Ferraris 216
52100 Arezzo

Titles:
System and Network Administrator
Data Transmission Manager

Fax             +39-199-4400-88
E-mail  simone.sestini@plugit.net
Web             http://www.plugit.it

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

--=====================_63945879==.ALT
Content-Type: text/html; charset="us-ascii"

<html>
<body>
Hi all.. i have a situation where i need to use iptables..<br><br>
I have a public www with some virtual hosts on a machine with public ip
2.2.2.2.<br>
I have with another provider a second server with public ip
1.1.1.1<br><br>
On dns server i wrote that intra.pippo.foo has address 1.1.1.1 so all the
internet request come to machine 1.1.1.1 port 80.<br>
I want that the server 1.1.1.1 redirects all the call on port 80 and 443
to the server 2.2.2.2 in transparent mode.. i don't want end user to know
that datas are over server 2.2.2.2.<br><br>
Naturally the www server on 2.2.2.2 listen on port 80 for
intra.pippo.foo<br><br>
How can i menage the packets with iptables for do that ?<br>
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
Fax<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>+39-199-4400-88<br>
E-mail<x-tab>&nbsp;&nbsp;</x-tab>simone.sestini@plugit.net<br>
Web<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><a href="http://www.plugit.it/" eudora="autourl">http://www.plugit.it</a><br><br>
</font></tt><font face="Verdana"><u>::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
<br>
</font></u></body>
</html>

--=====================_63945879==.ALT--


