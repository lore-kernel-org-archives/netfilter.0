From: "Angelo Campitelli" <mirkin@sac.qld.edu.au>
Subject: Multipath Routing over NAT connections with 2.6 kernels
Date: Wed, 15 Mar 2006 23:14:39 +1000
Message-ID: <WorldClient-F200603152314.AA14392339@sac.qld.edu.au>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

With 2.4 Kernels i could multipath (route based) over two external 
connections with nat using a script as shown below.

              |---------|
              |         |------- (eth1) NAT
              |         |
LAN (eth0) ---|LINUX BOX|
              |         |------- (eth2) NAT
              |---------|



----------------- START OF SCRIPT ----------------
        # Flushing IP route table cache
        ip route flush cache

        # Establishing routing tables to providers
        ip route add $PROVIDERA_NET dev $EXTA_IF src $GATEWAYEXTA_IP table 
T1
        ip route add default via $PROVIDERGWA_IP table T1
        ip route add $PROVIDERB_NET dev $EXTB_IF src $GATEWAYEXTB_IP table 
T2
        ip route add default via $PROVIDERGWB_IP table T2

        # Ensure packets return via the correct interface
        ip route add $PROVIDERA_NET dev $EXTA_IF src $GATEWAYEXTA_IP
        ip route add $PROVIDERB_NET dev $EXTB_IF src $GATEWAYEXTB_IP

        # Set routing tables for IP
        ip rule add from $GATEWAYEXTA_IP table T1
        ip rule add from $GATEWAYEXTB_IP table T2

        # Load Balance traffic - route based
        ip route add default scope global nexthop via $PROVIDERGWA_IP dev 
$EXTA_IF weight 1 nexthop via $PROVIDERGWB_IP dev $EXTB_IF weight 1
----------------- END OF SCRIPT ----------------

My problem is with 2.6 kernels it seems to just drop packets. It i get 
kernel messages "Route sent us somewhere else".

I located the offending netfilter code:

  if (rt->u.dst.dev != out) {
   if (net_ratelimit())
    printk("MASQUERADE:"
           " Route sent us somewhere else.\n");
   ip_rt_put(rt);
   return NF_DROP;

It seems that the netfilter code was changed becaue it was possible for 
packets to go out the wrong interface due the routing relying on the route 
cache.

I found some artices discussing the issue.

http://www.ussg.iu.edu/hypermail/linux/net/0401.1/0028.html

However whats is the end result? How can achieve multipath routing over NAT 
connection as was possible in 2.4 kernels?.


Mirkin...




***************************** Disclaimer *****************************

The contents of this electronic message and any attachments are intended only for the addressee and may contain privileged or confidential information. They may only be used for the purposes for which they were supplied. If you are not the addressee, you are notified that any transmission, distribution, downloading, printing or photocopying of the contents of this message or attachments is strictly prohibited. The privilege of confidentiality attached to this message and attachments is not waived, lost or destroyed by reason of mistaken delivery to you. If you receive this message in error please notify the sender by return e-mail or telephone.



