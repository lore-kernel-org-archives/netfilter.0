From: Eugene Joubert <eugenej@centratel.co.za>
Subject: RE: newbie problem
Date: Mon, 17 Feb 2003 10:49:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B848917C9D07D71199C5005004D778B8017B59@TELECOMS04>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2D661.6AF46AD0"
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
To: 'Chris Barnes' <runtimeerror@bigpond.com>, Netfilter <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2D661.6AF46AD0
Content-Type: text/plain

Is your webserver on your firewall?

Also your rule for port 80....you're source port is wrong. Remember if I
were to access your webpage on your server I will be coming in with a source
port that my OS has given me. So instead of source port change it to
destination port cause that is were you request is going?

Also I would suggest moving your webserver to another server behind your
firewall.
Just my 5 cents.

PS:
You could also set your OUTPUT Policy to default ACCEPT, but if your really
paranoid then just make it DROP



-----Original Message-----
From: Chris Barnes [mailto:runtimeerror@bigpond.com] 
Sent: 17 02 2003 09:43 AM
To: Netfilter
Subject: newbie problem


hi people i'm new to the list.

anyway, I have a very simple firewall on a web server. I want to deny access
to everything except the web server (port 80)

i have set the poilcy on all chains to drop and i have added a rule to the
input chain which says

iptables -A INPUT -p tcp --sport 80 -j ACCEPT

i've done it like this because the web server has 2 interfaces (eth0 and
eth1) which i would like to have access to the server (eth0 is local
10.3.2.0/24 and eth1 is external)

i also made a rule for output

iptables -A OUTPUT -p tcp -j ACCEPT

the problem is that nothing can get to the web server...the packets are
being dropped...i checked the counters and none of the rules counted any
packets or bytes so the packets are being dropped before the rules.

what am i doing wrong or what is a better way to do this?

thanks heaps for your help.



------_=_NextPart_001_01C2D661.6AF46AD0
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: newbie problem</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Is your webserver on your firewall?</FONT>
</P>

<P><FONT SIZE=3D2>Also your rule for port 80....you're source port is =
wrong. Remember if I were to access your webpage on your server I will =
be coming in with a source port that my OS has given me. So instead of =
source port change it to destination port cause that is were you =
request is going?</FONT></P>

<P><FONT SIZE=3D2>Also I would suggest moving your webserver to another =
server behind your firewall.</FONT>
<BR><FONT SIZE=3D2>Just my 5 cents.</FONT>
</P>

<P><FONT SIZE=3D2>PS:</FONT>
<BR><FONT SIZE=3D2>You could also set your OUTPUT Policy to default =
ACCEPT, but if your really paranoid then just make it DROP</FONT>
</P>
<BR>
<BR>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Chris Barnes [<A =
HREF=3D"mailto:runtimeerror@bigpond.com">mailto:runtimeerror@bigpond.com=
</A>] </FONT>
<BR><FONT SIZE=3D2>Sent: 17 02 2003 09:43 AM</FONT>
<BR><FONT SIZE=3D2>To: Netfilter</FONT>
<BR><FONT SIZE=3D2>Subject: newbie problem</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>hi people i'm new to the list.</FONT>
</P>

<P><FONT SIZE=3D2>anyway, I have a very simple firewall on a web =
server. I want to deny access to everything except the web server (port =
80)</FONT></P>

<P><FONT SIZE=3D2>i have set the poilcy on all chains to drop and i =
have added a rule to the input chain which says</FONT>
</P>

<P><FONT SIZE=3D2>iptables -A INPUT -p tcp --sport 80 -j ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2>i've done it like this because the web server has 2 =
interfaces (eth0 and</FONT>
<BR><FONT SIZE=3D2>eth1) which i would like to have access to the =
server (eth0 is local 10.3.2.0/24 and eth1 is external)</FONT>
</P>

<P><FONT SIZE=3D2>i also made a rule for output</FONT>
</P>

<P><FONT SIZE=3D2>iptables -A OUTPUT -p tcp -j ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2>the problem is that nothing can get to the web =
server...the packets are being dropped...i checked the counters and =
none of the rules counted any packets or bytes so the packets are being =
dropped before the rules.</FONT></P>

<P><FONT SIZE=3D2>what am i doing wrong or what is a better way to do =
this?</FONT>
</P>

<P><FONT SIZE=3D2>thanks heaps for your help.</FONT>
</P>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C2D661.6AF46AD0--

