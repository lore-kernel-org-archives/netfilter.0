From: Rob Sterenborg <r.sterenborg@hsl-brabantzuid.nl>
Subject: RE: Doubt about DNAT
Date: Tue, 10 Sep 2002 16:45:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019849@hslex01.hsl-brabantzuid.nl>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C258D8.AA618736"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C258D8.AA618736
Content-Type: text/plain;
	charset="iso-8859-1"

> Lan IP with SQL Server: 192.168.0.10
> Valid IP with iptables: 200.221.98.123
> Valid IP that will acess SQL Server. 200.206.123.112
> 
> This rule i've put in the machine 200.221.98.123
> 
> iptables -t nat -A PREROUTING -p tcp -s 200.206.123.112 --dport 1433 -j
DNAT --to 192.168.0.10
> 
> And now i configure my SQL Server to connect to 200.221.98.123 but i still
can't connect. Dou you 

I have something like :

iptables -A FORWARD -i <if_inet> -p tcp -d 192.168.0.10 --dport 1433 -j
ACCEPT
iptables -t nat -A PREROUTING -i <if_inet> -p tcp -s 200.206.123.112 -d
200.221.98.123 --dport 1433 -j DNAT --to 192.168.0.10:1433

Also take a look at your routing.
Routing should go both ways.


Rob

------_=_NextPart_001_01C258D8.AA618736
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2650.12">
<TITLE>RE: Doubt about DNAT</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>&gt; Lan IP with SQL Server: 192.168.0.10</FONT>
<BR><FONT SIZE=3D2>&gt; Valid IP with iptables: 200.221.98.123</FONT>
<BR><FONT SIZE=3D2>&gt; Valid IP that will acess SQL Server. =
200.206.123.112</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; This rule i've put in the machine =
200.221.98.123</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; iptables -t nat -A PREROUTING -p tcp -s =
200.206.123.112 --dport 1433 -j DNAT --to 192.168.0.10</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; And now i configure my SQL Server to connect to =
200.221.98.123 but i still can't connect. Dou you </FONT>
</P>

<P><FONT SIZE=3D2>I have something like :</FONT>
</P>

<P><FONT SIZE=3D2>iptables -A FORWARD -i &lt;if_inet&gt; -p tcp -d =
192.168.0.10 --dport 1433 -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -t nat -A PREROUTING -i &lt;if_inet&gt; -p =
tcp -s 200.206.123.112 -d 200.221.98.123 --dport 1433 -j DNAT --to =
192.168.0.10:1433</FONT></P>

<P><FONT SIZE=3D2>Also take a look at your routing.</FONT>
<BR><FONT SIZE=3D2>Routing should go both ways.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Rob</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C258D8.AA618736--

