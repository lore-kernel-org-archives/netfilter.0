From: michael@floog.net
Subject: Iptables/Iproute2/Load-Balancing 2 Broadband Connections
Date: Fri, 28 May 2004 08:17:03 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085757423.40b757ef671da@webmail.floog.net>
References: <40b742bf.c1.3d5a.1536727437@arbbs.net> <1085753919.14362.12.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1085753919.14362.12.camel@localhost>
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
To: netfilter@lists.netfilter.org

Has anyone on this list successfully load-balanced 2 broadband
connections using one linux routerbox with 3 NICS.

The setup I want to try is:

NIC1 - ISP 1 DSL PPPOE connection

NIC2 - ISP 2 DSL PPPOE connection

NIC3 - GATEWAY TO LAN

The LAN clients all have static IP addresses.
I don't want to manually assign each LAN client to one ISP connection or
the other.  I would like to set up the routerbox to take care of all
balancing tasks to optimize use of bandwidth provided by the two DSL
accounts.

I have spoken with tech. support at roaringpenguin.com and they confirm
that their dsl connection client software is capable of maintaining
multiple broadband connections.

I just can't find anyone who's actually done it before and knows
something about how to route the connections in conjunction with
iptables rules.  There's some pressure involved in trying this as, the
network is on demand 6 days a week.  So I won't have much time to run
tests and try different configurations.  Currently there are two LANs
built around the 2 different dsl connections; however, it is becoming
more and more apparent that the office will function much more
efficiently by joining the 2 LANs into one.

Any/all guidance is greatly appreciated.

Thanks for your time.

Mike



