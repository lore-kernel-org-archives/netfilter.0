From: "IZEM Farid" <Farid.IZEM@abxlogistics.fr>
Subject: RE: (no subject)
Date: Wed, 30 Jun 2004 22:15:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B732FD42D68974438C1451C73C1D030FD1EE89@FR92EX02.eu.abxlogistics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

Anthony,

Ok, I understand what you explain and I will test as soon as possible.
I always setup netfilter by adding rules to INPUT, OUTPUT, DNAT, .. =
chain.
But in this way, netfilter is very difficult to maintain.
In fact, my firewall has 2 networks interfaces and it's doing SNAT and =
DNAT.
SNAT and DNAT is properly working but difficult to administrate.=20
As it is already in production environnement, I have to plan when =
modificat

In your opinion, which solution is better:=20

	Create DNAT rules like=20
		Iptables -A PREROUTING -d 192.19.93.100 -j DNAT=20
				--to-destination 92.92.1.100
		Iptables -A FORWARD -i eth0 -o eth1 -p tcp -s 172.19.92.100=20
				-d 92.92.1.100 --dport 23 -j ACCEPT

	Or=20
		Iptables -A PREROUTING -s 172.19.92.100 -d 192.19.93.100
				--dport 23 - j DNAT --to-destination 92.92.1.100:23

=09
Thanks Anthony for you help.



Farid IZEM
Ing=E9nieur Syst=E8me Unix
Soci=E9t=E9 ABX Logistics France
48-50, route principale du port
92232 Gennevilliers
T=E9l. : 01-41-47-61-78
Email : farid.izem@abxlogistics.fr

-----Message d'origine-----
De=A0: netfilter-admin@lists.netfilter.org =
[mailto:netfilter-admin@lists.netfilter.org] De la part de Antony Stone
Envoy=E9=A0: mercredi 30 juin 2004 16:19
=C0=A0: netfilter@lists.netfilter.org
Objet=A0: Re: (no subject)

On Wednesday 30 June 2004 2:33 pm, IZEM Farid wrote:

> Hi all,
>
> I'm trying to customize my iptables rules.
> Let us imagine we have three hosts which users have to access:
> 	HOST1
> 	HOST2
> 	HOST3
>
> Is this configuration correct?
> 	Iptables -N HOST1_RULESETS
> 	Iptables -N HOST2_RULESETS
> 	Iptables -N HOST3_RULESETS
>
> In each new chain, I will add rules to accept connections to some =
services
> like telnet, ssh, IBM Client Access. And after, I will do this thing:
> 	Iptables -A FORWARD -i eth0 -o eth1 -j HOST1_RULESETS
> 	Iptables -A FORWARD -i eth0 -o eth1 -j HOST2_RULESETS
> 	Iptables -A FORWARD -i eth0  -o eth1 -j HOST3_RULESETS
>
> In fact, what I'm looking for is that I can organized my rules by =
hosts
> instead of adding all rules to all hosts in FORWARD chain ?
>
> With the configuration, I describe, will all rules in the =
HOSTX_RULESETS
> being check ?
>
> I think, it's correct but I'm not totally sure.

Yes, that looks fine to me - the only thing you need to remember is that =
the=20
first rule which matches, with an ACCEPT, DROP or REJECT target, will=20
determine the fate of the packet.

Organising rules into user-defined chains like this is fine with =
netfilter, if=20
it makes it easier for you to work with.

The only thing I would suggest changing about what you've written above =
is=20
that if the chain HOST1_RULESETS is supposed to be for packets going =
only to=20
HOST1, then your FORWARD rule jumping to that chain should only do so =
for=20
packets going to HOST1 (similarly for HOST2, HOST3 etc).

iptables -A FORWARD -i eth0 -o eth1 -d $HOST1 -j HOST1_RULESETS

That ensures that packets for HOST2, which cannot possibly match any of =
the=20
rules in HOST1_RULESETS, don't have to traverse all the way through the =
rules=20
before then getting a chance at HOST2_RULESETS.

PS: Don't forget a general rule allowing for the reply packets :)

Regards,

Antony.

--=20
I want to build a machine that will be proud of me.

 - Danny Hillis, creator of The Connection Machine

                                                     Please reply to the =
list;
                                                           please don't =
CC me.




