From: "Carlos Fernandez Sanz" <cfs-netfilter@nisupu.com>
Subject: Martian addresses
Date: Thu, 15 Jan 2004 12:58:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002801c3db5e$f453fea0$1530a8c0@HUSH>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0025_01C3DB67.55C27E70"
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
To: netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0025_01C3DB67.55C27E70
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

At work (where there's no one else to do this job, so it's up to me even =
though I'm no network expert) we have installed an internet service. We =
have been given 5 public IP addresses whose traffic come from one single =
RJ45 jack (which is on a device which connects to a small dish).=20

The provider expects traffic to come from 172.19.78.6 to 172.19.78.1. =
Those addresses of course can't connect to internet, but the public IPs =
(obviously) can.

Since I want the LAN computers not to use public IPs at all (and keep =
them for the server use, I have it up like this).


Provider  <-------> Linux <-------> LAN

The Linux box has two NICs, one is connected to the Provider and the =
other one to the LAN.
The NIC connected to the provider has the IP 172.19.78.1, as expected. =
However, since the box is also our webserver and need to own public the =
addresses, I'm cheating by doing this:

iptables -t nat -A POSTROUTING -o $NEO_IFACE -j SNAT  --to-source =
$PUBLIC_IP
iptables -t nat -A PREROUTING -i $NEO_IFACE -d $PUBLIC_IP -j DNAT =
--to-destination $PRIVATE_IP

which makes sure that all traffic to the external interface uses a =
public IP instead of the provider private one, and converts traffic =
coming from the internet to the IP address I have in the card.

This seems to work fine (well, FTP get confused and sends the private =
address for PORT, but I guess that's easily fixable). I get lots of =
"martian source" messages in the logs, plus honestly, I'm not sure this =
is the right way to set this up.=20

Any advice?


------=_NextPart_000_0025_01C3DB67.55C27E70
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1276" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>At work (where there's no one else to =
do this job,=20
so it's up to me even though I'm no network expert) we have installed an =

internet service. We have been given 5 public IP addresses whose traffic =
come=20
from one single RJ45 jack (which is on a device which connects to a =
small dish).=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The provider expects traffic to come =
from=20
</FONT><FONT face=3DArial><FONT size=3D2>172.19.78.6 to 172.19.78.1. =
Those addresses=20
of course can't connect to internet, but the public IPs (obviously)=20
can.</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2>Since I want the LAN computers =
not to use=20
public IPs at all (and keep them for the server use, I have it up like=20
this).</FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2>Provider&nbsp; &lt;-------&gt; =
Linux=20
&lt;-------&gt; LAN</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The Linux box has two NICs, one is =
connected to the=20
Provider and the other one to the LAN.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The NIC connected to the provider has =
the IP=20
172.19.78.1, as expected. However, since the box is also our webserver =
and need=20
to own public the addresses, I'm cheating by doing this:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2>iptables -t nat -A POSTROUTING -o =
$NEO_IFACE=20
-j SNAT&nbsp; --to-source $PUBLIC_IP<BR>iptables -t nat -A PREROUTING -i =

$NEO_IFACE -d $PUBLIC_IP -j DNAT --to-destination=20
$PRIVATE_IP<BR></FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2>which makes sure that all traffic =
to the=20
external interface uses a public IP instead of the provider private one, =
and=20
converts traffic coming from the internet to the IP address I have in =
the=20
card.</FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2>This seems to work fine (well, =
FTP get=20
confused and sends the private address for PORT, but I guess that's =
easily=20
fixable). I get lots of "martian source" messages in the logs, plus =
honestly,=20
I'm not sure this is the right way to set this up. </FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any advice?</FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT =
size=3D2>&nbsp;</DIV></FONT></BODY></HTML></FONT>

------=_NextPart_000_0025_01C3DB67.55C27E70--


