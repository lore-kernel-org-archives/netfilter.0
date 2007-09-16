From: Benoit Boissinot <bboissin@gmail.com>
Subject: unexpected outgoing ACK
Date: Mon, 17 Sep 2007 01:38:43 +0200
Message-ID: <20070916233843.GG4987@ens-lyon.fr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <http://lists.netfilter.org/pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

This is on a machine sitting behind another firewall. It runs debian,
with debian linux-image-2.6.18-5-686  2.6.18.dfsg.1-13etch2.

Once in a while, we see some unexpected ACK+RST going out of the server
(the incoming SYN should have been dropped since the source port is not
explicitely allowed in INPUT): 

On Thu, Sep 13, 2007 at 09:02:12 +0200, logcheck system account wrote:
> Sep 13 08:35:09 kernel: IN= OUT=eth0 SRC=140.77.x.y DST=152.77.24.38 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=17699 DF PROTO=TCP SPT=54597 DPT=62603 WINDOW=952 RES=0x00 ACK RST URGP=0

On Sat, Sep 15, 2007 at 20:02:12 +0200, logcheck system account wrote:
> Sep 15 19:53:28 kernel: IN= OUT=eth0 SRC=140.77.x.y DST=61.29.145.234 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=28476 DF PROTO=TCP SPT=41636 DPT=2948 WINDOW=5840 RES=0x00 ACK RST URGP=0
> Sep 15 19:53:31 kernel: IN= OUT=eth0 SRC=140.77.x.y DST=61.29.145.234 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=43810 DF PROTO=TCP SPT=36437 DPT=2868 WINDOW=5840 RES=0x00 ACK RST URGP=0

On Sun, Sep 16, 2007 at 05:02:12 +0200, logcheck system account wrote:
> Sep 16 04:52:53 kernel: IN= OUT=eth0 SRC=140.77.x.y DST=221.206.165.157 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=41883 DF PROTO=TCP SPT=54608 DPT=1786 WINDOW=5840 RES=0x00 ACK RST URGP=0

iptables -v -L looks like this (mangle and nat are empty):
Chain INPUT (policy DROP 19 packets, 988 bytes)
 pkts bytes target     prot opt in     out     source               destination         
7060K 2416M ACCEPT     0    --  lo     *       0.0.0.0/0            0.0.0.0/0           
  200 17395 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0           
 264K   28M ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           tcp dpt:22 
1364K  917M ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           tcp dpt:25 
    1    40 ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           tcp dpt:53 
 282K   16M ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           tcp dpt:80 
 177K   44M ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           tcp dpt:443 
10377  917K ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           tcp spt:22 
 766K   56M ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           tcp spt:25 
 3532  644K ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           tcp spt:53 
 812K  154M ACCEPT     udp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           udp spt:53 
    0     0 ACCEPT     udp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           udp dpt:53 
 6686  508K ACCEPT     udp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           udp spt:123 
    0     0 ACCEPT     udp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           udp dpt:123 
41603 2569K ACCEPT     tcp  --  eth0   *       140.77.0.0/16        0.0.0.0/0           tcp dpt:1119 
 132K 9442K ACCEPT     tcp  --  eth0   *       140.77.0.0/16        0.0.0.0/0           tcp dpt:4030 
35174 4593K DROP       0    --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type BROADCAST 
 9876  316K DROP       0    --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type MULTICAST 
  530 26036 REJECT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           tcp dpt:8080 reject-with icmp-port-unreachable 
  132  6336 DROP       tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           multiport dports 135:139,445 
    0     0 DROP       udp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           multiport dports 135:139,445 
   18   936 LOG        0    --  *      *       0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4 

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy DROP 12 packets, 624 bytes)
 pkts bytes target     prot opt in     out     source               destination         
7060K 2416M ACCEPT     0    --  *      lo      0.0.0.0/0            0.0.0.0/0           
 2865  360K ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0           
 264K  172M ACCEPT     tcp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           tcp spt:22 
1210K   90M ACCEPT     tcp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           tcp spt:25 
    1    40 ACCEPT     tcp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           tcp spt:53 
 535K  775M ACCEPT     tcp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           tcp spt:80 
 232K  264M ACCEPT     tcp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           tcp spt:443 
28184 2609K ACCEPT     tcp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           tcp dpt:22 
1030K  989M ACCEPT     tcp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           tcp dpt:25 
 4235  251K ACCEPT     tcp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           tcp dpt:53 
    0     0 ACCEPT     udp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           udp spt:53 
 822K   62M ACCEPT     udp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           udp dpt:53 
 7017  533K ACCEPT     udp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           udp spt:123 
    0     0 ACCEPT     udp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           udp dpt:123 
33220 4951K ACCEPT     tcp  --  *      eth0    0.0.0.0/0            140.77.0.0/16       tcp spt:1119 
 103K   34M ACCEPT     tcp  --  *      eth0    0.0.0.0/0            140.77.0.0/16       tcp spt:4030 
   12   624 LOG        0    --  *      *       0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4 


related modules loaded:
iptable_mangle          2880  0
iptable_nat             7044  0
ip_nat                 16876  1 iptable_nat
ip_conntrack           49088  2 iptable_nat,ip_nat
nfnetlink               6680  2 ip_nat,ip_conntrack
ipt_LOG                 6112  2
xt_multiport            3264  2
ipt_REJECT              5248  1
ipt_addrtype            1952  2
xt_tcpudp               3136  61
iptable_filter          3104  1
ip_tables              13028  3
iptable_mangle,iptable_nat,iptable_filter
x_tables               13316  7
iptable_nat,ipt_LOG,xt_multiport,ipt_REJECT,ipt_addrtype,xt_tcpudp,ip_tables

anything obvious we missed, or is this a bug somewhere ?

regards,

Benoit
-- 
:wq

