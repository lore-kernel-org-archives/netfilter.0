From: Ben Greear <greearb@candelatech.com>
Subject: Question on MASQUERADE in virtual-router configuration.
Date: Thu, 19 Apr 2007 10:27:19 -0700
Message-ID: <4627A677.4080102@candelatech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello!

I'm trying to set up a fairly strange configuration, and having
no luck getting MASQUERADE to work.  My configuration requires
a few patches to the kernel to allow send-to-self and some
routing table upgrades.  I can post these if someone wishes to
see them.

I suspect that my virtual router configuration is confusing iptables
somehow, perhaps causing the -o [port] to be ignored,
so I'm looking for ideas on how to better debug this.

The configuration is a sort of virtual router.  You could think of it
similar to this, though I am actually using virtual devices similar
to the etun devices recently posted to netdev instead of real ethernet
devices with loopback cables.

One machine:
eth0 and eth1 act as a router (using policy based routing to filter
     on packets entering these interfaces to a certain routing table, etc)
eth2 and eth3 act as a second router.

eth1 is connected with loop-back cable to eth2 (subnet 2.2.2.0/24)

eth0 is connected to eth4 via loopback cable  (subnet 172.1.1.0/24)
eth3 is connected to the5 via loopback cable. (subnet 4.4.4.0/24)

I am trying to pass traffic from eth4 to eth5, through the virtual
routers.  This works fine without NAT, and I can sniff on each of the
interfaces and see expected traffic.

The traffic path is:  eth4 -- eth0 { router-1 logic } eth1 -- eth2 { router-2 logic } eth3 -- eth5

I then tried enabling NAT on eth1 so that all packets entering eth2 will appear
to come from eth1's IP address with a command similar to this:

iptables -A POSTROUTING -t nat -o eth1 -j MASQUERADE

When sniffing eth2, I still see the source IP as that of eth4, not eth1.

I also tried using the SNAT target with this command:
iptables -A POSTROUTING -t nat -o eth1  -j SNAT --to 2.2.2.2

The rule appears to be in the kernel, but it still does not work:

[root@lanforge-33-46 lanforge]# iptables -t nat -L -n
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
[root@lanforge-33-46 lanforge]# iptables -t nat -L -n
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  0.0.0.0/0            0.0.0.0/0           to:2.2.2.2


If anyone has any ideas how to better diagnose this, please let
me know.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


