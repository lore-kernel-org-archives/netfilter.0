From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: traceroute
Date: Sun, 13 Jun 2004 16:53:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087138393.1891.14.camel@anduril.intranet.cartel-securite.net>
References: <1087134949.24620.61.camel@hand2.loc.gv.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1087134949.24620.61.camel@hand2.loc.gv.co.uk>
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
To: Prash <prashk@staff.btltd.net>
Cc: netfilter@lists.netfilter.org

Le dim 13/06/2004 =E0 15:55, Prash a =E9crit :
> A weird problem. See my rules below on the INPUT chain. I have NOT
> allowed 33434:33523 for traceroute on UDP but some people can and some
> people can't do a traceroute. Any ideas? Traceroute should be accepted
> only if I open 33434:33523 .. isn't it? Then why is it allowing some in.

There's a lot of way of performing a "traceroute". Speaking of classical
traceroute tools, you have two approaches :

	. the Unix traceroute that uses an UDP packet to a high port
	. the Windows traceroute that uses an ICMP echo

So, in your approach, you only block the Unix approach, not the Windows
one.

Moreover, one can perform traceroute using any type of message that will
trigger an answer on target, such as TCP SYN on open port. The only way
to detect a traceroute is to examine TTL and decide you block packets
with TTL under a given value, say your internal network depth. But I do
not think this to be a very good idea, has it may break legitimate
communications.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

