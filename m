From: "Thhoep" <thhoep@gmx.de>
Subject: Re: Iproute2 and fwmark usage
Date: Fri, 9 Jan 2004 21:09:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004101c3d6ec$7801b6b0$1684188d@Kiste>
References: <001401c3d63b$e9ebdff0$1684188d@Kiste> <20040109164718.GB24304@cannon.eng.us.uu.net> <001d01c3d6cc$191fc210$1684188d@Kiste> <20040109173530.GC24304@cannon.eng.us.uu.net> <001601c3d6d0$b8198e10$1684188d@Kiste> <20040109194247.GD24304@cannon.eng.us.uu.net> <001101c3d6e3$cdf03e60$1684188d@Kiste> <20040109204745.GE24304@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

> Except if it's being dropped by conntrack... And remember, tcpdump sees
stuff
> before the stack does its thing to the packets.

is there a logical reason (besides some bug in the code) why it should drop
something? i thought (but aint sure) that the "demasquerading" happens right
in the prerouting, before the routing process, so that no routing rule in
the world could disturb it?

> An ICMP is not being sent for another ICMP. But I guess an ICMP for ping
> can be sent, though.

.. you made me think with that.. ;) but i've just tested it with http
requests. no icmp errors either.

> You got me there. Try to reduce the complexity of your setup (just bring
> up one ppp, remove the unnecessary tables and so forth) and retest again.
> If the test passes then add little by little to your setup. I'm sure
you'll
> find/locate the problem that way.

i just did it. killed all other ppp connections, there was just eth4 (the
local lan interface), ppp0 and a bunch of non-ip ethernet interfaces. but
the result was the same, and no mis-guided packages in either direction.

i've really no clue what to do now.

i will try to reproduce the configuration on another server here.


