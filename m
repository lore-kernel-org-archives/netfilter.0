From: "GoMi" <gomi@perezoso.net>
Subject: IPP2P module not capturing p2p traffic at all,  but it seems to be working!!
Date: Fri, 30 Jan 2004 18:42:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAQ9p4DPXbskyUcfRAQ4WF9MKAAAAQAAAAOspcUu9lN0KBjn1nIUpeJgEAAAAA@perezoso.net>
References: <200401301523.31643.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401301523.31643.Antony@Soft-Solutions.co.uk>
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

Hi there folks :) I installed the ipp2p module v0.5a (i had 0.4 as well)
to classify p2p traffic.

I have it loaded and working:

Module                  Size  Used by    Not tainted
ipt_ipp2p               2656   2

And i have the CONNMARK module to mark traffic:

  iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
     iptables -t mangle -A PREROUTING -m mark ! --mark 0 -j ACCEPT
     iptables -t mangle -A PREROUTING -p tcp -m ipp2p --ipp2p -j MARK
--set-mark 2
     iptables -t mangle -A PREROUTING -p tcp -m ipp2p --ipp2p-data -j
MARK --set-mark 2

	OTHER MARKING DONE FOR INTERACTIVE TRAFFIC

     iptables -t mangle -A PREROUTING -m mark --mark 0 -j MARK
--set-mark 2
  iptables -t mangle -A PREROUTING -j CONNMARK --save-mark

I have the qdiscs attached with HTB (working fine) and filters to
classify marks (also working)

But the outcome of a iptables -t mangle -L -n -v -x shows this for
ipp2p:

    pkts      bytes target     prot opt in     out     source
destination
   14097  4339998 CONNMARK   all  --  *      *       0.0.0.0/0
0.0.0.0/0          CONNMARK restore
   10067  4144428 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          MARK match !0x0
       6      504 MARK       icmp --  *      *       0.0.0.0/0
0.0.0.0/0          MARK set 0x4
       0        0 MARK       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          ipp2p v0.5a --ipp2p MARK set 0x2
       0        0 MARK       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          ipp2p v0.5a --ipp2p-data MARK set 0x2
      14      912 MARK       udp  --  *      *       0.0.0.0/0
0.0.0.0/0          udp dpt:53 MARK set 0x1
     434    20812 MARK       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:80 MARK set 0x1
       0        0 MARK       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:25 MARK set 0x2
    3522   169036 MARK       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpts:0:1024 MARK set 0x1
      10     2198 MARK       udp  --  *      *       0.0.0.0/0
0.0.0.0/0          udp dpt:!53 MARK set 0x2
       5      240 MARK       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:1863 MARK set 0x1
       0        0 MARK       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:1214 MARK set 0x2
       2       80 MARK       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp spt:80 MARK set 0x5
     471    22600 MARK       all  --  *      *       0.0.0.0/0
0.0.0.0/0          MARK match 0x0 MARK set 0x2
    4030   195570 CONNMARK   all  --  *      *       0.0.0.0/0
0.0.0.0/0          CONNMARK save

Any one with an idea why the hell is not recognizing traffic at all??
Thank you!!



