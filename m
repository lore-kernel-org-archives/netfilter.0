From: "Christian Ericsson" <debian@home.se>
Subject: RE: Bug in FORWARD chain in iptables-1.2.7a with Linux kernel 2.4.20? >>> SOLVED !!!
Date: Thu, 26 Jun 2003 17:58:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001801c33bfb$ccbf8740$64a5a8c0@europe.cellnetwork.com>
References: <000701c33989$aa826180$64a5a8c0@europe.cellnetwork.com>
Reply-To: <debian@home.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000701c33989$aa826180$64a5a8c0@europe.cellnetwork.com>
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Hi,

"Bug in FORWARD chain..." were "strong words".

> "What you're stating here doesn't make sense..."
> as Ramin Dousti said.

"Strange behaviour in FORWARD chain..." should have been more appropriate.
Sorry!

However, words from George Vieira:
> "Are you sure there is no ACCEPT rules in the forward chain on the
firewall anywhere???
> can you list them for me with `iptables -L -v -n -x` and just blank the
IPs if you want..

ACCEPT rules? Hmm... The only "ACCEPT rules" a did have in the FORWARD chain
were for protection... Funny, they did harm me more than they were helping
me... as it seems...

I will list them for you:

iptables --new-chain protect
# SYN flood
iptables --append protect -p tcp --syn -m limit 1/s --limit-burst 4 -j
ACCEPT
# Port scan
iptables --append protect -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m
limit --limit 1/s -j ACCEPT
# Ping of death
iptables --append protect -p icmp --icmp-type echo-request -m limit --limit
1/s -j ACCEPT
# Don't trust fragments
iptables --append protect ! --fragment -j ACCEPT
iptables --append INPUT   -i eth0 -j protect
iptables --append FORWARD -i eth0 -j protect

The rules above, as I realise now, did more harm than they helped...

I have rewritten the rules in the "protect"-chain as:

iptables --new-chain protect
iptables --new-chain protect_from_syn_flood
iptables --new-chain protect_from_port_scan
iptables --new-chain protect_from_ping_of_death
iptables --new-chain protect_from_fragments
# Protection
iptables --append protect -p tcp --syn -j protect_from_syn_flood
iptables --append protect -p tcp --tcp-flags SYN,ACK,FIN,RST RST -j
protect_from_port_scan
iptables --append protect -p icmp --icmp-type echo-request -j
protect_from_ping_of_death
iptables --append protect --fragment -j protect_from_fragments
# SYN flood
iptables --append protect_from_syn_flood -m limit --limit 1/s --limit-burst
4 -j RETURN
iptables --append protect_from_syn_flood -j LOG --log-level
debug --log-prefix "IPTABLES BLOCK SYN FLOOD "
iptables --append protect_from_syn_flood -j DROP
# Port scan
iptables --append protect_from_port_scan -m limit --limit 1/s -j RETURN
iptables --append protect_from_port_scan -j LOG --log-level
debug --log-prefix "IPTABLES BLOCK PORT SCAN "
iptables --append protect_from_port_scan -j DROP
# Ping flood (Ping of Death)
iptables --append protect_from_ping_of_death -m limit --limit 1/s -j RETURN
iptables --append protect_from_ping_of_death -j LOG --log-level
debug --log-prefix "IPTABLES BLOCK PING OF DEATH "
iptables --append protect_from_ping_of_death -j DROP
# Dont' trust fragments
iptables --append protect_from_fragments -j LOG --log-level
debug --log-prefix "IPTABLES BLOCK FRAGMENT "
iptables --append protect_from_fragments -j DROP

That's more like it, I guess!?

Do you have any comments about the "protection" rules? Have I missed some
"protection" rule that you know about? Are the "--limit-burst" values OK?


Regards,

Christian



-----Ursprungligt meddelande-----
lter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]F=F6r Christian Ericsson
Skickat: den 23 juni 2003 15:17
Till: Netfilter (E-mail)
=C4mne: Bug in FORWARD chain in iptables-1.2.7a with Linux kernel 2.4.20?


Hi,

I have the following configuration:

INTERNET
|
Firewall (Linux box with IPTables)
|
Router (Linux box with IPTables)


The default policy in the FORWARD chain in the Firewall is set to DROP
packets. So, I have to insert a rule for every traffic I want to accept.

The Router logs all traffic:

iptables --append INPUT   -j LOG --log-level debug --log-prefix "IPTABLES
LOG INPUT "
iptables --append FORWARD -j LOG --log-level debug --log-prefix "IPTABLES
LOG FORWARD "
iptables --append OUTPUT  -j LOG --log-level debug --log-prefix "IPTABLES
LOG OUTPUT "


I don't have any rule in the Firewall which ACCEPT traffic to the Router.
But, when I try to access the Router from INTERNET, the Router will log that
packet which the Firewall should DROP!!!

If I try to ping the router from INTERNET, the Router will log:

Jun 23 15:01:23 Router kernel: IPTABLES FILTER DROP INPUT IN=3Deth0 OUT=3D
MAC=3DXX SRC=3DA-HOST DST=3DRouter PROTO=3DICMP
8
Jun 23 15:01:23 Router kernel: IPTABLES FILTER DROP OUTPUT IN=3D OUT=3Deth0
SRC=3DRouter DST=3DA-HOST PROTO=3DICMP


It gets even more strange if I also log the traffic which the Firewall
should DROP, i.e. last rule in the FORWARD chain on the Firewall is:

iptables --append -j LOG --log-level debug --log-prefix "IPTABLES DROP
FORWARD "

The Firewall will log:

Jun 23 15:07:59 Firewall kernel: IPTABLES DROP FORWARD IN=3Deth3 OUT=3Deth0
SRC=3DRouter DST=3DA-HOST PROTO=3DICMP

eth0 is connected to INTERNET and eth3 is connected to the Router. Shouldn't
it be the other way around? The Firewall should of course DROP this packet
(the default policy is to DROP packets).


What could be wrong? Do I have to upgrade to the latest version of iptables
and the Linux kernel?


Yours sincerely,

Christian Ericsson




