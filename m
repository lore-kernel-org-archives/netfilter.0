From: Simone Sestini <simone.sestini@plugit.net>
Subject: NAT and log traffic
Date: Wed, 15 Jan 2003 12:36:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20030115122833.08dbb520@imap4.plugit.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_517442923==.ALT"
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

--=====================_517442923==.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

Hi folks..

I have made two NAT box for a special dialup server.
I have create an iptables stratup script like that..

/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.2.0/23 -o eth0 -j 
SNAT --to PUBLIC-IP1
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.4.0/23 -o eth0 -j 
SNAT --to PUBLIC-IP2
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.6.0/23 -o eth0 -j 
SNAT --to PUBLIC-IP3
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.8.0/23 -o eth0 -j 
SNAT --to PUBLIC-IP4
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.10.0/23 -o eth0 -j 
SNAT --to PUBLIC-IP5
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.12.0/23 -o eth0 -j 
SNAT --to PUBLIC-IP6
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.14.0/23 -o eth0 -j 
SNAT --to PUBLIC-IP7

and so on..


Now.. i need to LOG all the traffic that transit over the rules..
I need to log at least PUBLIC-IPX and DESTINATION-IP.

A friend of that mailing list wrote me back and told..

change your string like that

/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.0.0/23 -o eth0 -j 
LOG --log-level debug --log-prefix "POSTRT: "
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.0.0/23 -o eth0 -j 
SNAT --to PUBLIC-IP1

I did that and added that over syslog.conf
# For NAT
*.*                                             /var/log/nat.log

but i don't see any datas logged over that file..

See that..

    75  3727 
LOG        all  --  *      eth0    10.20.0.0/23         0.0.0.0/0 
LOG flags 0 level 7 prefix `POSTRT: '
    75  3727 
SNAT       all  --  *      eth0    10.20.0.0/23         0.0.0.0/0 
to:xxx.x.xx.x

I generated the traffic over that rule but nothing appear over the log file.

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

--=====================_517442923==.ALT
Content-Type: text/html; charset="us-ascii"

<html>
<body>
Hi folks..<br><br>
I have made two NAT box for a special dialup server.<br>
I have create an iptables stratup script like that..<br><br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.2.0/23 -o eth0 -j
SNAT --to PUBLIC-IP1<br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.4.0/23 -o eth0 -j
SNAT --to PUBLIC-IP2<br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.6.0/23 -o eth0 -j
SNAT --to PUBLIC-IP3<br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.8.0/23 -o eth0 -j
SNAT --to PUBLIC-IP4<br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.10.0/23 -o eth0
-j SNAT --to PUBLIC-IP5<br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.12.0/23 -o eth0
-j SNAT --to PUBLIC-IP6<br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.14.0/23 -o eth0
-j SNAT --to PUBLIC-IP7<br><br>
and so on..<br><br>
<br>
Now.. i need to LOG all the traffic that transit over the rules..<br>
I need to log at least PUBLIC-IPX and DESTINATION-IP.<br><br>
A friend of that mailing list wrote me back and told..<br><br>
change your string like that <br><br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.0.0/23 -o eth0 -j
LOG --log-level debug --log-prefix &quot;POSTRT: &quot;<br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.0.0/23 -o eth0 -j
SNAT --to PUBLIC-IP1<br><br>
I did that and added that over syslog.conf<br>
# For NAT<br>
*.*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
/var/log/nat.log<br><br>
but i don't see any datas logged over that file..<br><br>
See that..<br><br>
&nbsp;&nbsp; 75&nbsp; 3727 LOG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
all&nbsp; --&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eth0&nbsp;&nbsp;&nbsp;
10.20.0.0/23&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LOG flags
0 level 7 prefix `POSTRT: ' <br>
&nbsp;&nbsp; 75&nbsp; 3727 SNAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
all&nbsp; --&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eth0&nbsp;&nbsp;&nbsp;
10.20.0.0/23&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
to:xxx.x.xx.x<br><br>
I generated the traffic over that rule but nothing appear over the log
file.<br><br>
Any idea ?<br><br>
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
Fax<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>+39
199 440088<br>
E-mail<x-tab>&nbsp;&nbsp;</x-tab>simone.sestini@plugit.net<br>
Web<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><a href="http://www.plugit.it/" eudora="autourl">http://www.plugit.it</a><br><br>
</font></tt><font face="Verdana"><u>::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
<br>
</font></u></body>
</html>

--=====================_517442923==.ALT--


