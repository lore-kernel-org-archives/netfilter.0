From: grumpy <mathieu.delaplace@aquitaine.cci.fr>
Subject: Re: netfilter bypassed by nessus using UDP packets with source	port
 53
Date: Fri, 01 Apr 2005 08:59:03 +0200
Message-ID: <424CF137.6050905@aquitaine.cci.fr>
References: <424ABB78.6060105@aquitaine.cci.fr>
	<1112275621.5624.35.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1112275621.5624.35.camel@anduril.intranet.cartel-securite.net>
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



Cedric Blancher wrote:
> Le mercredi 30 mars 2005 =E0 16:45 +0200, grumpy a =E9crit :
>=20
>>I'm using netfilter/iptables on my Debian woody box (kernel 2.6.11-5),
>>and when I want to audit the security of this box with nessus, it tells=
 me :
>>"It is possible to by-pass the rules of the remote firewall by sending
>>UDP packets with a source port equal to 53.
>>An attacker may use this flaw to inject UDP packets to the remote hosts=
,
>>in spite of the presence of a firewall.
>=20
> [...]
>=20
>>It's quite annoying !
>=20
>=20
> Have you checked if this alert is true, and not some false positive ? I
> don't think so.=20

You are right, I do not know how to check this (by the way If you know
any documentation that would help, I would be glad to read it).

> I mean, if Nessus sends an UDP packet (any port), it
> will get an ICMP port unreachable. That's typically the normal behaviou=
r
> of an unfiltered box. So Nessus thinks "OK, if there's a firewall
> between me and this box, then this packet went through".

In that case nessus would think the packets it sent to port 1-65635
(except 22 and 3000) went through as well. Wouldn't it ?

>=20
>=20
> Speaking of your ruleset, what's the point of :
>=20
>=20
>>-A INPUT -i eth0 -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
>=20
>=20
> Linux treats SYN/FIN packets as SYN ones, just as it should be on any
> RFC compliant stack.

nessus told me something like that :
"the remote host does not discard TCP SYN packet which have FIN flag
set. This can allow an attacker to defeat your firewall rules set"

According to you, this is a false positive, thanks for your correction :)

>=20
> You ICMP rule is also quite bizarre. First, we can get your timestamp
> looking at your SYN/ACK TCP options when querying port 22 or 3000.

Yes, that's right, I have not thought about it.

> Second, your rule implicitly accepts any ICMP paquets, even with INVALI=
D
> state...=20

I have not thought about it either ...

> Why not instead having something like this :
>=20
> -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A INPUT -i eth0 -p icmp -m icmp --icmp-type 8
>=20
> ICMP errors will be handled by RELATED state and ping will be accepted
> (info and netmask requests are not answered by Linux).

Since, it is impossible to prevent somebody to get the timestamp (if I
am not mistaken), I think I will try this :)

(If you would know, I tried to prevent someone to get the timestamp
after nessus told me something like : "the remote host replies to icmp
timestamp requests, it allow an attacker to know about the time set one
the machine and defeat all you time based authentication system")

thanks a lot for all these information

regards
grumpy


