From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Help with game server
Date: Sun, 22 Dec 2002 03:20:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212220320.12931.netfilter@newkirk.us>
References: <000001c2a95e$b93651c0$0501a8c0@underworld>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c2a95e$b93651c0$0501a8c0@underworld>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Mark Ryan <markryan@cfl.rr.com>, netfilter@lists.netfilter.org

On Saturday 21 December 2002 09:06 pm, Mark Ryan wrote:
> I have a linux firewall/router with iptables firewall script.  I am
> trying to run a Medal of Honor game server so that me and a friend can
> play.
>
> I only want him to be able to connect...however I can't seem to get
> the rules right.  It seems that Medal of Honor is using port 12203.  I
> have the following rules but they don't work:
>
> These to allow the connection:
> $IPTABLES -A INPUT -p udp -i $EXT_IF -s 68.99.10.xx -d 67.8.168.xx
> --dport 12203 -j ACCEPT
> $IPTABLES -A INPUT -p tcp -i $EXT_IF -s 68.99.10.xx -d 67.8.168.xx
> --dport 12203 -j ACCEPT
>
> These to forward to internal machine:
> $IPTABLES -t nat -A PREROUTING -p tcp --dport 12203 -i eth1 -s
> 68.99.10.xx -j DNAT --to 192.168.1.5:12203
> $IPTABLES -t nat -A PREROUTING -p udp --dport 12203 -i eth1 -s
> 68.99.10.xx -j DNAT --to 192.168.1.5:12203
>
> Am I doing something wrong?

If the connection won't work, then the answer is obviously "yes"... :^)

You have rules in INPUT for this.  If the connection is coming in at=20
67.8.168.xx and being DNATted in PREROUTING to a local machine, then the=20
INPUT chain will never see this traffic.  You seem to be constructing=20
things based on ipchains' handling - with iptables/netfilter PREROUTING=20
(mangle table prerouting chain, then nat table prerouting chain,=20
specifically) is the first to see a given packet, then a routing=20
decision is made, and the packet goes to either INPUT or FORWARD.=20
(either the firewall box itself or forwarding to another machine.)

[IMPORTANT]
Medal of Honor uses the Quake3 engine, so it will probably require the=20
Quake NAT helper in patch-o-matic, since the Q3 engine does things like=20
embedding IP addresses in the data itself, not just the header. (NAT=20
normally only affects packet headers)  This will require you to download=20
P-O-M, patch your kernel sources, and recompile your kernel and=20
iptables.  The only other solution is to have the server sit directly on=20
the public IP, IE the server and the firewall machine the same.

That said, the correct rules for DNATting would probably be:

$IPTABLES -t nat -A PREROUTING -p tcp --dport 12203 -i eth1 -j DNAT --to=20
192.168.1.5
$IPTABLES -t nat -A PREROUTING -p udp --dport 12203 -i eth1 -j DNAT --to=20
192.168.1.5
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 12203 -j ACCEPT
$IPTABLES -A FORWARD -p udp --dport 12203 -j ACCEPT

These five rules are likely all you'll need.  (well, along with the Q3=20
issue addressed above) Actually, you only need specific PREROUTING and=20
FORWARD rules for whatever the initial connection will be, then EST/REL=20
will handle everything else.  I don't know what protocol the initial=20
connection uses for MoH though.  (you can try it this way, and if it=20
works then "iptables -L -v -n" will show you which rule, udp or tcp,=20
caught the initial connections) =20

You can specify your friend's IP in the FORWARD rules above if you want=20
(and if his IP is static) with the "-s 68.99.10.xx", but specifying=20
destination IP is redundant, since the packet is already HERE, and=20
specifying the destination port for the DNAT target is unnecessary,=20
since it will by default use the same port as the packet started with,=20
and change only the destIP.  Also, if you test destIP in FORWARD rules,=20
be aware that the DNAT has already changed the destIP, so it will now be=20
192.168.1.5, NOT 67.8.168.x...

If you set things up where the game server is the firewall, directly=20
addressable at the public IP, then all you would need would be:

$IPTABLES -A INPUT -p tcp --dport 12203 -i eth1 -j ACCEPT
$IPTABLES -A INPUT -p udp --dport 12203 -i eth1 -j ACCEPT
$IPTABLES -A INPUT -m state --state ESTABLISHED, RELATED -j ACCEPT

and if you have DROP policy for output then
$IPTABLES -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
should allow the server to continue to communicate once an outside=20
machine makes the initial contact.

Obviously this assumes that you are running the Linux version of Medal of=
=20
Honor for the server...

> Mark

j


