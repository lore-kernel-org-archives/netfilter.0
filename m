From: BERTRAND =?iso-8859-1?Q?Jo=EBl?= <mt1@systella.fr>
Subject: Iptables, iproute and ?
Date: Fri, 18 Feb 2005 17:28:34 +0100
Message-ID: <20050218162834.GA6156@rayleigh.systella.fr>
Mime-Version: 1.0
Content-Disposition: inline
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

	Hello,

	I have installed a linux box that works as a router.

IP1 -- router 192.168.254.1 -- eth0 ------+
                                          |
IP2 -- router 192.168.1.1 ---- eth2 ---- Linux
                                          |
LAN 192.168.0.0/24 -- 192.168.0.128 eth 1 +

	I use a UltraSPARC 1E running linux 2.4.29 (official), iptables
	1.2.11-8 (debian) and iproute 20041019-3 (debian).

	IP1 is a public address used by all services and IP2 is only used by
	a intranet server (192.168.0.130).

	My configuration is :

Root kant:[/etc/init.d] > iptables -t nat -L -n -v
Chain PREROUTING (policy ACCEPT 3138 packets, 440K bytes)
 pkts bytes target     prot opt in     out     source destination         
    5   240 DNAT       tcp  --  *      *       0.0.0.0/0 192.168.254.1       tcp dpt:8000 to:192.168.0.130:8080 
    2   120 DNAT       tcp  --  *      *       0.0.0.0/0 192.168.1.1         tcp dpt:3000 to:192.168.0.130:3000 
    0     0 DNAT       tcp  --  *      *       0.0.0.0/0 192.168.1.1         tcp dpt:3001 to:192.168.0.130:3001 

Chain POSTROUTING (policy ACCEPT 1100 packets, 88283 bytes)
 pkts bytes target     prot opt in     out     source destination         
  769 36844 MASQUERADE  all  --  *      eth0    192.168.0.0/24 0.0.0.0/0           

Chain OUTPUT (policy ACCEPT 1093 packets, 87923 bytes)
 pkts bytes target     prot opt in     out     source
destination         
Root kant:[/etc/init.d] > iptables -t mangle -L -n -v
Chain PREROUTING (policy ACCEPT 75804 packets, 34M bytes)
 pkts bytes target     prot opt in     out     source destination         
   14   840 MARK       tcp  --  eth1   *       192.168.0.130 0.0.0.0/0           tcp spts:3000:3001 MARK set 0x1 
Chain INPUT (policy ACCEPT 36686 packets, 5703K bytes)
 pkts bytes target     prot opt in     out     source
destination         

Chain FORWARD (policy ACCEPT 38390 packets, 28M bytes)
 pkts bytes target     prot opt in     out     source
destination         

Chain OUTPUT (policy ACCEPT 41607 packets, 21M bytes)
 pkts bytes target     prot opt in     out     source
destination         

Chain POSTROUTING (policy ACCEPT 80045 packets, 49M bytes)
 pkts bytes target     prot opt in     out     source
destination         
Root kant:[/etc/init.d] > iptables -L -n -v
Chain INPUT (policy DROP 708 packets, 92617 bytes)
 pkts bytes target     prot opt in     out     source destination         
 5004 1196K ACCEPT     all  --  lo     *       0.0.0.0/0 0.0.0.0/0           
17851 2986K ACCEPT     all  --  *      *       0.0.0.0/0 192.168.254.1       
 5386  795K ACCEPT     all  --  *      *       0.0.0.0/0 192.168.0.128       
 7913  657K ACCEPT     tcp  --  *      *       0.0.0.0/0 192.168.1.1         tcp dpt:22 

Chain FORWARD (policy ACCEPT 38390 packets, 28M bytes)
 pkts bytes target     prot opt in     out     source destination         

Chain OUTPUT (policy ACCEPT 41759 packets, 21M bytes)
 pkts bytes target     prot opt in     out     source destination         
Root kant:[/etc/init.d] > ip rule show
0:      from all lookup local 
32764:  from all fwmark 0x1 lookup intranet 
32765:  from 192.168.1.1 lookup intranet 
32766:  from all lookup main 
32767:  from all lookup default 
Root kant:[/etc/init.d] > ip route show table intranet
default via 192.168.1.254 dev eth2 
Root kant:[/etc/init.d] > 

	I can make a ssh connection throw eth0 and eth2. eth0:8000 is
	forwarded by iptables to 192.168.0.130:8080 and it works. eth2:3000
	and 3001 are forwarded to 192.168.0.130:3000 and 192.168.0.130:3001.
	Iptables marks all packets that come from 192.168.0.130:3000 and
	192.168.0.130:3001. But why these packets are redirected to eth0 ?
	If I have understood the documentation, they should follow the
	intranet routing table... Any idea ?

	Regards,

	JKB



