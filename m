From: "Elvis Aaron Presley" <elvisa@terra.es>
Subject: Newbie in a deep trouble!!!
Date: Wed, 11 Aug 2004 13:51:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c47f99$79645980$3d01a8c0@rxn32.biz>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000B_01C47FAA.3CED2980"
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
To: Netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_000B_01C47FAA.3CED2980
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all, this is the first time I mail to this list and my english is not
very good. I hope somebody here can help because I'm trapped!! Anyway =
here
is my problem:
=20
I have a network scheme you can view here (it's important to understund =
the
problem): http://www.elviswireless.sytes.net/varios/network.jpg
=20
The server has a squid proxy server running on 3128 port. It's a =
transparent
proxy redirecting port 80 to 3128. But the problem come when a pc with
10.34.x.x ip wants to view a web page from one of the 172.16.x.x ip =
based
pcs and equal when a pc with 172.16.x.x ip wants to view a web page from =
one
of the 10.34.x.x ip based pcs.
=20
I want that all pcs can access to internet through the proxy and that =
all
pcs can view web pages from the other side of the server.
=20
First I put this:
=20
iptables -t nat -A PREROUTING -p tcp -d ! 172.16.0.0/16 --dport 80 -j
REDIRECT --to-port 3128

Ok with this, the 10.34.x.x pcs can access to internet through the proxy =
and
can view the web pages of the 172.16.x.x pcs ... It works!!!
=20
Then I put this:
=20
iptables -t nat -A PREROUTING -p tcp -d ! 10.34.0.0/16 --dport 80 -j
REDIRECT --to-port 3128
=20
With this,  the 172.16.x.x pcs can access to internet through the proxy =
and
can view the web pages of the 10.34.x.x pcs ... It works too!!!
=20
This commands works separately, but when I put the two at same time it
doesn't work.
=20
Can anybody help me please????
=20
Thanks in advance.
=20
Elvis

------=_NextPart_000_000B_01C47FAA.3CED2980
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<TITLE>Mensaje</TITLE>

<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D328202111-11082004>Hi =
all, this is the=20
first time I mail to this list and my english is not very good. I hope =
somebody=20
here can help&nbsp;because I'm trapped!!&nbsp;Anyway here is my=20
problem:</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D328202111-11082004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D328202111-11082004>I have =
a network=20
scheme you can view here (it's important to understund the problem):=20
</SPAN></FONT><FONT face=3DArial size=3D2><A=20
href=3D"http://www.elviswireless.sytes.net/varios/network.jpg">http://www=
.elviswireless.sytes.net/varios/network.jpg</A></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D328202111-11082004><FONT face=3DArial size=3D2>The =
server has a=20
squid proxy server running on 3128 port. It's a transparent proxy =
redirecting=20
port 80 to 3128. But the problem come when a pc with 10.34.x.x ip wants =
to view=20
a web page from one of the 172.16.x.x ip based pcs and equal when a pc =
with=20
172.16.x.x ip wants&nbsp;to view a web page from one of the 10.34.x.x ip =
based=20
pcs.</FONT></SPAN></DIV>
<DIV><SPAN class=3D328202111-11082004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D328202111-11082004><FONT face=3DArial size=3D2>I want =
that all pcs=20
can access to internet through the proxy and that all pcs can view web =
pages=20
from the other side of the server.</FONT></SPAN></DIV>
<DIV><SPAN class=3D328202111-11082004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D328202111-11082004><FONT face=3DArial size=3D2>First =
I put=20
this:</FONT></SPAN></DIV>
<DIV><SPAN class=3D328202111-11082004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D328202111-11082004><SPAN =
class=3D828135814-19072004><FONT=20
face=3DArial size=3D2>iptables -t nat -A PREROUTING -p tcp -d ! =
172.16.0.0/16=20
--dport 80 -j REDIRECT --to-port 3128<BR></FONT></SPAN></SPAN></DIV>
<DIV><SPAN class=3D328202111-11082004><SPAN =
class=3D828135814-19072004><FONT=20
face=3DArial size=3D2>Ok with this, the 10.34.x.x pcs can access to =
internet through=20
the proxy and can view the web pages of the 172.16.x.x pcs ... It=20
works!!!</FONT></SPAN></SPAN></DIV>
<DIV><SPAN class=3D328202111-11082004><SPAN =
class=3D828135814-19072004><FONT=20
face=3DArial size=3D2></FONT></SPAN></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D328202111-11082004><SPAN =
class=3D828135814-19072004><FONT=20
face=3DArial size=3D2>Then I put this:</FONT></SPAN></SPAN></DIV>
<DIV><SPAN class=3D328202111-11082004><SPAN =
class=3D828135814-19072004><FONT=20
face=3DArial size=3D2></FONT></SPAN></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D328202111-11082004><SPAN =
class=3D828135814-19072004><FONT=20
face=3DArial size=3D2><SPAN class=3D828135814-19072004><FONT =
face=3DArial size=3D2><SPAN=20
class=3D828135814-19072004><FONT face=3DArial size=3D2>iptables -t nat =
-A PREROUTING=20
-p tcp -d ! 10.34.0.0/16 --dport 80 -j REDIRECT --to-port=20
3128</FONT></SPAN></FONT></SPAN></FONT></SPAN></SPAN></DIV>
<DIV><SPAN class=3D328202111-11082004><SPAN =
class=3D828135814-19072004><FONT=20
face=3DArial size=3D2><SPAN class=3D828135814-19072004><FONT =
face=3DArial size=3D2><SPAN=20
class=3D828135814-19072004></SPAN></FONT></SPAN></FONT></SPAN></SPAN>&nbs=
p;</DIV>
<DIV><SPAN class=3D328202111-11082004><SPAN =
class=3D828135814-19072004><FONT=20
face=3DArial size=3D2><SPAN class=3D828135814-19072004><FONT =
face=3DArial size=3D2><SPAN=20
class=3D828135814-19072004>With this,&nbsp; the 172.16.x.x pcs can =
access to=20
internet through the proxy and can view the web pages of the 10.34.x.x =
pcs ...=20
It works too!!!</SPAN></FONT></SPAN></FONT></SPAN></SPAN></DIV>
<DIV><SPAN class=3D328202111-11082004><SPAN =
class=3D828135814-19072004><FONT=20
face=3DArial size=3D2><SPAN class=3D828135814-19072004><FONT =
face=3DArial size=3D2><SPAN=20
class=3D828135814-19072004></SPAN></FONT></SPAN></FONT></SPAN></SPAN>&nbs=
p;</DIV>
<DIV><SPAN class=3D328202111-11082004><SPAN =
class=3D828135814-19072004><FONT=20
face=3DArial size=3D2><SPAN class=3D828135814-19072004><FONT =
face=3DArial size=3D2><SPAN=20
class=3D828135814-19072004>This commands works separately, but when I =
put the two=20
at same time it doesn't =
work.</SPAN></FONT></SPAN></FONT></SPAN></SPAN></DIV>
<DIV><SPAN class=3D328202111-11082004><SPAN =
class=3D828135814-19072004><FONT=20
face=3DArial size=3D2><SPAN class=3D828135814-19072004><FONT =
face=3DArial size=3D2><SPAN=20
class=3D828135814-19072004></SPAN></FONT></SPAN></FONT></SPAN></SPAN>&nbs=
p;</DIV>
<DIV><SPAN class=3D328202111-11082004><SPAN =
class=3D828135814-19072004><FONT=20
face=3DArial size=3D2><SPAN class=3D828135814-19072004><FONT =
face=3DArial size=3D2><SPAN=20
class=3D828135814-19072004>Can anybody help me=20
please????</SPAN></FONT></SPAN></FONT></SPAN></SPAN></DIV>
<DIV><SPAN class=3D328202111-11082004><SPAN =
class=3D828135814-19072004><FONT=20
face=3DArial size=3D2><SPAN class=3D828135814-19072004><FONT =
face=3DArial size=3D2><SPAN=20
class=3D828135814-19072004></SPAN></FONT></SPAN></FONT></SPAN></SPAN>&nbs=
p;</DIV>
<DIV><SPAN class=3D328202111-11082004><SPAN =
class=3D828135814-19072004><FONT=20
face=3DArial size=3D2><SPAN class=3D828135814-19072004><FONT =
face=3DArial size=3D2><SPAN=20
class=3D828135814-19072004>Thanks in=20
advance.</SPAN></FONT></SPAN></FONT></SPAN></SPAN></DIV>
<DIV><SPAN class=3D328202111-11082004><SPAN =
class=3D828135814-19072004><FONT=20
face=3DArial size=3D2><SPAN class=3D828135814-19072004><FONT =
face=3DArial size=3D2><SPAN=20
class=3D828135814-19072004></SPAN></FONT></SPAN></FONT></SPAN></SPAN>&nbs=
p;</DIV>
<DIV><SPAN class=3D328202111-11082004><SPAN =
class=3D828135814-19072004><FONT=20
face=3DArial size=3D2><SPAN class=3D828135814-19072004><FONT =
face=3DArial size=3D2><SPAN=20
class=3D828135814-19072004>Elvis</SPAN></FONT></SPAN></DIV></FONT></SPAN>=
</SPAN></BODY></HTML>

------=_NextPart_000_000B_01C47FAA.3CED2980--


