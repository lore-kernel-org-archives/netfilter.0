From: "swamy" <admin@kablenet.net>
Subject: reg: iptables & routing http to squid
Date: Thu, 10 Apr 2003 18:13:20 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c2ff5e$c7421280$c100a8c0@aa1243>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C2FF8C.DDC3DBA0"
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

------=_NextPart_000_0005_01C2FF8C.DDC3DBA0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have configured two servers one is natting server 192.168.0.1 and the =
other one is squid cache engine 192.168.0.2 and i want to redirec all =
the request from 192-168.0.1 to 192.168.0.2, so i tried with following =
commands in natting server=20
/sbin/iptables -A PREROUTING -i eth1 -t mangle -p tcp --dport 80 -j MARK =
--set-m
ark 2
echo 202 www.out >> /etc/iproute2/rt_tables
ip rule add fwmark 2 table www.out
ip route add default via 192.168.0.2 dev eth1 table www.out=20

it is routing to squid server but i am getting an eror, but it is going =
to squid server and the error is

The requested URL could not be retrieved

-------------------------------------------------------------------------=
-------

While trying to retrieve the URL: /=20

The following error was encountered:=20

  a.. Invalid URL=20
Some aspect of the requested URL is incorrect. Possible problems:=20

  a.. Missing or incorrect access protocol (should be `http://'' or =
similar)=20
  b.. Missing hostname=20
  c.. Illegal double-escape in the URL-Path=20
  d.. Illegal character in hostname; underscores are not allowed=20
-------------------------------------------------------------------------=
-------------------------------------------------------------

can any one give me a solutions for my configuration and it is working =
fine wo redirection, and cache engine is working if i configure
in browser pointing to the cache engine.

thanking you all very much,

swamy

------=_NextPart_000_0005_01C2FF8C.DDC3DBA0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2919.6307" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I have configured two servers one is =
natting server=20
192.168.0.1 and the other one is squid cache engine 192.168.0.2 and i =
want to=20
redirec all the request from 192-168.0.1 to 192.168.0.2, so i tried with =

following commands in natting server </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>/sbin/iptables -A PREROUTING -i eth1 -t =
mangle -p=20
tcp --dport 80 -j MARK --set-m<BR>ark 2<BR>echo 202 <A=20
href=3D"http://www.out">www.out</A> &gt;&gt; =
/etc/iproute2/rt_tables<BR>ip rule=20
add fwmark 2 table <A href=3D"http://www.out">www.out</A><BR>ip route =
add default=20
via 192.168.0.2 dev eth1 table <A href=3D"http://www.out">www.out</A>=20
</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>it is routing to squid server but i am =
getting an=20
eror, but it is going to squid server and the error is</FONT></DIV>
<DIV>&nbsp;</DIV><FONT face=3DArial size=3D2>
<H2>The requested URL could not be retrieved</H2>
<HR>

<P>While trying to retrieve the URL: <A =
href=3D"http://www.google.com/">/</A>=20
<P>The following error was encountered:=20
<UL>
  <LI><STRONG>Invalid URL </STRONG></LI></UL>
<P>Some aspect of the requested URL is incorrect. Possible problems:=20
<UL>
  <LI>Missing or incorrect access protocol (should be `http://'' or =
similar)=20
  <LI>Missing hostname=20
  <LI>Illegal double-escape in the URL-Path=20
  <LI>Illegal character in hostname; underscores are not allowed =
</LI></UL>
<DIV>--------------------------------------------------------------------=
------------------------------------------------------------------</DIV>
<DIV>&nbsp;</DIV>
<DIV>can any one give me a solutions for my configuration and it is =
working fine=20
wo redirection, and cache engine is working if i configure</DIV>
<DIV>in browser pointing to the cache engine.</DIV>
<DIV>&nbsp;</DIV>
<DIV>thanking you all very much,</DIV>
<DIV>&nbsp;</DIV>
<DIV>swamy</DIV></FONT></BODY></HTML>

------=_NextPart_000_0005_01C2FF8C.DDC3DBA0--


