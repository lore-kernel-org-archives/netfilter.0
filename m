From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Interesting article about punching holes in firewalls...
Date: Tue, 19 Dec 2006 12:05:02 +0100
Message-ID: <1166526302.12238.12.camel@anduril.intranet.cartel-securite.net>
References: <45860240.2040102@riverviewtech.net>
	<1166426813.8007.10.camel@anduril.intranet.cartel-securite.net>
	<4587B400.6080206@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4587B400.6080206@rtij.nl>
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
To: Martijn Lievaart <m@rtij.nl>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>, Grant Taylor <gtaylor@riverviewtech.net>

Le mardi 19 d=E9cembre 2006 =E0 10:42 +0100, Martijn Lievaart a =E9crit :
> One can think about spoofed ICMP errors, but there really is not a lot=20
> we can do about that. (And for tcp they SHOULD be ignored anyhow. OTOH=20
> an atacker can spoof a RST packet.)

Yes, true. But that's bound to the protocol. And our firewall has to
show a minimum compliance to it. There's a few papers to read around on
ICMP spoofing based DoS.

> I do assume in all this that the only ICMP traffic matching RELATED are=20
> true ICMP errors (afair host/net unreachable and fragmentation needed).=20

They should. Check is done on ICMP payload which contains header of
original packet that raised the error. Inverting this header allows you
to browse conntrack table and see if it fits one existing state. If so,
it's considered as valid and it's flaged RELATED, if not, it's INVALID.
But the thing is we can't do much more...
On (good) idea was to check TCP sequence number when applicable, but
it's limited to TCP. Better than nothing however.

> If this also opens up say ICMP redirect[1] we may have a slight problem.

An ICMP redirect should not come from an outer network. So, as you imply
below, this issue would be limited to bridges.

> It is possible netfilter does this to accomodate bridging setups. Anyone=20
> can comment on this? If this opens up the connection for any other ICMP=20
> traffic, I think that's a bug. But I cannot imagine netfilter does this,=20
> anyone know for sure?

We also have a protocol problem here. However, as Pascal stated before,
you can explicitly deny ICMP redirects.

As a more general matter, ICMP filtering is tricky:

	. ICMP filtering can (and do) break connectivity: PPPoE users
	  with broken PMTUD knows about it...
	. ICMP messages authentication is weak.

On one hand we have a protocol we have to implement because we need it
for IP to work smoothly, and on the other hand, it's quite easy to
abuse. And we have to cope with it.

> [1] redirect in Linux is also sanity checked, so the risk is not even=20
> that great, but still.

echo 0 > /proc/sys/net.ipv4/conf/all/accept_redirects
echo 0 > /proc/sys/net.ipv4/conf/all/send_redirects


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

