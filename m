From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: traceroute
Date: Wed, 30 Jun 2004 22:51:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088628661.1755.59.camel@anduril.intranet.cartel-securite.net>
References: <2E314DE03538984BA5634F12115B3A4E62E80C@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2E314DE03538984BA5634F12115B3A4E62E80C@email1.mitretek.org>
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
To: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter <netfilter@lists.netfilter.org>

Le mer 30/06/2004 =E0 17:21, Piszcz, Justin Michael a =E9crit :
> I do not know where you are getting your info from, but it is clearly
> incorrect.

From the source code, I guess, just like I did.

You have two type of ICMP handling. On one hand hand, you have
request/response ICMP stuff : echo, timestamp, netmask and info. Theses
messages are handled with state NEW for request and state ESTABLISHED
for answer. So an ICMP echo request has NEW state and related ICMP echo
reply is ESTABLISHED. A lonely ICMP echo reply is INVALID. On the other
hand, you have ICMP errors, that have RELATED state as long as kernel is
able to find to which conntrack entry they belong. Otherwise, they're
INVALID.

So, if you don't allow ICMP with NEW state in INPUT chain, then no one
will be able to ping you.

See /usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_icmp.c file.

So you're simply wrong.

> I do not allow any ICMP explicitly and I have never had a problem
> using NAT or similar.

And if you're able to ping anyway, it means you have a rule that
implicitly accepts thoses packets, and then should read your ruleset
again.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

