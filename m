From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: RELATED ICMP packets of type 3
Date: Fri, 11 Feb 2005 16:27:34 +0100
Message-ID: <1108135654.5565.62.camel@anduril.intranet.cartel-securite.net>
References: <200502111757.16352.e-boogie@yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200502111757.16352.e-boogie@yandex.ru>
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
To: Mikhail Zotov <e-boogie@yandex.ru>
Cc: netfilter@lists.netfilter.org

Le vendredi 11 f=E9vrier 2005 =E0 17:57 +0300, Mikhail Zotov a =E9crit :
> As far as I understand, it is safe to ACCEPT incoming
> packets of this sort.

As far as they're RELATED, you can assume theses packets to be
legitimate ones. So, yes it is safe to accept them. It is also necessary
to accept them if you want your IP stack to detect errors and be
functionnal. As an example, if you drop Fragmentation Needed packets
(type 3, code 4), you'll break PMTU Discovery...

> Is it safe to allow _outgoing_ packets of this kind?

For the same reason, yes, and for the sake of the Internet, do it. I'm
personnaly sick of theses dummy firewalls/admin who can't get ICMP
filtered correctly and break things, so you have to find workarounds all
the time. As an example, see why you have to adjust TCPMSS on PPPoE DSL
lines...

> Can an attacker make my machine generate such packets
> in order to obtain information about it?  (All new
> incoming packets are just DROPped.)

If NEW packets are droped, then IP packets are not evaluated, then you
most certainly won't have ICMP errors sent back...

Netfilter gives you a mecanism to identify legitimate ICMP errors using
conntrack. If you trust Netfilter conntrack, use it.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

