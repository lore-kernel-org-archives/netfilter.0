From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Port forwarding error
Date: Wed, 02 Mar 2005 12:07:23 +0100
Message-ID: <42259E6B.2050802@mnemon.de>
References: <110c784405030102077fa30d3e@mail.gmail.com>	<42244EE2.5000206@mnemon.de>
	<110c78440503010945afcfa69@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <110c78440503010945afcfa69@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
=20
Hi,

basically this ruleset should work, but you should write ACCEPT insted
of accept.

One issue. You don't pot the IPs, but I think, that your squid box has
a private IP address and e.g. $POPSERVER has a "real" - not RFC1918 -
address. If so, someone must do NAT on the packages. This is probably
your firewall. If you have a dial-up connection (dsl or the like) this
is done automatically by pppd or whatever software is responsible. But
if this is a static line, you might have to configure it manually.

| [Quote] You can do it this way. Remember, that only NEW packages
| (with SYN set) will hit this rule. Next step is to allow these
| connection in FORWARD chain (assuming the policy id DROP or
| REJECT). [/Quote] and

The reason is, that only NEW packages go through nat PREROUTING, the
rest is done by the state-machine (ip_conntrack). So all packets of a
connection, except the first, don't traverse nat PREROUTING. They will
be DNATed automagically. But all these packets go through FORWARD.
Well, you already found a realy good tutorial. By reading it
carefully, you will see the whole stuff.

|
| [Quote] And don't forget to allow ICMP "Destination Unreachable" :)
|  [/Quote]

YOU can live without that messages, basically. But it's really bad for
the internet itself. Disallowing these messages will break PATH MTU
among others (meaning that more and more packets will be
fragmented,...). Last month there was a discussion about ICMP on this
list, showing the good, nice and bad messages.

|
| Why is this sooo??? Why we need the above two rules.
|
| And for the rules for pop, smtp and dns forwarding what i
| understood from the diagram (tables_traverse.jpg) of
| (http://iptables-tutorial.frozentux.net/) - We got a packet from
| network - We done NAT PREROUTING - We FORWARDED the packet - We
| done NAT POSTROUTING - The packet agains flow the interface Am i
| right???????

Yes.

|
| Below is my final rules script based on your help
|
| Thanks
|
-=20
-------------------------------------------------------------------------=
----------
|  #!/bin/sh
|
| # Flushing the chains iptables -F iptables -F -t nat
|
| # Allow icmp destination unreacable iptables -A INPUT -p icmp -m
| icmp --icmp-type destination-unreachable -j ACCEPT

May be your box generates these messages too, so you should allow
outgoing messages.

|
| # Rules for Squid iptables -A INPUT -p tcp -s $LAN_ADDRESS/$NETMASK
| --dport 3128 -m state --state NEW,ESTABLISHED,RELATED -j accept
| iptables -A OUTPUT -p tcp -d $LAN_ADDRESS/$NETMASK --sport 3128 -m
| state --state ESTABLISHED,RELATED -j accept

This is LAN side of life. To communicate with web-servers on the
internet you need additionally something like:

iptables -A OUTPUT -p tcp --dport 80 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --sport 80 -m state --state
ESTABLISHED,RELATED -j ACCEPT

|
| # Enabling POP3 Forwarding iptables -A PREROUTING -t nat -d squidip
| -p tcp --dport 110 -j DNAT --to $POPSERVER iptables -A FORWARD -p
| tcp --dport 110 -d $POPSERVER -m state --state
| NEW,ESTABLISHED,RELATED -j ACCEPT iptables -A FORWARD -p tcp
| --sport 110 -s $POPSERVER -m state --state ESTABLISHED,RELATED -j
| ACCEPT iptables -t nat -A POSTROUTING -p tcp --dport 110 -d
| $POPSERVER -j SNAT --to $SQUIDIP
|
| # Enabling SMTP Forwarding iptables -A PREROUTING -t nat -d squidip
| -p tcp --dport 25 -j DNAT --to $SMTPSERVER iptables -A FORWARD -p
| tcp --dport 25 -d $SMTPSERVER -m state --state
| NEW,ESTABLISHED,RELATED -j ACCEPT iptables -A FORWARD -p tcp
| --sport 25 -s $SMTPSERVER -m state --state ESTABLISHED,RELATED -j
| ACCEPT iptables -t nat -A POSTROUTING -p tcp --dport 25 -d
| $SMTPSERVER -j SNAT --to $SQUIDIP
|
| # Enabling DNS Forwarding iptables -A PREROUTING -t nat -d squidip
| -p udp --dport 53 -j DNAT --to $DNSSERVER iptables -A FORWARD -p
| udp --dport 53 -d $DNSSERVER -m state --state
| NEW,ESTABLISHED,RELATED -j ACCEPT iptables -A FORWARD -p udp
| --sport 53 -s $DNSSERVER -m state --state ESTABLISHED,RELATED -j
| ACCEPT iptables -t nat -A POSTROUTING -p udp --dport 53 -d
| $DNSSERVER -j SNAT --to $SQUIDIP

Should work. One issue is left - the loopback interface. This is a
must and looks something like:

iptables -I INPUT -i lo -j ACCEPT
iptables -I OUTPUT -o lo -j ACCEPT

Otherwise some of your local processes will not work correctly or at all.

HTH, have a nice time

J=F6rg

- --
- -----------------------------------------------------------------------
mnemon
J=F6rg Harmuth
Marie-Curie.Str. 1
53359 Rheinbach

Tel.: (+49) 22 26  87 18 12
Fax:  (+49) 22 26 87 18 19
mail: harmuth@mnemon.de
Web:  http://www.mnemon.de
PGP-Key: http://www.mnemon.de/keys/harmuth_mnemon.asc
PGP-Fingerprint: 692E 4476 0838 60F8 99E2  7F5D B7D7 E48E 267B 204F
- -----------------------------------------------------------------------
Diese Mail wurde vor dem Versenden auf Viren und andere sch=E4dliche
Software untersucht. Es wurde keine malizi=F6se Software gefunden.

This Mail was checked for virusses and other malicious software before
sending. No malicious software was detected.
- -----------------------------------------------------------------------

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
=20
iD8DBQFCJZ5rt9fkjiZ7IE8RAlfbAJ9vG+K5Y4xuIvTph2qmQ3Dtu659iQCfRETV
EB8mzcSIejBLiMjTnSAotDw=3D
=3DyH9Y
-----END PGP SIGNATURE-----



