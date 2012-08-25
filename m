From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Netfilter / IPTables Question
Date: Sat, 25 Aug 2012 16:48:14 -0400
Message-ID: <201208251648.15006.neal.p.murphy@alum.wpi.edu>
References: <!&!AAAAAAAAAAAYAAAAAAAAAOX6SiiIyH5Pl9vlxsZOj/nigAAAEAAAAKXCGN6FBIdCsHRvk6orE2gBAAAAAA==@thues.net>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAOX6SiiIyH5Pl9vlxsZOj/nigAAAEAAAAKXCGN6FBIdCsHRvk6orE2gBAAAAAA==@thues.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="windows-1252"
To: netfilter@vger.kernel.org

On Saturday 25 August 2012 14:40:54 Markus Th=FCs wrote:
> Here=92s the System:
>=20
> Eth0:     disabled
> Eth1:     disabled
> Eth2:     IP: 10.0.0.4                         Subnet:
> 255.255.255.128              Gateway / DNS: 10.0.0.1
>                                             Interface to the Internet
> Eth3:     IP: 192.168.0.6                  Subnet: 255.255.254.0   Ga=
teway
> / DNS: the System itself                           This is the IP
> Interface to the schools Network (for Students and stuff)
> Eth4:     IP: 192.168.2.2                  Subnet 255.255.254.0    Ga=
teway
> / DNS: the System itself                           This is the IP
> Interface to the Network of the schools Administration
> Eth5:     IP: 172.16.0.20                  Subnet: 255.255.255.0   Ga=
teway
> / DNS: none                                                  This is =
the
> IP Interface to the Cisco Management Network
>=20
> ...
>
> What should be done:                  Requests from
> Eth2:                     None, cause this is only the Interface towa=
rds
> the Internet
>                                                                Reques=
ts
> from Eth3:                     Could reach every Port on the Host its=
elf,
> but none in the other networks, and every user from the net should ha=
ve
> access to DNS, NTP and UDP / TCP Port 3339 on every Host on the inter=
net;
> everything else should be accessable via squid
>                                                                Reques=
ts
> from Eth4:                     Mail Services (IMAP, POP3, SMTP) and D=
NS,
> NTP is permitted to be accessed on the net, everything else should be
> accessable via squid
>                                                              =20
> Eth5:                                                    Not accessab=
le
> from any Network, only be the host itself.
>=20
>=20
> Is this possible?
>=20
> Thanks in advance,
>=20
> Markus

You need to clarify some of your conditions. Except for eth5, these rul=
es=20
should do just what you asked (but maybe not what you want). I assumes =
eth5 is=20
accessable from hosts on *that* LAN, but no other.

These rules may not be perfect, so review them carefully.

N



# Allow all existing conns through. If the first packet of a conn can't=
 get
# through, the rest won't either.
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED -j ACCEPT

# The rest of the controls restrict NEW, RELATED and other conns.


                                                  =20
Eth2:    None, cause this is only the Interface towards the Internet

# Drop all non-ESTABLISHED traffic to the host
iptables -A INPUT -i eth2 -j DROP

# Drop all non-ESTABLISHED traffic to internal nets
iptables -A FORWARD -i eth2 -j DROP



Eth3:    Could reach every Port on the Host itself, but none in the
         other networks, and every user from the net should have access
         to DNS, NTP and UDP / TCP Port 3339 on every Host on the
         internet; everything else should be accessable via squid

# Reach every port on the host itself
iptables -A INPUT -i eth3 -j ACCEPT

# Allow new conns to DNS on internet
iptables -A FORWARD -i eth3 -o eth2 -p udp --dport 53 \
    -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth3 -o eth2 -p tcp --dport 53 \
    -m state --state NEW -j ACCEPT

# Allow new conns to NTP on internet
iptables -A FORWARD -i eth3 -o eth2 -p udp --dport 123 \
    -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth3 -o eth2 -p tcp --dport 123 \
    -m state --state NEW -j ACCEPT

# Allow new conns to port 3339 on internet
iptables -A FORWARD -i eth3 -o eth2 -p udp --dport 3339 \
    -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth3 -o eth2 -p tcp --dport 3339 \
    -m state --state NEW -j ACCEPT

# Drop all other non-ESTABLISHED traffic
iptables -A FORWARD -i eth3 -j DROP



Eth4:    Mail Services (IMAP, POP3, SMTP) and DNS, NTP is permitted to
         be accessed on the net, everything else should be accessable
         via squid=20

# Allow new POP3 conns to internet
iptables -A FORWARD -i eth4 -o eth2 -p tcp --dport 110 \
    -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth4 -o eth2 -p udp --dport 110 \
    -m state --state NEW -j ACCEPT

# Allow new IMAP2/4 conns to internet
iptables -A FORWARD -i eth4 -o eth2 -p tcp --dport 143 \
    -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth4 -o eth2 -p udp --dport 143 \
    -m state --state NEW -j ACCEPT

# Allow new IMAP3 conns to internet
iptables -A FORWARD -i eth4 -o eth2 -p tcp --dport 220 \
    -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth4 -o eth2 -p udp --dport 220 \
    -m state --state NEW -j ACCEPT

# Allow new IMAPS conns to internet
iptables -A FORWARD -i eth4 -o eth2 -p tcp --dport 993 \
    -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth4 -o eth2 -p udp --dport 993 \
    -m state --state NEW -j ACCEPT

# Allow new SMTP conns to internet
iptables -A FORWARD -i eth4 -o eth2 -p tcp --dport 25 \
    -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth4 -o eth2 -p udp --dport 25 \
    -m state --state NEW -j ACCEPT

# Allow new DNS conns to internet
iptables -A FORWARD -i eth4 -o eth2 -p udp --dport 53 \
    -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth4 -o eth2 -p tcp --dport 53 \
    -m state --state NEW -j ACCEPT

# Allow new NTP conns to internet
iptables -A FORWARD -i eth4 -o eth2 -p udp --dport 123 \
    -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth4 -o eth2 -p tcp --dport 123 \
    -m state --state NEW -j ACCEPT

# Drop all other non-ESTABLISHED traffic
iptables -A FORWARD -i eth4 -j DROP


Eth5:    Not accessable from any Network, only be the host itself.

# I'll assume you meant not accessable from any *other* network
# in the universe.

# Allow all conns/traffic to/from this LAN
iptables -A INPUT -i eth5 -j ACCEPT

# Drop all forwarded traffic to and from eth5
iptables -A FORWARD -i eth5 -j DROP
iptables -A FORWARD -o eth5 -j DROP
