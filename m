From: Khanh Tran <khanh@slc.edu>
Subject: dual gateways
Date: Wed, 5 Feb 2003 11:21:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC64EBAE@EXCHANGE>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

I'm sure this is possible, but I just haven't gotten it to work right by
playing around with the settings.

I've got three NICs in the firewall box.  I've also got two routers that go
to the Internet via two separate lines (a T1 and a partial T3).  I've got my
default gateway set on the linux box to go out via the T3 and NAT setup for
my clients to route out via that interface.  I'd like to know if it's
possible to setup a failover route to redirect clients out the T1 should the
T3 not be available, even if the router is.  Here's the basic diagram:


                          (default route)
                          eth2 <---> |T3 Router| <---> Internet
LAN <---> eth1 |firewallBox|
                          eth1 <---> |T1 Router| <---> Internet


Khanh Tran
Network Operations
Sarah Lawrence College


