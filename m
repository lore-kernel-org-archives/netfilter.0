From: Mohan Khurana <mkhurana@andrew.cmu.edu>
Subject: equalize on iproute2
Date: Sun, 29 Sep 2002 09:30:33 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.44L-027.0209290930190.1180-100000@unix4.andrew.cmu.edu>
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

I am still looking to create a good load balancing solution.  I have an
equalize with two nexthops in my iproute2 configuration.

I tried checking to see which routes come up by using "ip route get".
This is interesting, if I look up a certain IP address, it will choose one
of the nexthop lines, and give me the appropriate gateway that it is
routing on.  This is great.

I want to understand more about how this works.  If I run ip route get
again, on the same destination IP, it will return with the same gateway
every time.  If I run it with a different destination IP, it gives me the
other gateway, telling me that it's doing something like a round robin
selection (I have both metrics set to 1).  This is great, but now I
wonder, how long it take until it stops giving me the same IP for a
destination?  Can I manually tell it to "flush" it's recollection of
source-gateway-destination mappings?

I think this can be used with SNAT to provide for load balancing on two
connections.  The next thing I want to look at is how equalize works when
one of the internet connections fails, or more impotantly, doesn't route
to certain parts of the internet.  Would I need to write something to
manually update metrics?  Or take out the equalize statement completely
and add a standard default route for the connection that is up?

Hmmmmm...

thanks much,

mohan



