From: "Paul McDonald" <paul@emessaging.cw.com>
Subject: Highly dynamic NAT source mapping
Date: Fri, 31 Jan 2003 11:22:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006501c2c944$e8bffad0$2a2b8792@surecom.com>
Reply-To: <paul@emessaging.cw.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0066_01C2C91A.FFE9F2D0"
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

------=_NextPart_000_0066_01C2C91A.FFE9F2D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

We have an application where thousands of outbound TCP connections are
generated from multiple servers.  We are interested in mapping some, but not
all of those connections to specific source addresses.

The idea is to run netfilter on a box between these servers & the internet
with a  'userland' server process that would be able to add/delete
address/port mappings for SNAT.  This user process would be contacted by the
software running on the servers generating the traffic after they bind to a
local address/port but before attempting to connect.  They would then
contact this process running on the netfilter box and request a specific
SNAT for their address/port to a specified address.  When the server closes
the connection, it would contact the process running on the netfilter box
and remove the mapping.

As you can see there would be a *large* number of updates to the SNAT
mapping tables on the netfilter box.  My question is:

- Is this really doable?  Will the large number (possibly hundreds per
second)  of table adds/deletes cause havoc on the linux box running
netfilter, bringing performance to a standstill.

thanks

Paul


------=_NextPart_000_0066_01C2C91A.FFE9F2D0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 5.50.4207.2601" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D223491316-31012003><FONT face=3DArial size=3D2>We =
have an=20
application where thousands of outbound TCP connections are generated =
from=20
multiple servers.&nbsp; We are interested in mapping some, but not all =
of those=20
connections to specific source addresses.</FONT></SPAN></DIV>
<DIV><SPAN class=3D223491316-31012003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D223491316-31012003><FONT face=3DArial size=3D2>The =
idea is to run=20
netfilter on a box between these servers &amp; the internet with a&nbsp; =

'userland' server process that would be able to add/delete address/port =
mappings=20
for SNAT.&nbsp; This user process would be contacted by the software =
running on=20
the servers generating the traffic after they bind to a local =
address/port but=20
before attempting to connect.&nbsp; They would then contact this process =
running=20
on the netfilter box and request a specific SNAT for their address/port =
to a=20
specified address.&nbsp; When the server closes the connection, it would =
contact=20
the process running on the netfilter box and remove the=20
mapping.</FONT></SPAN></DIV>
<DIV><SPAN class=3D223491316-31012003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D223491316-31012003><FONT face=3DArial size=3D2>As you =
can see there=20
would be a *large* number of updates to the SNAT mapping tables on the =
netfilter=20
box.&nbsp; My question is:</FONT></SPAN></DIV>
<DIV><SPAN class=3D223491316-31012003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D223491316-31012003><FONT face=3DArial size=3D2>- Is =
this really=20
doable?&nbsp; Will the large number (possibly hundreds per second)&nbsp; =
of=20
table adds/deletes cause havoc on the linux box running netfilter, =
bringing=20
performance to a standstill.</FONT></SPAN></DIV>
<DIV><SPAN class=3D223491316-31012003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D223491316-31012003><FONT face=3DArial=20
size=3D2>thanks</FONT></SPAN></DIV>
<DIV><SPAN class=3D223491316-31012003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D223491316-31012003><FONT face=3DArial=20
size=3D2>Paul</FONT></SPAN></DIV>
<DIV><SPAN class=3D223491316-31012003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0066_01C2C91A.FFE9F2D0--


