From: Deshwal Chand <CDD@kampsax.co.in>
Subject: RE: External Resolved IPs
Date: Tue, 17 Jun 2003 09:29:25 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <88116A11E9DFD411870900508BEC3831803B51@CPQ01>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C33484.D79A7FE0"
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
To: "'Herbert G. Fischer'" <manager@trama.com>, NetFilter Users <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C33484.D79A7FE0
Content-Type: text/plain;
	charset="iso-8859-1"

Hi 

I also have the same problem and posted it with the subject 'Using IPTABLES,
cannot go to External Interface'. I do have the exact problem. May be if u
get a solution, it will solve mine as well.

 

 

Regards,

Chand Deshwal (M.Tech CS&E, MCSE, CCNA) 	


-----Original Message-----
From: Herbert G. Fischer [mailto:manager@trama.com]
Sent: Tuesday, June 17, 2003 3:31 AM
To: NetFilter Users
Subject: External Resolved IPs


Hi,

I have a problem here, that maybe I can solve using DNS, but this can be
very bad and ugly
for me to maintain.

I have a internal network that uses a external DNS to solve addresses. I
also have some
servers in this internal network that can be accessed from outside via
aliases on NAT/FW
redirecting some ports to internal servers.

My problem is that, when I try to connect to a internal server, using the
external and real
IP, I cannot because my FW/NAT appears to be confused or misconfigured.

For example:

Internal Network: 172.16.48.0/24

My IP: 172.16.48.10
Server Internal IP: 172.16.48.20
* Both are on the same network

Server External IP: 200.180.180.20 (IP alias on FW/NAT machine, that
redirects to 172.16.48.20)
DNS name of Server: server.domain.com, points to 200.180.180.20

When I try to connect into server.domain.com from internal machines, DNS
resolves the external
IP and the connection to the real IP does not complete, since the packet
goes "out" of my network
and must "enter" again.

Here is a sample on how my iptables script is configured:

====================================================================

# server
iptables -t nat -A POSTROUTING -s 172.16.48.20 -j SNAT --to-source
200.180.180.20
iptables -t nat -A PREROUTING -s 0/0 -d 200.180.180.20 -j
DNAT --to-destination 172.16.48.20

# NAT for the rest of the world
iptables -t nat -A POSTROUTING -o eth1 -s 172.16.48.0/24 -j SNAT --to-source
200.180.180.22

=====================================================================

I don't know how to better explain my problem... I hope someone understood
that...

Any idea on this ?

Thanks...

Herbert


------_=_NextPart_001_01C33484.D79A7FE0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: External Resolved IPs</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Hi </FONT>
</P>

<P><FONT SIZE=3D2>I also have the same problem and posted it with the =
subject 'Using IPTABLES, cannot go to External Interface'. I do have =
the exact problem. May be if u get a solution, it will solve mine as =
well.</FONT></P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>Regards,</FONT>
</P>

<P><FONT SIZE=3D2>Chand Deshwal (M.Tech CS&amp;E, MCSE, CCNA) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
</P>
<BR>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Herbert G. Fischer [<A =
HREF=3D"mailto:manager@trama.com">mailto:manager@trama.com</A>]</FONT>
<BR><FONT SIZE=3D2>Sent: Tuesday, June 17, 2003 3:31 AM</FONT>
<BR><FONT SIZE=3D2>To: NetFilter Users</FONT>
<BR><FONT SIZE=3D2>Subject: External Resolved IPs</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Hi,</FONT>
</P>

<P><FONT SIZE=3D2>I have a problem here, that maybe I can solve using =
DNS, but this can be</FONT>
<BR><FONT SIZE=3D2>very bad and ugly</FONT>
<BR><FONT SIZE=3D2>for me to maintain.</FONT>
</P>

<P><FONT SIZE=3D2>I have a internal network that uses a external DNS to =
solve addresses. I</FONT>
<BR><FONT SIZE=3D2>also have some</FONT>
<BR><FONT SIZE=3D2>servers in this internal network that can be =
accessed from outside via</FONT>
<BR><FONT SIZE=3D2>aliases on NAT/FW</FONT>
<BR><FONT SIZE=3D2>redirecting some ports to internal servers.</FONT>
</P>

<P><FONT SIZE=3D2>My problem is that, when I try to connect to a =
internal server, using the</FONT>
<BR><FONT SIZE=3D2>external and real</FONT>
<BR><FONT SIZE=3D2>IP, I cannot because my FW/NAT appears to be =
confused or misconfigured.</FONT>
</P>

<P><FONT SIZE=3D2>For example:</FONT>
</P>

<P><FONT SIZE=3D2>Internal Network: 172.16.48.0/24</FONT>
</P>

<P><FONT SIZE=3D2>My IP: 172.16.48.10</FONT>
<BR><FONT SIZE=3D2>Server Internal IP: 172.16.48.20</FONT>
<BR><FONT SIZE=3D2>* Both are on the same network</FONT>
</P>

<P><FONT SIZE=3D2>Server External IP: 200.180.180.20 (IP alias on =
FW/NAT machine, that</FONT>
<BR><FONT SIZE=3D2>redirects to 172.16.48.20)</FONT>
<BR><FONT SIZE=3D2>DNS name of Server: server.domain.com, points to =
200.180.180.20</FONT>
</P>

<P><FONT SIZE=3D2>When I try to connect into server.domain.com from =
internal machines, DNS</FONT>
<BR><FONT SIZE=3D2>resolves the external</FONT>
<BR><FONT SIZE=3D2>IP and the connection to the real IP does not =
complete, since the packet</FONT>
<BR><FONT SIZE=3D2>goes &quot;out&quot; of my network</FONT>
<BR><FONT SIZE=3D2>and must &quot;enter&quot; again.</FONT>
</P>

<P><FONT SIZE=3D2>Here is a sample on how my iptables script is =
configured:</FONT>
</P>

<P><FONT =
SIZE=3D2>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</F=
ONT>
</P>

<P><FONT SIZE=3D2># server</FONT>
<BR><FONT SIZE=3D2>iptables -t nat -A POSTROUTING -s 172.16.48.20 -j =
SNAT --to-source</FONT>
<BR><FONT SIZE=3D2>200.180.180.20</FONT>
<BR><FONT SIZE=3D2>iptables -t nat -A PREROUTING -s 0/0 -d =
200.180.180.20 -j</FONT>
<BR><FONT SIZE=3D2>DNAT --to-destination 172.16.48.20</FONT>
</P>

<P><FONT SIZE=3D2># NAT for the rest of the world</FONT>
<BR><FONT SIZE=3D2>iptables -t nat -A POSTROUTING -o eth1 -s =
172.16.48.0/24 -j SNAT --to-source</FONT>
<BR><FONT SIZE=3D2>200.180.180.22</FONT>
</P>

<P><FONT =
SIZE=3D2>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
</FONT>
</P>

<P><FONT SIZE=3D2>I don't know how to better explain my problem... I =
hope someone understood</FONT>
<BR><FONT SIZE=3D2>that...</FONT>
</P>

<P><FONT SIZE=3D2>Any idea on this ?</FONT>
</P>

<P><FONT SIZE=3D2>Thanks...</FONT>
</P>

<P><FONT SIZE=3D2>Herbert</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C33484.D79A7FE0--

