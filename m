From: Thomas Carrie <thocar@free.fr>
Subject: bastille linux blocking all outgoing connection
Date: Sat, 19 Feb 2005 20:17:49 +0100
Message-ID: <cv836s$jqb$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi,

I've setup a iptables config using bastille-linux, I have only one 
network interface (eth0), I'm running debian sarge

If I have a look at the tables, it seems to me that outgoing connection 
(like wget http://apache.org) should be accepted, it not the case, does 
someone understand why ?

./bastille-firewall status
Chain INPUT (policy DROP 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source 
destination
     0     0 DROP       tcp  --  !lo    *       0.0.0.0/0 
127.0.0.0/8
     0     0 ACCEPT     all  --  lo     *       0.0.0.0/0 
0.0.0.0/0
     0     0 DROP       all  --  *      *       224.0.0.0/4 
0.0.0.0/0
  1053 90569 PUB_IN     all  --  eth+   *       0.0.0.0/0 
0.0.0.0/0
     0     0 DROP       all  --  *      *       0.0.0.0/0 
0.0.0.0/0

Chain FORWARD (policy DROP 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source 
destination
     0     0 DROP       all  --  *      *       0.0.0.0/0 
0.0.0.0/0

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source 
destination
   781  135K PUB_OUT    all  --  *      eth+    0.0.0.0/0 
0.0.0.0/0

Chain INT_IN (0 references)
  pkts bytes target     prot opt in     out     source 
destination
     0     0 ACCEPT     icmp --  *      *       0.0.0.0/0 
0.0.0.0/0
     0     0 DROP       all  --  *      *       0.0.0.0/0 
0.0.0.0/0

Chain INT_OUT (0 references)
  pkts bytes target     prot opt in     out     source 
destination
     0     0 ACCEPT     icmp --  *      *       0.0.0.0/0 
0.0.0.0/0
     0     0 ACCEPT     all  --  *      *       0.0.0.0/0 
0.0.0.0/0

Chain PAROLE (5 references)
  pkts bytes target     prot opt in     out     source 
destination
  1028 87089 ACCEPT     all  --  *      *       0.0.0.0/0 
0.0.0.0/0

Chain PUB_IN (3 references)
  pkts bytes target     prot opt in     out     source 
destination
     0     0 ACCEPT     icmp --  *      *       0.0.0.0/0 
0.0.0.0/0           icmp type 3
     0     0 ACCEPT     icmp --  *      *       0.0.0.0/0 
0.0.0.0/0           icmp type 0
     0     0 ACCEPT     icmp --  *      *       0.0.0.0/0 
0.0.0.0/0           icmp type 11
     6   329 PAROLE     tcp  --  *      *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:80
     0     0 PAROLE     tcp  --  *      *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:25
  1022 86760 PAROLE     tcp  --  *      *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:22
     0     0 PAROLE     tcp  --  *      *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:993
     0     0 PAROLE     tcp  --  *      *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:995
     0     0 DROP       icmp --  *      *       0.0.0.0/0 
0.0.0.0/0
    25  3480 DROP       all  --  *      *       0.0.0.0/0 
0.0.0.0/0

Chain PUB_OUT (3 references)
  pkts bytes target     prot opt in     out     source 
destination
   772  122K ACCEPT     all  --  *      *       0.0.0.0/0 
0.0.0.0/0

Thanks for your help


