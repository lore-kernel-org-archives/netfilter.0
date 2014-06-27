From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Sub: NAT issue in netfilter
Date: Fri, 27 Jun 2014 11:50:17 +0200
Message-ID: <53AD3E59.2030602@plouf.fr.eu.org>
References: <CAJQ3KZXNSCgV0mRx6jDwWk85sJRFY5pKKFJbLuzaEmW1kzFAfg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJQ3KZXNSCgV0mRx6jDwWk85sJRFY5pKKFJbLuzaEmW1kzFAfg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Kamal Kumar <malkarikamalkumar@gmail.com>
Cc: netfilter@vger.kernel.org

Kamal Kumar a =E9crit :
>=20
> Below is my exact scenario -> Network 1 wants to communicate with
> Network 2 using NAT enabled router with two ethernet interfaces
> eth0 (192.168.1.1) and eth1 (192.168.2.1).
>=20
> |    Network 1    |---| NAT Router |---|     Network 2   |
> (192.168.1.0/24)   ^                  ^     (192.168.2.0/24)
>                              |                  |
>              eth0(192.168.1.1)   eth1(192.168.2.1)
>=20
> What I did is as mentioned below.
>=20
> Step1: I am applying the following command "iptables -t nat -A
> POSTROUTING -s 0.0.0.0/0 -d 0.0.0.0/0 -o eth1 -j SNAT --to 192.168.2.=
1"
> in nat router.

Note : "-s 0.0.0.0/0 -d 0.0.0.0/0" is useless as it is the default.

> Step2: Started initiating traffic(ICMP) from network 1 to network 2
> and using wireshark I observed source ip of traffic from network 1
> being translated to ip 192.168.2.1 in nat router.

What kind of ICMP traffic ? Continuous echo requests + replies (aka
"ping") ?

> Step3: With traffic from network 1 to network 2 in PROGRESS I am
> flushing the nat table using the command "iptables -t nat -F".

Oh, I misunderstood your first message. I thought you meant by "nat
table" the connection tracking table used by NAT to store information
about the existing connections (aka conntrack entries).

> Now as there is no rule the source ip of traffic from network 1
> should not be translated to ip 192.168.2.1 (which is my requirement),
> but it is being translated.

As Neal wrote, only packets creating a new connection (=3D conntrack
entry) go through the chains of the nat table. Packets belonging or
related to an existing connection receive the same NAT mapping that was
applied to the first packet by the nat rules, in order not to break the
connection.

However, the notion of "connection" for ICMP trafic may not be very
clear. For ICMP echo traffic (aka "ping"), a new conntrack entry is
created by an ICMP echo-request packet with a given ID ; all subsequent
ICMP echo-request or echo-reply packets with the same source-destinatio=
n
pair and ID are assigned to this conntrack entry. In the past with olde=
r
kernels, I observed that the conntrack entry was deleted after seeing
the reply, but not any more. The conntrack entry just expires after a
time-out following the last seen packet. The default time-out is 30s.

> What should I do to fullfill my requirement.

After flushing the nat rules, you must flush the conntrack table (or
just delete the corresponding entries) with the "conntrack" utility fro=
m
conntrack-tools :

conntrack -F

You can also disable conntrack and NAT on incoming packets with the
target NOTRACK in the "raw" table :

iptables -t raw -A PREROUTING -j NOTRACK
