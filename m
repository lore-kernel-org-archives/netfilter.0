From: <dtrott@mailshell.com>
Subject: vpn between networks with private ip network segment conflicts
Date: Wed, 28 May 2003 01:32:20 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054110740.3ed474140ea8c@www.mailshell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: drew.einhorn@starband.net
Cc: netfilter@lists.netfilter.org

If:
- You Don't need to access the whole remote network
  (just a limited number of servers)
- Those servers don't clash with anything on your local network 
  or its not too painful to move one or two hosts 
  so they don't clash.

You may be able to kludge it with some proxy arping.

You will need to have:
- Both routers on non clashing addresses.
- Both routers proxy arp for the other one.
- Your local router will have to proxy arp for all the
  servers you wish to access.
- You will need to SNAT all outgoing VPN traffic to your 
  local routers IP (to avoid conflicts on the remote lan).

Reverse local and remote for access in the oposite direction.

Note: I have not tested all this together, the closest I 
have tried is:

My home network uses:

10.1.100.0/24

My work network uses:

10.1.0.0/16

I proxy arp the subnet on the router at work, but my home router doesn't
need to proxy arp or SNAT because the netmask is smaller and there are no
conflicts on the work LAN. 


This will save you having to mess with the DNS, but to be honest I think 
the least painful route (in the long run) is just to re-number one of 
the networks. 

This is especially true if you are planing to do anthing with
MS networking, because MS networking really doesn't like NAT.


David


PS If bi-directional access is not required you may be able to 
SNAT to a virtual IP (per some of the other posts), this will save
the remote router from needing to proxy arp.


Drew Einhorn Wrote:
> My LAN uses network segments 192.168.0.0/24, 192.168.1.0/24, etc.
> So does the remote network I need to vpn to (probably using some flavor
> of pptp).
>
> Is there an odd nat variant that will solve this problem.
> Probably need to do some kind of dns transformation on each side.

> Is there any easy solution.  Perhaps it would be easier (but not easy)
> to get the network segments renumbered on one end or the other.
>
> -- 
> Drew Einhorn <drew.einhorn@starband.net>


