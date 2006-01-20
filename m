From: "Yermo Lamers" <yml@dtlink.com>
Subject: Using iptables on a single NIC to map old IP addresses onto new.
Date: Thu, 19 Jan 2006 23:14:30 -0500 (EST)
Message-ID: <64484.207.192.181.138.1137730470.squirrel@secure.fieldpost.com>
Reply-To: yml@dtlink.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


I've got an old pipe connected to a couple of public servers. That pipe is
going dark.

I've got a new pipe from a new provider with a block of new IP addresses.

I'm trying to transition to the new IP block without shutting down the old
so I can have both up while the DNS changes propagate.

My thought is to set up a forwarder box using iptables to port forward the
old IP's to the new IP's.

Consider old network a.a.a.0 and new network b.b.b.0

I want to map all ports on a.a.a.2 to b.b.b.2 and all ports on a.a.a.3 to
b.b.b.3

Can something like this be done using iptables if I only have 1 NIC card
and I do not have a physically separate subnet?

----------------------------------------------------------------------------
DTLink Software                                 http://www.dtlink.com
              Internet Business Systems and Software
----------------------------------------------------------------------------


