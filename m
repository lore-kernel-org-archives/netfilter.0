From: <netfilter@drbroyles.com>
Subject: Rules are followed inconsistently in firewall
Date: Sat, 24 May 2003 10:44:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003101c32203$02956fa0$73593a42@drbroyles.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002E_01C321E1.791BF760"
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

This is a multi-part message in MIME format.

------=_NextPart_000_002E_01C321E1.791BF760
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,
    I run a small network in my home where I am trying to have the brunt =
of the network firewalling handled by a single Linux 8.0 server.  I have =
a DSL internet connection in which I have the use of 5 static IPs.  =
Since I have few client machines using this connection, I decided to =
allow each machine to have a separate IP.  I am using iptables 1.2.7a =
and a 2.4.19 kernel compiled with bridging and the hooks to pass packets =
through iptables so that I can have a central point to apply firewalling =
rules.  I believe this arrangement is referred to as a bridging router.  =
I have a default chain specified that DROPs various incoming UDP, TCP, & =
ICMP echo-requests.  The problem I am experiencing is that sometimes =
some of these specified packets are DROPed and sometimes they are not.
    My method of testing I am using is the website at =
http://www.dslreports.com/scan.  They have a scanning tool that =
"attacks" your IP and notifies you of general vulnerabilities and =
concerns.  Even though I have those rules in place, I get results that =
say some of my UDP ports are open, even though they should be blocked.  =
But I'll run the scan again and get a perfect result with no open UDP =
ports.  Every time I run the scan, I'm told that my IP is not pingable =
so I know that at least one of the rules is working, but the others only =
work sporadically.

Below is the 'iptables -nL --line-numbers' output of that default =
chain...

Chain default (3 references)
num  target     prot opt source               destination
1    DROP       icmp --  0.0.0.0/0            <internal net>      icmp =
type 8
2    DROP       tcp  --  0.0.0.0/0            <internal net>    tcp =
flags:0x16/0x02
3    DROP       udp  --  0.0.0.0/0            <internal net>    udp =
dpt:13
4    DROP       udp  --  0.0.0.0/0            <internal net>    udp =
dpt:37
5    DROP       udp  --  0.0.0.0/0            <internal net>    udp =
dpt:123
6    DROP       udp  --  0.0.0.0/0            <internal net>    udp =
dpt:135
7    DROP       udp  --  0.0.0.0/0            <internal net>    udp =
dpt:137
8    DROP       udp  --  0.0.0.0/0            <internal net>    udp =
dpt:138
9    DROP       udp  --  0.0.0.0/0            <internal net>    udp =
dpt:161
10   DROP       udp  --  0.0.0.0/0            <internal net>    udp =
dpt:162
11   DROP       tcp  --  0.0.0.0/0            <internal net>    tcp =
dpt:135
12   DROP       tcp  --  0.0.0.0/0            <internal net>    tcp =
dpt:139
13   DROP       tcp  --  0.0.0.0/0            <internal net>    tcp =
dpt:445

    There are no ACCEPT rules occurring before the default chain is =
called, so the various UDP & TCP packets are still in the filter by the =
time they reach their respective DROP rules.
    Are these packets just going through too quickly for iptables to =
drop them?  If you can shed any light on this, please let me know.

Brandon

------=_NextPart_000_002E_01C321E1.791BF760
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3502.5390" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; I run a small =
network in my home=20
where I am trying to have the brunt of the network firewalling handled =
by a=20
single Linux 8.0 server.&nbsp; I have a DSL internet connection in which =
I have=20
the use of 5 static IPs.&nbsp; Since I have few client machines using =
this=20
connection, I decided to allow each machine to have a separate IP.&nbsp; =

</FONT><FONT face=3DArial size=3D2>I am using iptables 1.2.7a and a =
2.4.19 kernel=20
compiled with bridging and the hooks to pass packets through iptables so =
that I=20
can have a central point to apply firewalling rules.&nbsp; I believe =
this=20
arrangement is referred to as a bridging router.&nbsp; I have a default =
chain=20
specified that DROPs various incoming UDP, TCP, &amp; ICMP =
echo-requests.&nbsp;=20
The problem I am experiencing is that sometimes some of these specified =
packets=20
are DROPed and sometimes they are not.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; My method of testing =
I am using=20
is the website at <A=20
href=3D"http://www.dslreports.com/scan">http://www.dslreports.com/scan</A=
>.&nbsp;=20
They have a scanning tool that "attacks" your IP and notifies you of =
general=20
vulnerabilities and concerns.&nbsp; Even though I have those rules in =
place, I=20
get results that say some of my UDP ports are open, even though they =
should be=20
blocked.&nbsp; But I'll run the scan again and get a perfect result with =
no open=20
UDP ports.&nbsp; Every time I run the scan, I'm told that my IP is not =
pingable=20
so I know that at least one of the rules is working, but the others only =
work=20
sporadically.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Below is the 'iptables -nL =
--line-numbers' output=20
of that default chain...</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Chain default (3 =
references)<BR>num&nbsp;=20
target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination<BR>1&nbsp;&nbsp;&nbsp; =
DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; icmp=20
--&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&lt;internal=20
net&gt;&nbsp; &nbsp;&nbsp;&nbsp; icmp type 8<BR>2&nbsp;&nbsp;&nbsp;=20
DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
&lt;internal net&gt;&nbsp;&nbsp;&nbsp; tcp=20
flags:0x16/0x02<BR>3&nbsp;&nbsp;&nbsp; =
DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
udp&nbsp; --&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
&lt;internal net&gt;&nbsp;&nbsp;&nbsp; udp dpt:13<BR>4&nbsp;&nbsp;&nbsp; =

DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
&lt;internal net&gt;&nbsp;&nbsp;&nbsp; udp dpt:37<BR>5&nbsp;&nbsp;&nbsp; =

DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
&lt;internal net&gt;&nbsp;&nbsp;&nbsp; udp =
dpt:123<BR>6&nbsp;&nbsp;&nbsp;=20
DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
&lt;internal net&gt;&nbsp;&nbsp;&nbsp; udp =
dpt:135<BR>7&nbsp;&nbsp;&nbsp;=20
DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
&lt;internal net&gt;&nbsp;&nbsp;&nbsp; udp =
dpt:137<BR>8&nbsp;&nbsp;&nbsp;=20
DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
&lt;internal net&gt;&nbsp;&nbsp;&nbsp; udp =
dpt:138<BR>9&nbsp;&nbsp;&nbsp;=20
DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
&lt;internal net&gt;&nbsp;&nbsp;&nbsp; udp dpt:161<BR>10&nbsp;&nbsp;=20
DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
&lt;internal net&gt;&nbsp;&nbsp;&nbsp; udp dpt:162<BR>11&nbsp;&nbsp;=20
DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
&lt;internal net&gt;&nbsp;&nbsp;&nbsp; tcp dpt:135<BR>12&nbsp;&nbsp;=20
DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
&lt;internal net&gt;&nbsp;&nbsp;&nbsp; tcp dpt:139<BR>13&nbsp;&nbsp;=20
DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
&lt;internal net&gt;&nbsp;&nbsp;&nbsp; tcp dpt:445</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; There are no ACCEPT =
rules=20
occurring before the default chain is called, so the various UDP &amp; =
TCP=20
packets are still in the filter by the time they reach their respective =
DROP=20
rules.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Are these packets =
just going=20
through too quickly for iptables to drop them?&nbsp; If you can shed any =
light=20
on this, please let me know.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>Brandon</DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_002E_01C321E1.791BF760--


