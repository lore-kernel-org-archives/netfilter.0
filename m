From: Jonathan Disher <jdisher@parad.net>
Subject: odd problem
Date: Tue, 7 Oct 2003 13:22:51 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0310071310090.4398@pasiphae.parad.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have an interesting setup (diagrammed below), and I'm having problems
with one of my rewrites.  Basically, I have three machines:

           [A0]      [A1]    [B0]       [B1]    [C0]       [C1]
+---+        +-------+          +-------+          +-------+         +---+
| I |--------| Box A |----------| Box B |----------| Box C |---------| I |
+---+        +-------+          +-------+          +-------+         +---+

[A0] is Box A's eth0, which is hooked up to a DSL circuit, address
1.1.1.1.
[A1] is eth1 (172.16.0.2), which is crossovered to B0 (172.16.0.3).
[B1] is Box B's eth1 (172.17.0.2), crossovered to C0 (172.17.0.3).
[C1] is Box B's eth1, which is connected on our office T1 (2.2.2.2).

Box C also has an alias of 1.1.1.1 (Box A's eth0 IP) on loopback.

Box C's default route is out its gateway on [C1].  Box A's default route
is
out the DSL modem on [A0].

Basically, I am trying to have a packet come into Box A destined for
1.1.1.1, where its destination is rewritten (as a DNAT) to 172.16.0.3.
It then gets forwarded to Box B, where it is again rewritten (as another
DNAT) to 172.17.0.3.  It gets passed to Box C, where it is rewritten back
to 1.1.1.1, and since Box C has that address as an alias, acted upon.
However, I want the response to go out [C1].

Currently, the first two rewrites are working (verified), and I'm fairly
sure the third is working.  Box C is even putting a response out [C1].
However, the source address of that response is 172.17.0.3.  I've tried
putting an SNAT in to rewrite any source address of 172.17.0.3 to 1.1.1.1,
but it isn't working.

Any ideas would be greatly appreciated.  I know it's ugly, but I need
it to work this way.  All three machines are running stock 2.4.22 kernel.

Thanks!

-j

