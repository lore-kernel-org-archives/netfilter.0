From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: netfilter bypassed by nessus using UDP packets with source
	port 53
Date: Thu, 31 Mar 2005 15:27:01 +0200
Message-ID: <1112275621.5624.35.camel@anduril.intranet.cartel-securite.net>
References: <424ABB78.6060105@aquitaine.cci.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <424ABB78.6060105@aquitaine.cci.fr>
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
Content-Type: text/plain; charset="iso-8859-1"
To: grumpy <mathieu.delaplace@aquitaine.cci.fr>
Cc: netfilter@lists.netfilter.org

Le mercredi 30 mars 2005 =E0 16:45 +0200, grumpy a =E9crit :
> I'm using netfilter/iptables on my Debian woody box (kernel 2.6.11-5),
> and when I want to audit the security of this box with nessus, it tells m=
e :
> "It is possible to by-pass the rules of the remote firewall by sending
> UDP packets with a source port equal to 53.
> An attacker may use this flaw to inject UDP packets to the remote hosts,
> in spite of the presence of a firewall.
[...]
> It's quite annoying !

Have you checked if this alert is true, and not some false positive ? I
don't think so. I mean, if Nessus sends an UDP packet (any port), it
will get an ICMP port unreachable. That's typically the normal behaviour
of an unfiltered box. So Nessus thinks "OK, if there's a firewall
between me and this box, then this packet went through".


Speaking of your ruleset, what's the point of :

> -A INPUT -i eth0 -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP

Linux treats SYN/FIN packets as SYN ones, just as it should be on any
RFC compliant stack.

You ICMP rule is also quite bizarre. First, we can get your timestamp
looking at your SYN/ACK TCP options when querying port 22 or 3000.
Second, your rule implicitly accepts any ICMP paquets, even with INVALID
state... Why not instead having something like this :

-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -i eth0 -p icmp -m icmp --icmp-type 8

ICMP errors will be handled by RELATED state and ping will be accepted
(info and netmask requests are not answered by Linux).


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

