From: James <newsjn@dpmg.com>
Subject: DNATed packet not hitting FORWARD chain
Date: Mon, 22 Nov 2004 14:06:48 -0600
Message-ID: <9FB9C39FACF4034BB4AC7F89F2AEB0AB0159373A@win2k.aries.dpmg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

Hi,

I'm having some trouble getting DNAT to work properly.  I have a gateway
machine that has two different connections to the Internet, on eth1 and
eth2.  I'm trying to allow inbound port 1723 to be forwarded to an internal
PPTP server through both interfaces.  It works on eth2, but not eth1.
Here's what I've got:

Chain PREROUTING (policy ACCEPT 217K packets, 15M bytes)
 pkts bytes target     prot opt in     out     source
destination
   15   744 DNAT       tcp  --  eth2   *       0.0.0.0/0            $DSL_IP
tcp dpt:1723 to:192.168.0.167:1723
  127  7152 DNAT       tcp  --  eth1   *       0.0.0.0/0
$CABLE_IP   tcp dpt:1723 to:192.168.0.165:1723

Chain FORWARD (policy DROP 6 packets, 360 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 LOG        all  --  *      *       0.0.0.0/0
192.168.0.165      LOG flags 0 level 4
 508K  306M ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED
    0     0 ACCEPT     47   --  eth1   eth0    0.0.0.0/0
192.168.0.165      state NEW
    1    60 ACCEPT     tcp  --  eth2   eth0    0.0.0.0/0
192.168.0.167      tcp dpt:1723 state NEW

As you can see from the counters, the packets coming in from both interfaces
are hitting the DNAT rules, and so they should be rewritten correctly.
Then, it would seem that the packets rewritten for 192.168.0.165 get lost in
space - I added the LOG target as the first rule of the FORWARD chain just
to be sure, and no packets ever hit that rule.  Packets rewritten for
192.168.0.167 work fine, they hit the FORWARD chain and are accepted.

I though it might be the routing, so I checked:

gw:/home/james# ip ro get 192.168.0.165
192.168.0.165 dev eth0  src 192.168.0.1
    cache  mtu 1500 advmss 1460

Packets for 192.168.0.165 should be routed out eth0, which is different than
the eth1 they came in on, so they should hit the FORWARD chain, right?  Any
ideas on where the packets are going, since they aren't making it to the
FORWARD chain?  Where else can I look?

(This is only a part of my iptables ruleset, but I don't think the other
rules matter, at least until the packets are being logged by the first rule
in the FORWARD chain.  Let me know if you think differently and want to see
the whole ruleset.)

Thanks,

James


