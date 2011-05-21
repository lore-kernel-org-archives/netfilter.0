From: netfilter@buglecreek.com
Subject: Re: FORWARD chain and Interfaces
Date: Sat, 21 May 2011 13:49:02 -0600
Message-ID: <1306007342.28169.1454496985@webmail.messagingengine.com>
References: <1305958205.10779.1454356989@webmail.messagingengine.com>
 <4DD7A0C5.1040200@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=message-id:from:to:mime-version:content-transfer-encoding:content-type:in-reply-to:references:subject:date; s=smtpout; bh=Es+g1P+UtFP8oUCTdHMEn8fTZeU=; b=SfjW5deZc1WvDR6i8rVldRaopvBUPVQrWcJ0Clzvis5otwX6GmUFOVBUtCDnHZGNSnZcLtRMiztyvOqPndQ0FVmxOhcaz3jj4UZgNq8zdzzqTIf5xnaekIbVTrNnSTqf9krytQDyrNkQ+njD5pt5ZR66aopTJoOBDKaXT1FzOPo=
In-Reply-To: <4DD7A0C5.1040200@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


On Sat, 21 May 2011 13:23 +0200, "Pascal Hambourg"
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>=20
> netfilter@buglecreek.com a =E9crit :
> > I have a firewall router box that I'm trying to write a ruleset for=
 that
> > accepts/blocks traffic from Network A to Network B.  I'm testing th=
e
> > rules on 3 virtual machines and will eventually deploy to productio=
n
> > hardware:
> >=20
> > Net A Machine Eth0 <-> Eth0 Firewall/Router Eth1 <-> Eth0 Net B Mac=
hine
> >       192.168.99.1     192.168.99.2   10.10.10.1     10.10.10.2
> >=20
> > I have the the following rules on the Firewall/Router as a test bef=
ore I
> > write rules with http, ssh etc:
> >=20
> > iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > iptables -A FORWARD -i eth0 -o eth1 -p icmp --icmp-type echo-reques=
t -s
> > 192.168.99.0/24 -d 10.10.10.0/24 -m state --state NEW -j ACCEPT
> > iptables -A FORWARD -p icmp --icmp-type echo-request -m state --sta=
te
> > NEW -j LOG --log-prefix "ICMP: "
> >=20
> > When I ping from 192.168.99.1 to 10.10.10.2 it does not work.  The =
log
> > rule logs the packet as IN=3DETH1 OUT=3DETH1.
>=20
>=20
> Can you describe the virtual network architecture ?
> Are all the three machines above virtual guests on a same physical ho=
st
> or is one of them the physical host ?
>=20
> Also, can you provide the routing table on the firewall/router as
> reported by route -n or ip route ?
>=20

Based on the comments left so far, it seems that my logic is correct in
the way I view the interfaces in the forward chain.  I guess unless
there is a reason I am missing I will assume that the issue has to do
with the way the virtual machines are setup.  As the other poster
suggested, I can develop the ruleset with out the references to the
interfaces and add them when the real hardware is in place and hopefull=
y
it will behave as I think it should.  At least I'll be able to get a
start on on the rules since it will be fast turnaround when the hardwar=
e
is in place.

As far as the virtual machines.  All three test systems are virtual.=20
They run RH5 using Mac with parallels.  The routing tables are below.=20
Keep in mind that this was thrown together just to test the rules.  I
manually added the GW on Net A and B machines and got ping to work from
A to B via the firewall/router with just forwarding enabled
(/proc/net/sys . . ).  Once ping worked with just forwarding enabled I
started writing the FORWARD rules as outlined above and got the
unexpected interface behavior as outlined in the original post.

Network A Machine-=20
Dest                    Gateway                 Genmask               =20
Iface
192.168.99.0      0.0.0.0                  255.255.255.0         eth1
0.0.0.0                198.168.99.2        0.0.0.0                   =20
eth1

=46irewall/Router Machine:
Dest                    Gateway                 Genmask               =20
Iface
10.10.10.0          0.0.0.0                  255.255.255.0         eth1
192.168.99.0      0.0.0.0                  255.255.255.0         eth0


Netowork B Machine
Dest                    Gateway                 Genmask               =20
Iface
10.10.10.0          0.0.0.0                  255.255.255.0         eth0
0.0.0.0                10.10.10.1            0.0.0.0                   =
=20
eth0
