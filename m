From: Simone Sestini <simone.sestini@plugit.net>
Subject: again redirection tourbles
Date: Mon, 14 Apr 2003 18:58:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20030414184639.02dfafd0@imap4.plugit.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_29697552==.ALT"
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
Cc: Eric Joe <sysop@tje1.com>

--=====================_29697552==.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

Like Eric told this should be the right solution...

================ CUT ===============
Subject: Re: redirection
To: <lyra@fastwebnet.it>
Cc: <netfilter@lists.netfilter.org>

I didnt catch the fact that you need the source address. Are you tracking
this for a reason? You can probably have iptables log the source address.
This does in fact work, been using it for  about 6 months now. Let me post
my exact rules (IPs are obsfucated)

iptables -t nat -A PREROUTING -i eth0 -s 192.168.1.0/24 -p tcp --dport 80
-d 192.168.1.7 -j DNAT --to 192.168.1.7

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -d 192.168.1.7 -j
DNAT --to 192.168.1.11:80
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 192.168.1.7


Regards
Eric

================ CUT ===============

On this examples he use the same interface eth0 over the same subnet..
My problem is a bit different..

The server machine using iptables has only one interface like this one but 
the subnet where i need to redirect the packets are far geographically and 
with different ip..

I need to find a fix for my problem.. any idea out ?




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

--=====================_29697552==.ALT
Content-Type: text/html; charset="us-ascii"

<html>
<body>
Like Eric told this should be the right solution...<br><br>
================ CUT ===============<br>
Subject: Re: redirection<br>
To: &lt;lyra@fastwebnet.it&gt;<br>
Cc: &lt;netfilter@lists.netfilter.org&gt;<br><br>
I didnt catch the fact that you need the source address. Are you
tracking<br>
this for a reason? You can probably have iptables log the source
address.<br>
This does in fact work, been using it for&nbsp; about 6 months now. Let
me post<br>
my exact rules (IPs are obsfucated)<br><br>
iptables -t nat -A PREROUTING -i eth0 -s 192.168.1.0/24 -p tcp --dport
80<br>
-d 192.168.1.7 -j DNAT --to 192.168.1.7<br><br>
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -d 192.168.1.7
-j<br>
DNAT --to 192.168.1.11:80<br>
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 192.168.1.7<br><br>
<br>
Regards<br>
Eric<br><br>
================ CUT ===============<br><br>
On this examples he use the same interface eth0 over the same
subnet..<br>
My problem is a bit different..<br><br>
The server machine using iptables has only one interface like this one
but the subnet where i need to redirect the packets are far
geographically and with different ip..<br><br>
I need to find a fix for my problem.. any idea out ?<br><br>
<br><br>
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

--=====================_29697552==.ALT--


