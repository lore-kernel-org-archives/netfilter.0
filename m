From: "Tim" <twr@bellsouth.net>
Subject: Rules methodology vs. network topology: clarifications
Date: Fri, 13 Sep 2002 18:05:54 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002001c25b8a$e1210fd0$0101a8c0@nebuchadnezza>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001D_01C25B50.3413F670"
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
To: iptables-list <netfilter@lists.samba.org>

This is a multi-part message in MIME format.

------=_NextPart_000_001D_01C25B50.3413F670
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ok,=20

I have learned how to install/configure iptables and have an =
understanding of the traversal of traffic based on the chains/rules. I =
also understand, pretty well, the rules syntax and how they are written =
according to the iptables tutorial that Oskar Andreasson has written. I =
have also learned to install the NIDS (snort) and the supporting =
applications in order to log alerts, and everything is working as it =
should. So far so good.=20

My very small dilemma now is how to write the rules according to the =
topology I have. I have looked at quite a number of rule configuration =
examples on the net but none of the examples are quite exactly the way I =
have my network configured, this would have helped in understanding how =
to approach the writing of the rules for my present topology. I have to =
the best of my understanding written some examples to get some feedback =
from the community at large.

THE TOPOLOGY: Cisco 806 DSL router with two Ethernet ports one for the =
internet and one for my LAN. The internet port will obviously be =
configured with a static public ip address. The LAN Ethernet port will =
have a private ip address=3D192.168.2.2. Network Address Translations =
will be executed at the router. I figured that by having the router =
doing NAT and some ip filtering I would have some additional security to =
my infrastructure. The router has ip filtering available ( ACLs ) and =
some basic firewalling features available.

On the firewall I have three NICs, one that connects from the router/LAN =
Ethernet port, eth0=3D192.168.2.1; one for the DMZ, eth1=3D172.16.16.1; =
and one for my internal network, eth2=3D192.168.1.11.

All chain policies are DROP !!!

CLARIFICATIONS: If my understandings are correct, ( please, suggestions =
are welcomed ), I should be writing rules on the PREROUTING chain that =
will allow desirable incoming connections/traffic from the Internet, =
translated from the router to eth0=3D192.168.2.1, ( the first NIC on the =
firewall from the router [192.168.2.0/24 subnet] ), to be allowed to =
desired LAN/DMZ server ports, i.e., mail, webserver, ftp, ssh...etc. Is =
this correct so far ?=20

Example: iptables -t nat -A PREROUTING -p tcp -d 192.168.2.0/24 --dport =
80 -j DNAT --to-destination 172.16.16.5
               iptables -t nat -A PREROUTING -p tcp -d 192.168.2.0/24 =
--dport 25 -j DNAT --to-destination 192.168.1.3
               iptables -t nat -A PREROUTING -p tcp -d 192.168.2.0/24 =
--dport 110 -j DNAT --to-destination 192.168.1.3
              =20
On the FORWARD chain, I should be writing rules to allow =
connections/traffic to be routed to its final ip address/port =
destination and the ability to respond to the originating connection.

Example: iptables -A FORWARD -p tcp  --dport 80 -d 172.16.16.5 -j ACCEPT =

               iptables -A FORWARD -p tcp  --dport 25 -d 192.168.1.3 -j =
ACCEPT
               iptables -A FORWARD -p tcp  --dport 110 -d 192.168.1.3 -j =
ACCEPT
               iptables -A FORWARD -m state --state ESTABLISHED,RELATED =
-j ACCEPT

On the POSTROUTING chain, the rules are to allow all outgoing =
connections to the internet and allow all related,established =
connections back in

Example: iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source =
$INTERNETIP?

Being that the router is the one that is doing all the translations, the =
POSTROUTING rule is the one where I'm hesitating on. Should I be doing =
SNAT to the actual Internet ip or should I be doing SNAT to the =
192.168.2.2 Ethernet port on the router and then allowing the router to =
translate out to the internet?  ..... hence my need for clarification.

Constructive comments, suggestions, pointers to documentation will be =
gratefully and sincerely appreciated. Thanks in advance for taking the =
time and consideration.

Tim Rodriguez -- Mia/Fla
Network Security Student


P.S
As mentioned above, I have seen quite a few examples of rules for =
different topologies, and either I'm confused or the people that wrote =
then don't have all their oars in the water. CASE: The policies for =
certain chains are to DROP packets, yet they write rules to DROP =
packets. I was under the impression that if you set a DROP policy for =
any of the chains, all traffic/packets coming to that chain will be DROP =
(not allowed to traverse) unless a rules is explicitly written ACCEPT =
the specified traffic or otherwise. Did I miss something or are these =
rules written by these people null and void.






------=_NextPart_000_001D_01C25B50.3413F670
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3315.2870" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Ok, </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have learned how to install/configure =
iptables=20
and have an understanding of the traversal of traffic based on the =
chains/rules.=20
I&nbsp;also understand, pretty well, the rules syntax and how they are =
written=20
according to the iptables tutorial that Oskar Andreasson has written. I =
have=20
also learned to install the NIDS (snort) and the supporting applications =
in=20
order to log alerts, and everything is working as it should. So far so =
good.=20
</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>My very small dilemma now is how to =
write the rules=20
according to the topology I have. I have looked at quite a number of =
rule=20
configuration examples on the net but none of the examples are quite =
exactly the=20
way I have my network configured, this would have helped in =
understanding how to=20
approach the writing of the rules for&nbsp;my present topology. I have =
to the=20
best of my understanding written some examples to get some feedback from =
the=20
community at large.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>THE TOPOLOGY: Cisco 806 DSL router with =
two=20
Ethernet ports one for the internet and one for my&nbsp;LAN. The =
internet port=20
will obviously be configured with a static public ip address. The LAN =
Ethernet=20
port will have a private ip address=3D192.168.2.2. Network Address =
Translations=20
will be executed at the router. <FONT face=3DArial size=3D2>I figured =
that by having=20
the router doing NAT and some ip filtering I would have some additional =
security=20
to my infrastructure. The router has ip filtering available ( ACLs ) and =
some=20
basic firewalling&nbsp;features available.</FONT></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>On the firewall I have three NICs, one =
that=20
connects from&nbsp;the router/LAN Ethernet port, eth0=3D192.168.2.1; one =
for the=20
DMZ, eth1=3D172.16.16.1; and one for my internal network,=20
eth2=3D192.168.1.11.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>All chain policies are DROP =
!!!</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>CLARIFICATIONS: If my understandings =
are correct, (=20
please, suggestions are welcomed ), I should be writing rules on the =
PREROUTING=20
chain that will allow desirable incoming connections/traffic from the =
Internet,=20
translated from the router to eth0=3D192.168.2.1, ( the first NIC on the =
firewall=20
from the router [192.168.2.0/24&nbsp;subnet] ), to be allowed to desired =
LAN/DMZ=20
server ports, i.e., mail, webserver, ftp, ssh...etc. Is this correct so =
far ?=20
</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Example: iptables -t nat -A PREROUTING =
-p tcp=20
-d&nbsp;192.168.2.0/24 --dport 80 -j DNAT --to-destination=20
172.16.16.5</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
iptables -t nat -A PREROUTING -p tcp -d 192.168.2.0/24 --dport 25 -j =
DNAT=20
--to-destination 192.168.1.3</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
iptables -t nat -A PREROUTING -p tcp -d 192.168.2.0/24 --dport 110 -j =
DNAT=20
--to-destination 192.168.1.3</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>On the FORWARD chain, I should be =
writing rules to=20
allow connections/traffic to be routed to its final ip address/port =
destination=20
and the ability to respond to the originating connection.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Example: iptables -A FORWARD -p=20
tcp&nbsp;&nbsp;--dport 80 -d&nbsp;172.16.16.5 -j =
ACCEPT&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
iptables -A FORWARD -p tcp&nbsp; --dport 25 -d 192.168.1.3 -j=20
ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
iptables -A FORWARD -p tcp&nbsp; --dport 110 -d 192.168.1.3 -j =
ACCEPT</DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j =
ACCEPT</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>On the POSTROUTING chain, the rules are to allow all outgoing =
connections=20
to the internet and allow all related,established connections back =
in</DIV>
<DIV>&nbsp;</DIV>
<DIV>Example: iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source =

$INTERNETIP?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Being that the router is the one that is doing all the =
translations, the=20
POSTROUTING rule is the one where I'm hesitating on. Should I be doing =
SNAT to=20
the actual Internet ip or should I be doing SNAT to the 192.168.2.2 =
Ethernet=20
port on the router and then allowing the router to translate out to the=20
internet?  ..... hence my need for clarification.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Constructive comments, suggestions, pointers to documentation will =
be=20
gratefully and sincerely appreciated. Thanks in advance for taking the =
time and=20
consideration.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Tim Rodriguez -- Mia/Fla</DIV>
<DIV>Network Security Student</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>P.S</DIV>
<DIV>As mentioned above, I have seen quite a few examples of rules for =
different=20
topologies, and either I'm confused or the people that wrote then don't =
have all=20
their oars in the water. CASE: The policies for certain chains are to =
DROP=20
packets, yet they write rules to DROP packets. I was under the =
impression that=20
if you set a DROP policy for any of the chains, all traffic/packets =
coming to=20
that chain will be DROP (not allowed to traverse) unless a rules is =
explicitly=20
written ACCEPT the specified traffic or otherwise. Did I miss something =
or are=20
these rules written by these people null and void.</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></FONT>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_001D_01C25B50.3413F670--


