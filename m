From: Rob Sterenborg <r.sterenborg@hsl-brabantzuid.nl>
Subject: RE: Trying to get a Subnet NATted
Date: Tue, 10 Dec 2002 08:52:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B32154A646@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2A021.0FF82200"
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
To: "'Kevin L. Collins'" <kcollins@qx.net>, "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2A021.0FF82200
Content-Type: text/plain

> I've got this command in my script:
> iptables -t nat -A POSTROUTING -o EXTIF -j SNAT --to-source EXTIP

> I've also tried this:
> iptables -t nat -A POSTROUTING -o EXTIF -j SNAT --to-source EXTIP
> iptables -t nat -A POSTROUTING -s 10.200.9.0/24 -o EXTIF -j SNAT
--to-source EXTIP
> iptables -t nat -A POSTROUTING -s 10.200.10.0/24 -o EXTIF -j SNAT
--to-source EXTIP

If these lines are in your script, what is you FORWARD rule ? Normally a
firewall has policy DROP for the INPUT and FORWARD (some also OUTPUT, but
not always) chains.
If you have FORWARD policy set to DROP but don't have an ACCEPT for your
SNAT rules, they won't work.

When you want to SNAT 10.200.9.0/24 and 10.200.10.0/24 it should look like
this (assuming you have policy DROP for the FORWARD chain) :

iptables -t nat -A POSTROUTING -s 10.200.9.0/24 -o $EXTIF -j SNAT
--to-source $EXTIP
iptables -t nat -A POSTROUTING -s 10.200.10.0/24 -o $EXTIF -j SNAT
--to-source $EXTIP
iptables -A FORWARD -s 10.200.9.0/24 -o $EXTIF -j ACCEPT
iptables -A FORWARD -s 10.200.10.0/24 -o $EXTIF -j ACCEPT


Rob

------_=_NextPart_001_01C2A021.0FF82200
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: Trying to get a Subnet NATted</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>&gt; I've got this command in my script:</FONT>
<BR><FONT SIZE=3D2>&gt; iptables -t nat -A POSTROUTING -o EXTIF -j SNAT =
--to-source EXTIP</FONT>
</P>

<P><FONT SIZE=3D2>&gt; I've also tried this:</FONT>
<BR><FONT SIZE=3D2>&gt; iptables -t nat -A POSTROUTING -o EXTIF -j SNAT =
--to-source EXTIP</FONT>
<BR><FONT SIZE=3D2>&gt; iptables -t nat -A POSTROUTING -s 10.200.9.0/24 =
-o EXTIF -j SNAT --to-source EXTIP</FONT>
<BR><FONT SIZE=3D2>&gt; iptables -t nat -A POSTROUTING -s =
10.200.10.0/24 -o EXTIF -j SNAT --to-source EXTIP</FONT>
</P>

<P><FONT SIZE=3D2>If these lines are in your script, what is you =
FORWARD rule ? Normally a firewall has policy DROP for the INPUT and =
FORWARD (some also OUTPUT, but not always) chains.</FONT></P>

<P><FONT SIZE=3D2>If you have FORWARD policy set to DROP but don't have =
an ACCEPT for your SNAT rules, they won't work.</FONT>
</P>

<P><FONT SIZE=3D2>When you want to SNAT 10.200.9.0/24 and =
10.200.10.0/24 it should look like this (assuming you have policy DROP =
for the FORWARD chain) :</FONT></P>

<P><FONT SIZE=3D2>iptables -t nat -A POSTROUTING -s 10.200.9.0/24 -o =
$EXTIF -j SNAT --to-source $EXTIP</FONT>
<BR><FONT SIZE=3D2>iptables -t nat -A POSTROUTING -s 10.200.10.0/24 -o =
$EXTIF -j SNAT --to-source $EXTIP</FONT>
<BR><FONT SIZE=3D2>iptables -A FORWARD -s 10.200.9.0/24 -o $EXTIF -j =
ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A FORWARD -s 10.200.10.0/24 -o $EXTIF -j =
ACCEPT</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Rob</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2A021.0FF82200--

