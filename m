From: "Tanen" <tanen@tanen.dyndns.org>
Subject: RE : RE : [IP ?] what ip must be filtered ?
Date: Thu, 11 Dec 2003 16:20:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004001c3bffa$5cb83090$02fea8c0@ALESK>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
Cc: netfilter@lists.netfilter.org



---> -----Message d'origine-----
---> De=A0: John A. Sullivan III [mailto:john.sullivan@nexusmgmt.com]
---> Envoy=E9=A0: jeudi 11 d=E9cembre 2003 14:05
---> =C0=A0: Tanen
---> Cc=A0: 'Antony Stone'; netfilter@lists.netfilter.org
---> Objet=A0: Re: RE : [IP ?] what ip must be filtered ?
--->=20
---> On Thu, 2003-12-11 at 06:42, Tanen wrote:
---> > Hellon
---> > Thanks for your help,
---> > This dedicated box, is on my local network, but don't be a=20
---> > reuters,
---> just a
---> > server, i have a hard reuters, with hard firewall integrate in=20
---> > this
---> reuters.
---> > My question is not realy clear, i try again to explain it : I=20
---> > want block, all attack, and all flood or other shit related to=20
---> > the hackers, of my server, for this, i have only forward few=20
---> > ports on my hardware reuters, 80, 110, 25, 143, 21, 53, 443, 993, =

---> > all others are
---> blocked
---> > by the hardware firewall. Now i want prevent any thing would be
---> attempt by
---> > using this ports. So i want create an firewall for prevent this,=20
---> > and authorise ALL traffic in the local network, but filtering the
---> outgoing
---> > packets from the server, for not allow any other things that the
---> things
---> > requested by the puters itself. I'm not sure to be clear if no, i =

---> > can
---> try
---> > again to explain it, but i'm not speaking english very well,=20
---> > that's
---> not my
---> > main language. I'm a realy begginer to Iptables, and a novice to
---> Linux. Ihe
---> > local network, but filtering the outgoing packets from the=20
---> > server,
---> for not
---> > allow any other things that the things requested by the puters
---> itself. I'm
---> > not sure to be clear if no, i can try again to explain it, but=20
---> > i'm
---> not
---> > speaking english very well, that's not my main language. I'm a=20
---> > realy begginer to Iptables, and a novice to Linux. I'm listening=20
---> > ALL help
---> ... :)
---> > and any help would be appreciated.
---> > <snip>---> > i'm filtering my local ip, or my external ip, my=20
---> > mail
---> server, isn't
---> > ---> getting
---> > ---> > any mail from www, someone can help me please ?
---> > --->
---> > ---> The simplest way to do what you want is not to think about=20
---> > ---> IP
---> addresses
---> > ---> so
---> > ---> much as which interface they're connected to.
---> > --->
---> > ---> Let's assume that your firewall has 192.168.0.100 on eth0
---> (private,
---> > ---> internal)
---> > ---> and 63.x.y.z on eth1 (public, external)
---> > --->
---> > ---> Then a good start to your ruleset would be:
---> > --->
---> > ---> iptables -P FORWARD DROP
---> > ---> iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT iptables -A=20
---> > ---> FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED,RELATED =

---> > ---> -j ACCEPT
---> > ---> iptables -A POSTROUTING -t nat -o eth1 -j SNAT --to 63.x.y.z
---> > --->
---> > ---> An improvement on the above rules would be to be more
---> restrictive about
---> > ---> what
---> > ---> traffic you allow from internal clients to the Internet,=20
---> > ---> however
---> this
---> > ---> is a
---> > ---> start.
---> > --->
---> > ---> If you don't understand anything about the above rules feel=20
---> > ---> free
---> to ask
---> > ---> again.
---> > --->
---> > ---> Antony.
---> <snip>
--->=20
---> Let me try to rephrase your question first so we can try to=20
---> understand it better. You have a physical router with a firewall=20
---> between your internal network
---> and the Internet.  This is NOT the iptables firewall.  It is =
forwarding
---> ports to your internal network.  Are you saying that on that =
network
---> you
---> have an iptables firewall and you want to use it to restrict =
inbound
---> traffic to only be the reply packets to sessions the internal =
computers
---> have initiated?


No, i will try to explain me better. Yes i have an hardware router with =
an
integrate firewall, who redirect the minimal ports on the dedicated =
Linux
box. By this router (hardware) i have other puters connected to =
internet, as
the dedicated box, all work on the same local network, all can =
comunicate
between them, as for samba, btw Windows --> Linux. On this Linux =
dedicated
box, i have few servers : mail, ftp, dns, pop, pops, imap, imaps, smtp,
smtps, ssh, http, https, samba. NO ONE of puters of local network are =
using
the dedicated box to access to internet, ALL puters use the HARWARE =
router
to access at internet.

My question is, how set my dedicated box, with Iptables, for secure it, =
from
attack, and hack shitting. I want my iptables rules, accept =
communication
from other local network puters, but filtering this access (for limit =
the
spoofing risk) at 3 or 4 static local ip address attributed by the =
HARDWARE
DHCP router, and, in first plan, to secure ALL inbound traffic from =
internet
on my dedicated box. I want get any problem of hack or other things, =
with my
box, it's why i want filter ALL inbound traffic, to prevent any =
problems.
For this, i'm asking what i must do. I hope have been a little bit most
clear. I'm not wanting used my dedicated box, as a router, i don't want =
use
nat or forward on it.

I'm having only one Network card on the Linux box, with the ip =
192.168.0.1
on eth0, here my route table :

----
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
192.168.0.0   0.0.0.0         255.255.255.0   U     0      0        0 =
eth0
0.0.0.0         192.168.0.100 0.0.0.0         UG    0      0        0 =
eth0
---

My HARDWARE router with integrated firewall have as ip address
192.168.0.100, it's providing access at internet to local puters on the
192.168.0/24 mask.

I'm sorry to boring you, with my bad english, and my bad quality of
explication, i'm new to iptables as i've say before, i'm thinking i'm =
now
paranoid too, "because of and old attack problem" and it's why i request
help, and i wast your time :'(

I hope you will help me, and i realy appreciate your help, and all the
efforts that you made to understand me, and my request !

As i have can read on internet, i want prevent of any flood attack syn
flood, and unwanted access port to an unwanted type of protocol,i want
filtered all local traffic to prevent of an trojan use on a windows =
puter to
access at the Linux box, it's for secure all my datas. In "two words",
suggest me how and with what i must secure my box form internet to a =
"Hard
level" and from local network to a "Medium level".

Rely BIG THANKS to you.
Sincerely,
Tanen.

--->=20
---> If this is true, then your first problem is a routing one.  How do=20
---> you get all packets to pass through the iptables device.  Probably=20
---> the cleanest way is to create a new network so that the iptables=20
---> device has two interfaces - one connected to the router and the=20
---> other to an entirely different network - different IP address. =20
---> Then you can set the default gateway of the local computers to the=20
---> iptables computer.
--->=20
---> An alternative is to forward all traffic from the router to the=20
---> iptables server and set the default gateway of all the local=20
---> computers to be the iptables server.  You must be careful to make=20
---> sure that no one is listening to redirection packets or the traffic =

---> flow will be diverted from the iptables server to be directly=20
---> between the hardware router and the local computers.  You will=20
---> generate a constant stream of redirection
---> notifications on you network unless you also turn off the ability =
to
---> send ICMP redirects.
--->=20
---> Once you have your routing straight, then we can worry about=20
---> filtering packets.  As already described, the easiest way to assure =

---> that only outbound initiated traffic is allowed is set DENY=20
---> policies and then
---> allow:
---> iptables -A FORWARD -i eth1 -m state --state NEW - j ACCEPT
---> iptables -A FORWARD -i eth0 -m state --state RELATED, ESTABLISHED =
-j
---> ACCEPT
--->=20
---> Do I correctly understand that you have an e-mail server? Are you=20
---> sure that you do not need to allow inbound initiated traffic to=20
---> this device? In other words, do other devices on the Internet send=20
---> e-mail to it without it first asking for the e-mail? If so, then=20
---> you will need to add rules to allow this inbound initiated traffic. =
=20
---> It would be wisest to put this "public" server on a separate=20
---> network connected to the iptables
---> server, a DMZ, to keep it away from the internal computers.
--->=20
---> Finally, you will need to worry about malicious traffic traveling=20
---> on the allowed ports.  Here is an example of some rules that I load =

---> with iptables-restore -n (thus the different syntax) for such=20
---> protection.  I am sure they could be greatly improved:
--->=20
---> *mangle
---> :PREROUTING ACCEPT
---> :INPUT ACCEPT
---> :OUTPUT ACCEPT
---> :FORWARD ACCEPT
---> :POSTROUTING ACCEPT
---> -I PREROUTING 1 -p 6 -j ProtectionMangleTCP
---> -I PREROUTING 1 -p 1 -j ProtectionMangleICMP
---> -A ProtectionMangleBadTCP -p 6 -m tcp --tcp-flags SYN,ACK SYN,ACK=20
---> -m state --state NEW -m limit --limit 1/s -j LOG --log-level=20
---> warning --log-prefix "[SYN,ACK First Packet] " -A=20
---> ProtectionMangleBadTCP -p 6 -m tcp --tcp-flags SYN,ACK SYN,ACK -m=20
---> state --state NEW -j DROP -A ProtectionMangleBadTCP -m limit=20
---> --limit 1/s -j LOG --log-level warning --log-prefix "[Suspect TCP=20
---> Flags] " -A ProtectionMangleBadTCP -j DROP
---> -A ProtectionMangleTCP -p 6 -m tcp --tcp-flags SYN,ACK SYN,ACK -m =
state
---> --state NEW -j ProtectionMangleBadTCP
---> -A ProtectionMangleTCP -p 6 -m tcp --tcp-flags ALL ALL -j
---> ProtectionMangleBadTCP
---> -A ProtectionMangleTCP -p 6 -m tcp --tcp-flags ALL NONE -j
---> ProtectionMangleBadTCP
---> -A ProtectionMangleTCP -p 6 -m tcp --tcp-flags SYN,FIN SYN,FIN -j
---> ProtectionMangleBadTCP
---> -A ProtectionMangleTCP -p 6 -m tcp --tcp-flags SYN,RST SYN,RST -j
---> ProtectionMangleBadTCP
---> -A ProtectionMangleTCP -p 6 -m tcp --tcp-flags RST,FIN RST,FIN -j
---> ProtectionMangleBadTCP
---> -A ProtectionMangleTCP -p 6 -m tcp --tcp-flags ACK,FIN FIN -j
---> ProtectionMangleBadTCP
---> -A ProtectionMangleTCP -p 6 -m tcp --tcp-flags ACK,PSH PSH -j
---> ProtectionMangleBadTCP
---> -A ProtectionMangleTCP -p 6 -m tcp --tcp-flags URG,ACK URG -j
---> ProtectionMangleBadTCP
---> -A ProtectionMangleICMP -p 1 -m icmp --icmp-type 8 -d =
255.255.255.255 -
---> m
---> limit --limit 1/s -j LOG --log-level warning --log-prefix =
"[Broadcast
---> Ping] "
---> -A ProtectionMangleICMP -p 1 -m icmp --icmp-type 8 -d =
255.255.255.255 -
---> j
---> DROP
---> -A ProtectionMangleICMP -p 1 -m icmp --icmp-type 8 -m limit --limit
---> 200/s --limit-burst 500 -j RETURN
---> -A ProtectionMangleICMP -p 1 -m icmp --icmp-type 8 -m limit --limit =
1/s
---> -j LOG --log-level warning --log-prefix "[Ping Flood] "
---> -A ProtectionMangleICMP -p 1 -m icmp --icmp-type 8 -j DROP
--->=20
---> mangle
---> -I PREROUTING 1 -f -i eth1 -j DROP # fragments
---> -A PREROUTING -i ! $PUBLICIF -s $PRIVATENETWORK -j DROP #=20
---> anti-spoofing COMMIT
--->=20
---> You may also want to look at some of the settings available to you=20
---> via /proc to handle spoofing, source route bridging, icmp=20
---> redirects, etc.
--->=20
---> You may want to take a tour through Oskar Andreasson's fine=20
---> tutorial on the netfilter web site. You can also find an iptables=20
---> slide show in the training section at http://iscs.sourceforge.net
--->=20
---> Have I understood your questions properly?
--->=20
---> --
---> John A. Sullivan III
---> Chief Technology Officer
---> Nexus Management
---> +1 207-985-7880
---> john.sullivan@nexusmgmt.com
---> ---
---> If you are interested in helping to develop a GPL enterprise class=20
---> VPN/Firewall/Security device management console, please visit=20
---> http://iscs.sourceforge.net



