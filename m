From: "Benjamin Dickgiesser" <benjamin@dickgiesser.net>
Subject: Firewall workaround
Date: Fri, 16 Jan 2004 17:01:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <357895CFC8CB7C44900D6A4F46D08AA90459C9@exchangeserver.IAT.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3DC4A.0F9E7862"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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

------_=_NextPart_001_01C3DC4A.0F9E7862
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

It would be realy nice if someone could help me with this:

Situation:
I am useing a Windows XP PC at a student hall. To connect to the =
internet I
am useing the university connection. Unfortunatly there are only around =
5
open ports (80,21,22,23,6667).
My aim is to make a work around to this firewall.

Plan:
Create a VPN with an outside suse linux 9 server with a static ip on an =
open
port and use this pc as a gateway.


                 144.82.201.0/23
User --------> |FIREWALL| --->(  Internet   )
 |                                                        /\ | |
 |                                                        | | \/
 |-----------------VPN----------> Linux Server
                     10.3.0.0/32

User:
[VPN]
IP:           10.3.0.2/32
Gateway: 10.3.0.1

[Uni net]
IP:                 144.82.200.116/23
Nameserver:  144.82.100.1
                     144.82.100.41


Linux Server:
[VPN]interface tun0
IP: 10.3.0.1/32

[Internet] - interface eth0:
IP:   217.172.172.111/32
Nameserver:  217.172.166.7
  217.172.191.7
Gateway:  217.172.172.1

What I have done:
I created a tunnel between the 2 pc's with openvpn
(openvpn.sourecforge.net).

Problem:
How do I setup the Suse Linux PC in order that it works properly as a
gateway and is there anything else to do on the Windows pc (route add?).

I tried the following without a success:
I have to add that I'm a total linux nub and that I got this information
from:
http://www.yolinux.com/TUTORIALS/LinuxTutorialIptablesNetworkGateway.html=
 =
<http://www.yolinux.com/TUTORIALS/LinuxTutorialIptablesNetworkGateway.htm=
l>=20
   On Linux PC:
   iptables --flush            - Flush all the rules in filter and nat
tables
   iptables --table nat --flush
   iptables --delete-chain     - Delete all chains that are not in =
default
filter and nat table
   iptables --table nat --delete-chain

   iptables --table nat --append POSTROUTING --out-interface eth0 -j
MASQUERADE
   iptables --append FORWARD --in-interface tun0 -j ACCEPT

   echo 1 > /proc/sys/net/ipv4/ip_forward

   route add  -net 10.3.0.0 netmask 255.255.255.0 gw 217.172.172.1 dev =
tun0
   > SIOCADDRT:: Network not reachable.

Could someone help me with this?
Thanks alot!

Benjamin Dickgie=DFer



------_=_NextPart_001_01C3DC4A.0F9E7862
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"><HTML =
DIR=3Dltr><HEAD><META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1"></HEAD><BODY><DIV><FONT face=3D'Arial' =
color=3D#000000 size=3D2><FONT face=3D"Times New Roman" size=3D3>It =
would be realy nice =0A=
if someone could help me with this:<BR><BR>Situation:<BR>I am useing a =
Windows =0A=
XP PC at a student hall. To connect to the internet I<BR>am useing the =0A=
university connection. Unfortunatly there are only around 5<BR>open =
ports =0A=
(80,21,22,23,6667).<BR>My aim is to make a work around to this =0A=
firewall.<BR><BR>Plan:<BR>Create a VPN with an outside suse linux 9 =
server with =0A=
a static ip on an open<BR>port and use this pc as a =0A=
gateway.<BR><BR><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
144.82.201.0/23<BR>User --------&gt; |FIREWALL| ---&gt;(&nbsp; =0A=
Internet&nbsp;&nbsp; =0A=
)<BR>&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
/\ | =0A=
|<BR>&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
| | \/<BR>&nbsp;|-----------------VPN----------&gt; Linux =0A=
Server<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
10.3.0.0/32<BR><BR>User:<BR>[VPN]<BR>IP:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
10.3.0.2/32<BR>Gateway: 10.3.0.1<BR><BR>[Uni =0A=
net]<BR>IP:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
144.82.200.116/23<BR>Nameserver:&nbsp; =0A=
144.82.100.1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
144.82.100.41<BR><BR><BR>Linux Server:<BR>[VPN]interface tun0<BR>IP: =0A=
10.3.0.1/32<BR><BR>[Internet] - interface eth0:<BR>IP:&nbsp;&nbsp; =0A=
217.172.172.111/32<BR>Nameserver:&nbsp; 217.172.166.7<BR>&nbsp; =0A=
217.172.191.7<BR>Gateway:&nbsp; 217.172.172.1<BR><BR>What I have =
done:<BR>I =0A=
created a tunnel between the 2 pc's with =0A=
openvpn<BR>(openvpn.sourecforge.net).<BR><BR>Problem:<BR>How do I setup =
the Suse =0A=
Linux PC in order that it works properly as a<BR>gateway and is there =
anything =0A=
else to do on the Windows pc (route add?).<BR><BR>I tried the following =
without =0A=
a success:<BR>I have to add that I'm a total linux nub and that I got =
this =0A=
information<BR>from:<BR></FONT><A =0A=
href=3D"http://www.yolinux.com/TUTORIALS/LinuxTutorialIptablesNetworkGate=
way.html"><FONT =0A=
face=3D"Times New Roman" =0A=
size=3D3>http://www.yolinux.com/TUTORIALS/LinuxTutorialIptablesNetworkGat=
eway.html</FONT></A><BR><FONT =0A=
face=3D"Times New Roman" size=3D3>&nbsp;&nbsp; On Linux =
PC:<BR>&nbsp;&nbsp; iptables =0A=
--flush&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 - =0A=
Flush all the rules in filter and nat<BR>tables<BR>&nbsp;&nbsp; iptables =
--table =0A=
nat --flush<BR>&nbsp;&nbsp; iptables =
--delete-chain&nbsp;&nbsp;&nbsp;&nbsp; - =0A=
Delete all chains that are not in default<BR>filter and nat =0A=
table<BR>&nbsp;&nbsp; iptables --table nat =
--delete-chain<BR><BR>&nbsp;&nbsp; =0A=
iptables --table nat --append POSTROUTING --out-interface eth0 =0A=
-j<BR>MASQUERADE<BR>&nbsp;&nbsp; iptables --append FORWARD =
--in-interface tun0 =0A=
-j ACCEPT<BR><BR>&nbsp;&nbsp; echo 1 &gt; =0A=
/proc/sys/net/ipv4/ip_forward<BR><BR>&nbsp;&nbsp; route add&nbsp; -net =
10.3.0.0 =0A=
netmask 255.255.255.0 gw 217.172.172.1 dev tun0<BR>&nbsp;&nbsp; &gt; =
SIOCADDRT:: =0A=
Network not reachable.<BR><BR>Could someone help me with this?<BR>Thanks =0A=
alot!<BR><BR>Benjamin =
Dickgie=DFer</FONT><BR><BR></FONT></DIV></BODY></HTML>
------_=_NextPart_001_01C3DC4A.0F9E7862--

