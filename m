From: Deshwal Chand <CDD@kampsax.co.in>
Subject: RE: External Resolved IPs
Date: Tue, 17 Jun 2003 11:03:17 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <88116A11E9DFD411870900508BEC3831803B54@CPQ01>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C33491.F4766D10"
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
To: 'Joel Newkirk' <netfilter@newkirk.us>, "Herbert G. Fischer" <manager@trama.com>
Cc: NetFilter Users <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C33491.F4766D10
Content-Type: text/plain;
	charset="iso-8859-1"

<<<iptables -t nat -A POSTROUTING -d 172.16.48.20 -s 172.16.48.0/24 -j SNAT
--to iptables.box.local.ip

This rule works for DNATted servers. Now I am able to reach to my servers
from Internal Network. I am still facing a problem. I can not reach to the
External Interface of NAT Box.

For example:

External IP of NAT box is x.y.z.1 at eth0
I am using IP alaiing on eth0 for x.y.z.2, x.y.z.3.

Now from my internal network, I can go to x.y.z.2 and 3, but cannot connect
to a web server at x.y.z.1

 

 

Regards,

Chand Deshwal (M.Tech CS&E, MCSE, CCNA) 	

-----Original Message-----
From: Joel Newkirk [mailto:netfilter@newkirk.us]
Sent: Tuesday, June 17, 2003 5:04 AM
To: Herbert G. Fischer
Cc: NetFilter Users
Subject: Re: External Resolved IPs


On Mon, 2003-06-16 at 17:00, Herbert G. Fischer wrote:

> My problem is that, when I try to connect to a internal server, using the
> external and real
> IP, I cannot because my FW/NAT appears to be confused or misconfigured.
> 
> For example:
> 
> Internal Network: 172.16.48.0/24
> 
> My IP: 172.16.48.10
> Server Internal IP: 172.16.48.20
> * Both are on the same network
> 
> Server External IP: 200.180.180.20 (IP alias on FW/NAT machine, that
> redirects to 172.16.48.20)
> DNS name of Server: server.domain.com, points to 200.180.180.20

> # server
> iptables -t nat -A POSTROUTING -s 172.16.48.20 -j SNAT --to-source
> 200.180.180.20
> iptables -t nat -A PREROUTING -s 0/0 -d 200.180.180.20 -j
> DNAT --to-destination 172.16.48.20
> 
> # NAT for the rest of the world
> iptables -t nat -A POSTROUTING -o eth1 -s 172.16.48.0/24 -j SNAT
--to-source
> 200.180.180.22

When a request from a local client arrives at the iptables box addressed
to 200.180.180.20, it hits PREROUTING and is DNATted to the appropriate
server.  Problem is that the server tries to reply directly to the
client, (since it's a local IP) which sees a 'new' connection from
172.16.48.20, which it ignores.  Try adding:

iptables -t nat -A POSTROUTING -d 172.16.48.20 -s 172.16.48.0/24 -j SNAT
--to iptables.box.local.ip

With this additional rule in place, requests from local clients hit the
iptables box and are DNATted to the local server, then before leaving
the iptables box they are SNATted so that the server sends its reply
back to the iptables box.  When that reply is received by the iptables
box, it unSNATs and restores the correct destination IP (the local
client) then before it leaves the box it unDNATs to restore the correct
source IP (the local server's public IP).

j



------_=_NextPart_001_01C33491.F4766D10
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

<P><FONT SIZE=3D2>&lt;&lt;&lt;iptables -t nat -A POSTROUTING -d =
172.16.48.20 -s 172.16.48.0/24 -j SNAT</FONT>
<BR><FONT SIZE=3D2>--to iptables.box.local.ip</FONT>
</P>

<P><FONT SIZE=3D2>This rule works for DNATted servers. Now I am able to =
reach to my servers from Internal Network. I am still facing a problem. =
I can not reach to the External Interface of NAT Box.</FONT></P>

<P><FONT SIZE=3D2>For example:</FONT>
</P>

<P><FONT SIZE=3D2>External IP of NAT box is x.y.z.1 at eth0</FONT>
<BR><FONT SIZE=3D2>I am using IP alaiing on eth0 for x.y.z.2, =
x.y.z.3.</FONT>
</P>

<P><FONT SIZE=3D2>Now from my internal network, I can go to x.y.z.2 and =
3, but cannot connect to a web server at x.y.z.1</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>Regards,</FONT>
</P>

<P><FONT SIZE=3D2>Chand Deshwal (M.Tech CS&amp;E, MCSE, CCNA) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
</P>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Joel Newkirk [<A =
HREF=3D"mailto:netfilter@newkirk.us">mailto:netfilter@newkirk.us</A>]</F=
ONT>
<BR><FONT SIZE=3D2>Sent: Tuesday, June 17, 2003 5:04 AM</FONT>
<BR><FONT SIZE=3D2>To: Herbert G. Fischer</FONT>
<BR><FONT SIZE=3D2>Cc: NetFilter Users</FONT>
<BR><FONT SIZE=3D2>Subject: Re: External Resolved IPs</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>On Mon, 2003-06-16 at 17:00, Herbert G. Fischer =
wrote:</FONT>
</P>

<P><FONT SIZE=3D2>&gt; My problem is that, when I try to connect to a =
internal server, using the</FONT>
<BR><FONT SIZE=3D2>&gt; external and real</FONT>
<BR><FONT SIZE=3D2>&gt; IP, I cannot because my FW/NAT appears to be =
confused or misconfigured.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; For example:</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Internal Network: 172.16.48.0/24</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; My IP: 172.16.48.10</FONT>
<BR><FONT SIZE=3D2>&gt; Server Internal IP: 172.16.48.20</FONT>
<BR><FONT SIZE=3D2>&gt; * Both are on the same network</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Server External IP: 200.180.180.20 (IP alias on =
FW/NAT machine, that</FONT>
<BR><FONT SIZE=3D2>&gt; redirects to 172.16.48.20)</FONT>
<BR><FONT SIZE=3D2>&gt; DNS name of Server: server.domain.com, points =
to 200.180.180.20</FONT>
</P>

<P><FONT SIZE=3D2>&gt; # server</FONT>
<BR><FONT SIZE=3D2>&gt; iptables -t nat -A POSTROUTING -s 172.16.48.20 =
-j SNAT --to-source</FONT>
<BR><FONT SIZE=3D2>&gt; 200.180.180.20</FONT>
<BR><FONT SIZE=3D2>&gt; iptables -t nat -A PREROUTING -s 0/0 -d =
200.180.180.20 -j</FONT>
<BR><FONT SIZE=3D2>&gt; DNAT --to-destination 172.16.48.20</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; # NAT for the rest of the world</FONT>
<BR><FONT SIZE=3D2>&gt; iptables -t nat -A POSTROUTING -o eth1 -s =
172.16.48.0/24 -j SNAT --to-source</FONT>
<BR><FONT SIZE=3D2>&gt; 200.180.180.22</FONT>
</P>

<P><FONT SIZE=3D2>When a request from a local client arrives at the =
iptables box addressed</FONT>
<BR><FONT SIZE=3D2>to 200.180.180.20, it hits PREROUTING and is DNATted =
to the appropriate</FONT>
<BR><FONT SIZE=3D2>server.&nbsp; Problem is that the server tries to =
reply directly to the</FONT>
<BR><FONT SIZE=3D2>client, (since it's a local IP) which sees a 'new' =
connection from</FONT>
<BR><FONT SIZE=3D2>172.16.48.20, which it ignores.&nbsp; Try =
adding:</FONT>
</P>

<P><FONT SIZE=3D2>iptables -t nat -A POSTROUTING -d 172.16.48.20 -s =
172.16.48.0/24 -j SNAT</FONT>
<BR><FONT SIZE=3D2>--to iptables.box.local.ip</FONT>
</P>

<P><FONT SIZE=3D2>With this additional rule in place, requests from =
local clients hit the</FONT>
<BR><FONT SIZE=3D2>iptables box and are DNATted to the local server, =
then before leaving</FONT>
<BR><FONT SIZE=3D2>the iptables box they are SNATted so that the server =
sends its reply</FONT>
<BR><FONT SIZE=3D2>back to the iptables box.&nbsp; When that reply is =
received by the iptables</FONT>
<BR><FONT SIZE=3D2>box, it unSNATs and restores the correct destination =
IP (the local</FONT>
<BR><FONT SIZE=3D2>client) then before it leaves the box it unDNATs to =
restore the correct</FONT>
<BR><FONT SIZE=3D2>source IP (the local server's public IP).</FONT>
</P>

<P><FONT SIZE=3D2>j</FONT>
</P>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C33491.F4766D10--

