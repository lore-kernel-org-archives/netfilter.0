From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Is my script good and secure?
Date: Mon, 15 Mar 2004 15:06:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079359597.2562.60.camel@anduril.intranet.cartel-securite.net>
References: <DIIE.000000E500002A8E@sbgit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DIIE.000000E500002A8E@sbgit.com>
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
To: netfilter@sbgit.com
Cc: netfilter@lists.netfilter.org

Le lun 15/03/2004 =E0 14:28, netfilter@sbgit.com a =E9crit :
> Is this a good and secure Firewall Script?

See below for comments.


> # Flushen, Deleting, Create#
> ################################################################
> iptables -F
> iptables -F -t nat
>=20
> iptables -F sperre

Flushing sperre chain is useless. It has already been flushed by prior
"iptables -F" that flush all chains, including user ones.

> iptables -X sperre
> iptables -N sperre

Why destroy the sperre chain to recreate it just after ?

> iptables -F sperre

Flushing (again) sperre chain here is useless, since it as just been
created, so is empty.

Theses two lines will just do the same, except for byte count that is
zeroed by chain deletion :

	iptables -F
	iptables -t nat -F

If counter zeroing is important to you, juste add :

	iptables -Z

However, when I write a script, I like to flush everything at startup so
I can launch my script whatever rules I can have. So I would do this :

	iptables -F
	iptables -X
	iptables -t nat -F
	iptables -t nat -X
	iptables -t mangle -F
	iptables -t mangle -X

	iptables -N sperre

> # first contact #
> #################
> iptables -A sperre -i eth1 -s ! 192.168.1.0/255.255.255.0 -j DROP      =
           # Drop everything how not comes from lokal LAN

This should be handled through reverse patch filtering, that check
source against your routing table. So, if a source that should be routed
via another interface than eth1 comes to it, then packet is destroyed.

> iptables -A sperre -i eth1 --dport
> 22,19,21,22,25,3389,1723,23000:23001 -j ACCEPT # Allow outbound only
> for specific ports

This rule won't work :

	--dport switch needs -p tcp or -p udp
	--dort has only one argument

Should be :

	iptables -A sperre -i eth1 -p tcp -m mport \
		--dports 22,19,21,22,25,3389,1723,23000:23001 \
		-j ACCEPT

> iptables -A sperre -i lo -s 127.0.0.1/255.0.0.0 -j ACCEPT =20
>                        # Allow everything from loopback

Note that you can have other sources on loopback. Suppose you ping your
eth1 address. Supposing it is 192.168.1.1, when you do :

	ping 192.168.1.1

You'll see 192.168.1.1 pinging 192.168.1.1 on lo. This very rule does
not accept this.

> iptables -A sperre -i eth0 -s 192.168.1.0/255.255.255.0 -j
> DROP                   # Drop everyting how comes fro outside to
> inside  with LAN IP's

Reverse path filtering will handle this fine.

	echo 1 > /proc/sys/net/ipv4/conf/all/rp_filters

> # acceptstuff #
> ###############
> iptables -A sperre -p tcp --dport 21 -j ACCEPT             # ftp=20
> iptables -A sperre -p tcp --dport 23001:23001 -j ACCEPT    # Battlefiel=
d Server

Check your range. There's not range here.

> iptables -A sperre -p tcp --dport 90 -j ACCEPT             # DVISE
> iptables -A sperre -p tcp --dport 80 -j ACCEPT             # HTTP
> iptables -A sperre -p tcp --dport 3389 -j ACCEPT           # VPN

VPN ? You mean Terminal Server I guess. I would accept Terminal Server
only through SSH redirection.

> # Antworten zulassen #
> ######################
> iptables -A sperre -m state --state ESTABLISHED,RELATED -j ACCEPT

This rule should be at the very begining for it's the rule that will
match most of the packets you'll handle. This is an optimisation.

> # activating sperre#
> #####################
> iptables -A INPUT -j sperre
> iptables -A FORWARD -j sperre

I don't think handling INPUT and FORWARD through the same chain is a
good idea, for you must not have the same needs for them. I mean this
will end in allowing stuff for INPUT that should not be, and the same
for FORWARD.

> iptables -P OUTPUT ACCEPT # output accept
> iptables -P OUTPUT ACCEPT -t nat

Not needed. You should not touch nat chain policies.

> # NAT #
> #######
[...]
> iptables -A PREROUTING -t nat -i eth0 -p 37  -j DNAT --to
> 192.168.1.220                   # VPN Server

IP proto 37 is not used for VPN. This rule is not needed.

> # Special Rules
> iptables -A INPUT -i eth0 -s 0/0 -p tcp --destination-port 25 -j ACCEPT
> iptables -A OUTPUT -o eth1 -s 0/0 -p tcp --destination-port 25 -j ACCEP=
T

Your firewall is to connect to internal host on TCP/25 ? Why have an
ACCEPT on output, you OUTPUT policy is ACCEPT ?

> iptables -A INPUT -i eth0 -s 192.168.1.0/24 -p tcp --destination-port 2=
5 -j ACCEPT

This rule will never get matched. It is impossible, and you stated it
before, that a 192.168.1.0/24 originated packet comes through eth0,k
since this network is attached to eth1.

> iptables -A OUTPUT -o eth0 -s 0/0 -p tcp --destination-port 25 -j ACCEP=
T

You do not need to have OUTPUT accept rules, since OUTPUT policy is
ACCEPT.

> iptables -A INPUT lo -p tcp --destination-port 10024 -j ACCEPT
> iptables -A OUTPUT -o lo -p tcp --destination-port 10024 -j ACCEPT
> iptables -A INPUT -i lo -p tcp --destination-port 10025 -j ACCEPT
> iptables -A OUTPUT -o lo -p tcp --destination-port 10025 -j ACCEPT

You specified you want want to accept all lo traffic. Why add rules ?

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

