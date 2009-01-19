From: Thomas Creutz <thomas.creutz@gmx.de>
Subject: multi-wan with conn-mark
Date: Mon, 19 Jan 2009 17:45:36 +0100
Message-ID: <4974AE30.2000008@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020309040706050405070306"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------020309040706050405070306
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I try to setup a multi-wan connection with 2 dsl links. I followed the 
example from

http://andthatsjazz.org/lartc/MultihomedLinuxNetworking.html

so it set up my pppd-peers without the defaultroute option and 
configured the routing like it is descripted on the page above.

Routing on the local machine is ok.. I can reach all destinations.

my problem is, that with this configuration nat not working any more - 
so I cant reach the internet over a client which is connected on eth0 or 
eth1. Also the routing between the local networks is not working.

Any idea what is wrong?

i attached the configuration as text file or use 
http://pastebin.com/f1b9b33ab

Thanks for your help,
Thomas


--------------020309040706050405070306
Content-Type: text/plain;
 name="config.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="config.txt"

IF_INET1="ppp0"
IF_INET1_IP=`/sbin/ifconfig ${IF_INET1} 2>/dev/null | grep "inet" | grep -v inet6 | awk {'print $2'} | cut -d ':' -f2`

IF_INET2="ppp1"
IF_INET2_IP=`/sbin/ifconfig ${IF_INET2} 2>/dev/null | grep "inet" | grep -v inet6 | awk {'print $2'} | cut -d ':' -f2`

iptables -A POSTROUTING -t mangle -j MARK --set-mark 1 -m state --state NEW -o $IF_INET1
iptables -A POSTROUTING -t mangle -j MARK --set-mark 2 -m state --state NEW -o $IF_INET2
iptables -A POSTROUTING -t mangle -j CONNMARK --save-mark -m state --state NEW
iptables -A PREROUTING -t mangle -j CONNMARK --restore-mark
iptables -A POSTROUTING -t nat -m mark --mark 1 -j SNAT --to-source $IF_INET1_IP
iptables -A POSTROUTING -t nat -m mark --mark 2 -j SNAT --to-source $IF_INET2_IP

proxy:~# LANG=C route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
217.0.116.46    0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
217.0.116.46    0.0.0.0         255.255.255.255 UH    0      0        0 ppp1
192.168.0.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
192.168.15.0    0.0.0.0         255.255.255.0   U     0      0        0 eth1
0.0.0.0         0.0.0.0         0.0.0.0         U     0      0        0 ppp0

proxy:~# ip route list
217.0.116.46 dev ppp0  proto kernel  scope link  src 84.169.89.45
217.0.116.46 dev ppp1  proto kernel  scope link  src 84.169.68.44
192.168.0.0/24 dev eth0  proto kernel  scope link  src 192.168.0.254
192.168.15.0/24 dev eth1  proto kernel  scope link  src 192.168.15.254
default
        nexthop dev ppp0 weight 1
        nexthop dev ppp1 weight 1

---------------------------------
complete iptables configuration
-----------------------------------------
Chain INPUT (policy DROP 8 packets, 2891 bytes)
 pkts bytes target     prot opt in     out     source               destination         
 2412  213K ACCEPT     0    --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED 
   14   890 ACCEPT     0    --  lo     *       0.0.0.0/0            0.0.0.0/0                                     
   12  2135 ACCEPT     0    --  eth0   *       192.168.0.1          0.0.0.0/0                                     
    1   229 ACCEPT     0    --  eth0   *       192.168.0.3          0.0.0.0/0                                     
    0     0 DROP       icmp -f  *      *       0.0.0.0/0            0.0.0.0/0                                     
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0           icmp type 8               
    0     0 ACCEPT     tcp  --  ppp0   *       0.0.0.0/0            0.0.0.0/0           tcp dpt:2222              
    0     0 ACCEPT     tcp  --  ppp1   *       0.0.0.0/0            0.0.0.0/0           tcp dpt:2222              
   15  2505 C_ADM      0    --  eth0   *       192.168.0.0/24       0.0.0.0/0                                     
    0     0 ACCEPT     tcp  --  eth0   *       192.168.0.0/24       0.0.0.0/0           tcp dpt:80                
    0     0 ACCEPT     tcp  --  eth0   *       192.168.0.0/24       0.0.0.0/0           tcp dpt:443               
    0     0 C_MAC      tcp  --  eth0   *       192.168.0.0/24       0.0.0.0/0           tcp dpt:3128              
    0     0 C_SQD      tcp  --  eth0   *       192.168.0.0/24       0.0.0.0/0           tcp dpt:3128              
   15  2505 ACCEPT     0    --  eth0   *       192.168.0.0/24       0.0.0.0/0                                     
   19  1639 ACCEPT     0    --  eth1   *       192.168.15.0/24      0.0.0.0/0                                     

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
  142  6816 TCPMSS     tcp  --  *      ppp1    0.0.0.0/0            0.0.0.0/0           tcp flags:0x06/0x02 TCPMSS clamp to PMTU 
    0     0 TCPMSS     tcp  --  *      ppp0    0.0.0.0/0            0.0.0.0/0           tcp flags:0x06/0x02 TCPMSS clamp to PMTU 
  224 16358 ACCEPT     0    --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED                
  182 10612 ACCEPT     0    --  eth0   *       192.168.0.1          0.0.0.0/0                                                    
    0     0 ACCEPT     0    --  eth0   *       192.168.0.3          0.0.0.0/0                                                    
    0     0 RETURN     0    --  eth0   eth1    192.168.0.0/24       192.168.15.0/24                                              
    0     0 C_MAC      0    --  eth0   ppp0    192.168.0.0/24       0.0.0.0/0                                                    
    0     0 C_MAC      0    --  eth0   ppp1    192.168.0.0/24       0.0.0.0/0                                                    
    0     0 C_FWD      0    --  eth0   *       192.168.0.0/24       0.0.0.0/0                                                    
    0     0 ACCEPT     0    --  eth1   eth0    192.168.15.0/24      192.168.0.0/24                                               
    0     0 ACCEPT     0    --  eth0   eth1    0.0.0.0/0            0.0.0.0/0           MAC XX:XX:XX:XX:XX:XX                
    0     0 ACCEPT     0    --  eth1   ppp0    192.168.15.0/24      0.0.0.0/0                                                    
    0     0 ACCEPT     0    --  eth1   ppp1    192.168.15.0/24      0.0.0.0/0                                                    
    0     0 ACCEPT     tcp  --  ppp0   eth0    0.0.0.0/0            192.168.0.3         tcp dpt:443                              
    0     0 ACCEPT     tcp  --  ppp0   eth0    0.0.0.0/0            192.168.0.1         tcp dpt:1723                             
    0     0 ACCEPT     47   --  ppp0   eth0    0.0.0.0/0            192.168.0.1                                                  

Chain OUTPUT (policy ACCEPT 2205 packets, 224K bytes)
 pkts bytes target     prot opt in     out     source               destination         
  110 32509 ACCEPT     0    --  *      lo      0.0.0.0/0            0.0.0.0/0           

Chain C_ADM (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain C_FWD (1 references)
 pkts bytes target     prot opt in     out     source               destination

Chain C_MAC (3 references)
 pkts bytes target     prot opt in     out     source               destination
    0     0 ACCEPT     0    --  *      *       0.0.0.0/0            0.0.0.0/0           MAC XX:XX:XX:XX:XX:XX
    0     0 ACCEPT     0    --  *      *       0.0.0.0/0            0.0.0.0/0           MAC XX:XX:XX:XX:XX:XX
    0     0 RETURN     0    --  *      *       0.0.0.0/0            0.0.0.0/0

Chain C_SQD (1 references)
 pkts bytes target     prot opt in     out     source               destination

-- MANGLE TABLE --
Chain PREROUTING (policy ACCEPT 418K packets, 190M bytes)
 pkts bytes target     prot opt in     out     source               destination
 2897  251K CONNMARK   0    --  *      *       0.0.0.0/0            0.0.0.0/0           CONNMARK restore

Chain INPUT (policy ACCEPT 237K packets, 86M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain FORWARD (policy ACCEPT 180K packets, 104M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 270K packets, 98M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain POSTROUTING (policy ACCEPT 430K packets, 200M bytes)
 pkts bytes target     prot opt in     out     source               destination
    8   582 MARK       0    --  *      ppp0    0.0.0.0/0            0.0.0.0/0           state NEW MARK set 0x1
   16   792 MARK       0    --  *      ppp1    0.0.0.0/0            0.0.0.0/0           state NEW MARK set 0x2
  202 12117 CONNMARK   0    --  *      *       0.0.0.0/0            0.0.0.0/0           state NEW CONNMARK save

-- NAT TABLE --
Chain PREROUTING (policy ACCEPT 21038 packets, 1419K bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DNAT       tcp  --  ppp0   *       0.0.0.0/0            0.0.0.0/0           tcp dpt:443 to:192.168.0.3:443
    0     0 DNAT       tcp  --  ppp0   *       0.0.0.0/0            0.0.0.0/0           tcp dpt:1723 to:192.168.0.1:1723
    0     0 DNAT       47   --  ppp0   *       0.0.0.0/0            0.0.0.0/0           to:192.168.0.1

Chain POSTROUTING (policy ACCEPT 4175 packets, 225K bytes)
 pkts bytes target     prot opt in     out     source               destination
    8   582 SNAT       0    --  *      *       0.0.0.0/0            0.0.0.0/0           MARK match 0x1 to:84.169.89.45
   16   792 SNAT       0    --  *      *       0.0.0.0/0            0.0.0.0/0           MARK match 0x2 to:84.169.68.44
    0     0 MASQUERADE  0    --  *      ppp0    0.0.0.0/0            0.0.0.0/0
    0     0 MASQUERADE  0    --  *      ppp1    0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT 10811 packets, 647K bytes)
 pkts bytes target     prot opt in     out     source               destination

--------------020309040706050405070306--
