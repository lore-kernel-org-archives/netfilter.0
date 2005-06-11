From: Vivek Dasmohapatra <vivek@etla.org>
Subject: possible proxy_arp problem : question about configuration
Date: Sun, 12 Jun 2005 00:10:34 +0100 (BST)
Message-ID: <Pine.LNX.4.62.0506112349300.22282@pike.pepperfish.net>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi: I have a 3 legged firewall setup that looks like this:


  DMZ-[ xx.xx.xx.64/26 ][eth2  eth1][ xx.xx.xx.0/26 ]-xx.xx.xx.1(isp router)
                        \         /                  |
                         \ eth0  /                   |
                          ~~~~~~~                    there's actually a
                         [10.100/16]                 hub/switch here, for
                                                     various reasons

eth2: xx.xx.xx.65
eth1: xx.xx.xx.2

now the isp router thinks the network is actually xx.xx.xx.0/25,
so the firewall is proxy-arping for the machines in the DMZ so
that the isp router will talk to the right box (ie the firewall)

This setup works in kernel 2.4

However in 2.6 (8 and 11) it does not.

packets get forwarded from eth2 to eth1, and they turn up on the wire
at eth1 (both outgoing and return packets are seen by tcpdump) but the 
incoming packets on eth1 for the .64 network are never seen by netfilter, 
not even in the raw table's PREROUTING chain.

This smells to me like a proxy arp problem to me.

/proc/sys/net/ipv4/ip_forward is 1

I've turned on /proc/sys/net/ipv4/conf/eth{1,2}/proxy_arp (1),
but this doesn't seem to help.

Can anybody give me any pointers here? Am I missing something obvious?
Have I misunderstood how the setup works in my kernel 2.4 firewall?
Is it something other than proxy arp?



