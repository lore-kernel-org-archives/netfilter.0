From: Esteban <eribicic@sinectis.com>
Subject: fwmarks and policy routing
Date: 01 Mar 2003 19:14:53 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046556893.798.63.camel@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org



im tryin to do some policy routing in my server, ive got two GW (each
with one table, eth0 and eth1) and a default route (main ttable) to one
of them...im under kernel 2.4.20 and iproute 2.2.4..

when i try to do some policy routing with ip rule {from|to} 1.1.1.1
table X ,it works okay..(goes to the itnterface i want)..but when doing
with fwmark does not work..im doing this because i want my squid (wich
generate packets localy) balance the trafic as i want.

take a look:

root@debian:~# ip route ls
172.0.0.0/24 dev eth0  proto kernel  scope link  src 172.0.0.82 
172.0.0.0/24 dev eth1  proto kernel  scope link  src 172.0.0.81 
default via 172.0.0.1 dev eth0  src 172.0.0.82 

root@debian:~# ip route ls table eth1
default via 172.0.0.1 dev eth1  src 172.0.0.81 
root@debian:~# ip route ls table eth0
default via 172.0.0.1 dev eth0  src 172.0.0.82 
root@debian:~# 

root@debian:~# fping 172.0.0.1 
172.0.0.1 is alive
root@debian:~# 

root@debian:~# ip rule ls
0:      from all lookup local 
32755:  from all fwmark       13 lookup eth1  not work
32758:  from all fwmark        d lookup eth1  not work
32759:  from all fwmark        3 lookup eth1  not work 
32760:  from all fwmark        1 lookup eth1  not work
32761:  from all to 216.239.39.101 lookup eth1 works!
32762:  from all to 198.133.219.25 lookup eth1 works!
32764:  from 172.0.0.82 lookup eth0 
32765:  from 172.0.0.81 lookup eth1 
32766:  from all lookup main 
32767:  from all lookup default 
root@debian:~# 

root@debian:~# iptables -t mangle -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         

Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         
MARK       tcp  --  anywhere             anywhere           tcp dpt:pop3
MARK set 0xd 

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
root@debian:~# 

root@debian:~# lsmod 
Module                  Size  Used by    Not tainted
ipt_owner               1624   0  (unused)
ipt_MARK                 792   1  (autoclean)
iptable_mangle          2164   1  (autoclean)
iptable_nat            23160   0  (autoclean) (unused)
ip_conntrack           35456   1  (autoclean) [iptable_nat]
iptable_filter          1672   1  (autoclean)
ip_tables              14360   7  [ipt_owner ipt_MARK iptable_mangle
iptable_nat iptable_filter]
i810_audio             22184   0 
soundcore               3844   2  [i810_audio]
ac97_codec             10024   0  [i810_audio]
root@debian:~# 


