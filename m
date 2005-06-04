From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: 1:1 nat not working;
Date: Sat, 4 Jun 2005 16:04:18 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0506041550330.2474@darkstar.sysinfo.com>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Okay, I need help getting this working, I've wasted too much time on it 
and can't get it functional.

address mappings in /etc/hosts ;

# IP Block:  public-IP.16/28
# usable IPs are public-IP.18 - public-IP.30
# base subnet   public-IP.16
# broadcast address  public-IP.31
# subnet mask 255.255.255.240

public-IP.18     darkstar.    darkstar
public-IP.19     blackhole.   blackhole 
public-IP.20     nebula.      nebula 
public-IP.21     comet.       comet 
public-IP.22     orion.       orion 
public-IP.23     nova.        nova 
public-IP.24     quasar.      quasar
public-IP.25     pulsar.      pulsar
public-IP.26     venus.       venus
public-IP.27     saturn.      saturn
public-IP.28     jupiter.     jupiter
public-IP.29     mars.        mars
public-IP.30     pluto.       pluto


# IP Block:      192.168.80.16/28
# usable IPs are        192.168.80.17 - 192.168.80.30
# base subnet           192.168.80.16
# broadcast address     192.168.80.31
# subnet mask           255.255.255.240

# 192.168.80.17 unused          not.used
# 192.168.80.18 darkstar.    darkstar.net
192.168.80.19   blackhole.   blackhole.net
192.168.80.20   nebula.      nebula.net
192.168.80.21   comet.       comet.net
192.168.80.22   orion.       orion.net
192.168.80.23   nova.        nova.net
192.168.80.24   quasar.      quasar.net
192.168.80.25   pulsar.      pulsar.net
192.168.80.26   venus.       venus.net
192.168.80.27   saturn.      saturn.net
192.168.80.28   jupiter.     jupiter.net
192.168.80.29   mars.        mars.net
192.168.80.30   pluto.       pluto.net



firewall script includes <and tried in various combinations on these settings>;

#iptables -t nat -A PREROUTING -i eth1 -s 192.168.80.19 -j DNAT --to-destination 70.61.80.19
#iptables -t nat -A PREROUTING -i eth1 -s 192.168.80.20 -j DNAT --to-destination 70.61.80.20
#iptables -t nat -A PREROUTING -i eth1 -s 192.168.80.21 -j DNAT --to-destination 70.61.80.21
#iptables -t nat -A PREROUTING -i eth1 -s 192.168.80.22 -j DNAT --to-destination 70.61.80.22
#iptables -t nat -A PREROUTING -i eth1 -s 192.168.80.23 -j DNAT --to-destination 70.61.80.23
#iptables -t nat -A PREROUTING -i eth1 -s 192.168.80.24 -j DNAT --to-destination 70.61.80.24
#iptables -t nat -A PREROUTING -i eth1 -s 192.168.80.25 -j DNAT --to-destination 70.61.80.25
#iptables -t nat -A PREROUTING -i eth1 -s 192.168.80.26 -j DNAT --to-destination 70.61.80.26
#iptables -t nat -A PREROUTING -i eth1 -s 192.168.80.27 -j DNAT --to-destination 70.61.80.27
#iptables -t nat -A PREROUTING -i eth1 -s 192.168.80.28 -j DNAT --to-destination 70.61.80.28
#iptables -t nat -A PREROUTING -i eth1 -s 192.168.80.29 -j DNAT --to-destination 70.61.80.29
#iptables -t nat -A PREROUTING -i eth1 -s 192.168.80.30 -j DNAT --to-destination 70.61.80.30


iptables -t nat -A PREROUTING -i eth1 -s 70.61.80.19 -j DNAT --to-destination 192.168.80.19
iptables -t nat -A PREROUTING -i eth1 -s 70.61.80.20 -j DNAT --to-destination 192.168.80.20
iptables -t nat -A PREROUTING -i eth1 -s 70.61.80.21 -j DNAT --to-destination 192.168.80.21
iptables -t nat -A PREROUTING -i eth1 -s 70.61.80.22 -j DNAT --to-destination 192.168.80.22
iptables -t nat -A PREROUTING -i eth1 -s 70.61.80.23 -j DNAT --to-destination 192.168.80.23
iptables -t nat -A PREROUTING -i eth1 -s 70.61.80.24 -j DNAT --to-destination 192.168.80.24
iptables -t nat -A PREROUTING -i eth1 -s 70.61.80.25 -j DNAT --to-destination 192.168.80.25
iptables -t nat -A PREROUTING -i eth1 -s 70.61.80.26 -j DNAT --to-destination 192.168.80.26
iptables -t nat -A PREROUTING -i eth1 -s 70.61.80.27 -j DNAT --to-destination 192.168.80.27
iptables -t nat -A PREROUTING -i eth1 -s 70.61.80.28 -j DNAT --to-destination 192.168.80.28
iptables -t nat -A PREROUTING -i eth1 -s 70.61.80.29 -j DNAT --to-destination 192.168.80.29
iptables -t nat -A PREROUTING -i eth1 -s 70.61.80.30 -j DNAT --to-destination 192.168.80.30


iptables -t nat -A POSTROUTING -o eth0 -s 192.168.80.19 -j SNAT --to-source 70.61.80.19
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.80.20 -j SNAT --to-source 70.61.80.20
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.80.21 -j SNAT --to-source 70.61.80.21
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.80.22 -j SNAT --to-source 70.61.80.22
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.80.23 -j SNAT --to-source 70.61.80.23
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.80.24 -j SNAT --to-source 70.61.80.24
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.80.25 -j SNAT --to-source 70.61.80.25
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.80.26 -j SNAT --to-source 70.61.80.26
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.80.27 -j SNAT --to-source 70.61.80.27
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.80.28 -j SNAT --to-source 70.61.80.28
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.80.29 -j SNAT --to-source 70.61.80.29
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.80.30 -j SNAT --to-source 70.61.80.30

#iptables -t nat -A POSTROUTING -o eth0 -s 70.61.80.19 -j SNAT --to-source 192.168.80.19
#iptables -t nat -A POSTROUTING -o eth0 -s 70.61.80.20 -j SNAT --to-source 192.168.80.20
#iptables -t nat -A POSTROUTING -o eth0 -s 70.61.80.21 -j SNAT --to-source 192.168.80.21
#iptables -t nat -A POSTROUTING -o eth0 -s 70.61.80.22 -j SNAT --to-source 192.168.80.22
#iptables -t nat -A POSTROUTING -o eth0 -s 70.61.80.23 -j SNAT --to-source 192.168.80.23
#iptables -t nat -A POSTROUTING -o eth0 -s 70.61.80.24 -j SNAT --to-source 192.168.80.24
#iptables -t nat -A POSTROUTING -o eth0 -s 70.61.80.25 -j SNAT --to-source 192.168.80.25
#iptables -t nat -A POSTROUTING -o eth0 -s 70.61.80.26 -j SNAT --to-source 192.168.80.26
#iptables -t nat -A POSTROUTING -o eth0 -s 70.61.80.27 -j SNAT --to-source 192.168.80.27
#iptables -t nat -A POSTROUTING -o eth0 -s 70.61.80.28 -j SNAT --to-source 192.168.80.28
#iptables -t nat -A POSTROUTING -o eth0 -s 70.61.80.29 -j SNAT --to-source 192.168.80.29
#iptables -t nat -A POSTROUTING -o eth0 -s 70.61.80.30 -j SNAT --to-source 192.168.80.30


besides a few blacks to the input chain, everything is set to accept, and we show;

# iptables -t nat -vnL
Chain PREROUTING (policy ACCEPT 8090 packets, 506K bytes)
  pkts bytes target     prot opt in     out     source               destination
     0     0 DNAT       all  --  eth1   *       70.61.80.19          0.0.0.0/0           to:192.168.80.19
     0     0 DNAT       all  --  eth1   *       70.61.80.20          0.0.0.0/0           to:192.168.80.20
     0     0 DNAT       all  --  eth1   *       70.61.80.21          0.0.0.0/0           to:192.168.80.21
     0     0 DNAT       all  --  eth1   *       70.61.80.22          0.0.0.0/0           to:192.168.80.22
     0     0 DNAT       all  --  eth1   *       70.61.80.23          0.0.0.0/0           to:192.168.80.23
     0     0 DNAT       all  --  eth1   *       70.61.80.24          0.0.0.0/0           to:192.168.80.24
     0     0 DNAT       all  --  eth1   *       70.61.80.25          0.0.0.0/0           to:192.168.80.25
     0     0 DNAT       all  --  eth1   *       70.61.80.26          0.0.0.0/0           to:192.168.80.26
     0     0 DNAT       all  --  eth1   *       70.61.80.27          0.0.0.0/0           to:192.168.80.27
     0     0 DNAT       all  --  eth1   *       70.61.80.28          0.0.0.0/0           to:192.168.80.28
     0     0 DNAT       all  --  eth1   *       70.61.80.29          0.0.0.0/0           to:192.168.80.29
     0     0 DNAT       all  --  eth1   *       70.61.80.30          0.0.0.0/0           to:192.168.80.30

Chain POSTROUTING (policy ACCEPT 1488 packets, 95181 bytes)
  pkts bytes target     prot opt in     out     source               destination
     0     0 SNAT       all  --  *      eth0    192.168.80.19        0.0.0.0/0           to:70.61.80.19
     0     0 SNAT       all  --  *      eth0    192.168.80.20        0.0.0.0/0           to:70.61.80.20
     0     0 SNAT       all  --  *      eth0    192.168.80.21        0.0.0.0/0           to:70.61.80.21
     0     0 SNAT       all  --  *      eth0    192.168.80.22        0.0.0.0/0           to:70.61.80.22
    11   726 SNAT       all  --  *      eth0    192.168.80.23        0.0.0.0/0           to:70.61.80.23
    12   740 SNAT       all  --  *      eth0    192.168.80.24        0.0.0.0/0           to:70.61.80.24
     0     0 SNAT       all  --  *      eth0    192.168.80.25        0.0.0.0/0           to:70.61.80.25
     0     0 SNAT       all  --  *      eth0    192.168.80.26        0.0.0.0/0           to:70.61.80.26
     0     0 SNAT       all  --  *      eth0    192.168.80.27        0.0.0.0/0           to:70.61.80.27
     0     0 SNAT       all  --  *      eth0    192.168.80.28        0.0.0.0/0           to:70.61.80.28
     0     0 SNAT       all  --  *      eth0    192.168.80.29        0.0.0.0/0           to:70.61.80.29
     0     0 SNAT       all  --  *      eth0    192.168.80.30        0.0.0.0/0           to:70.61.80.30

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source               destination


which almost makes it appear to be functioning, but, it's an illusion.

Since my internal interface <now eth0 to work with established standards> is also my MX recorded in public DNS, I had to munge a route/nic on the external interface just to keep e-mail flowing ifconfig'ed an eth0:1 and set a host route to it.

lsmod reports these tables related modules;

ipt_multiport            664  11
iptable_mangle          2072   0  (unused)
iptable_nat            15438   1
ipt_limit                856   1
ipt_state                504 110
ipt_recent              7908   0  (unused)
ipt_LOG                 3416   6
ipt_conntrack           1016   0  (unused)
ip_conntrack_ftp        3888   0  (unused)
ip_conntrack_irc        3024   0  (unused)
ip_conntrack           19236   7  [iptable_nat ipt_state ipt_conntrack ip_conntrack_ftp ip_conntrack_irc]
iptable_filter          1644   1
ip_tables              12416  11  [ipt_multiport iptable_mangle iptable_nat ipt_limit ipt_state ipt_recent ipt_LOG ipt_conntrack iptable_filter]


ny help is appreciated.

Thanks,


Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:
                         http://
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCoglFst+vzJSwZikRAiLpAJ9D2ghrDUnVPLS4+FkNxIpkxNR5hACfQdzU
Xdu0Ri7L5X32N1UqeHD68h4=
=hzkk
-----END PGP SIGNATURE-----

