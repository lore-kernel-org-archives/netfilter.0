From: Dan Egli <dan@shortcircuit.dyndns.org>
Subject: Re: Port Forwarding
Date: Thu, 24 Apr 2003 11:26:20 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EA81E3C.5030405@shortcircuit.dyndns.org>
References: <091A6DF13847F44395B31658ED61C19C627C1E@yellowstone.medclaim.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <091A6DF13847F44395B31658ED61C19C627C1E@yellowstone.medclaim.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: "Brei, Matt" <mbrei@medclaiminc.com>
Cc: netfilter@lists.netfilter.org

Brei, Matt wrote:

> Hello all.
>
> I=92m using iptables on RH 8.0 to route and firewall my cable connection =

> to the rest of the lan. My problem is joining games (Ghost Recon) on=20
> ubi.com from behind the firewall. Ubi.com requires port 80 for http=20
> which works fine, port 6667 for chat which also works fine, and=20
> 40000-42000 for the game (I=92m assuming) which seems to be random when=20
> I run nmap on machines running the game with no firewall. Is there a=20
> way to allow one or multiple machines behind the firewall to join/host=20
> a game by forwarding the ports. I attached my iptables script that I=92m =

> currently using.
>
> Thanks,
>
> Matt
>
Shouldn't need anything that specific. The port forwarding is to allow=20
packets that origonate OUTSITE the system to be sent to a specific=20
computer. I'm on a cable modem at home and I play Unreal Tournament 2003=20
great with simple masquerading.

After reading your script, (which in my simple opinion is overly=20
complicated), the line:

> $IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_=
IP

would normally be enough. I use port forwarding for UT2003 only because I r=
un a game server behind the firewall, so I need to allow connections from t=
he inet to the server. But w/o the server, I have no need of port forwardin=
g. Naturally nmap won't see the ports because technically the port is not o=
pen. nmap only checks for a port that is (or at least appears to be) open a=
nd listening for connections. if I did not have port forward on, and I was =
in a UT2003 game and someone hit my inet IP on one of the game ports (7777 =
for example) they would get a ICMP_PORT_UNREACHABLE error (connection refus=
ed).=20

Are you on a static IP or a dynamic? I am on a dynamic and my Masquerading =
line: iptables -A POSTROUTING -s 192.168.0.0/255.255.255.0 -o eth1 -j MASQU=
ERADE=20

works grand. Cannot see why it would not work for you. Try disabling the po=
rt forwarding. Can you connect to a web site from a machine behind the fire=
wall? IF so there should be no reason I am aware of that you cannot connect=
 to the game server.

--- Dan





