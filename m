From: "Hard__warE" <hard__ware@hotmail.com>
Subject: Transparent Proxy server
Date: Wed, 12 Jun 2002 04:46:38 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <000901c21178$51fedc80$7b0010ac@dynamicaccess.lan>
Reply-To: "Hard__warE" <hard__ware@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org
Cc: eugenej@centratel.co.za

ok i have a TransParent Proxy server running Fine on my firewall / iptables
box

A Transparent Proxy is desiged for you to NOT have to set your Proxy in your
Internet Browser

have you checked you squid configuration ... here is some options you will
need ...

(this will allow al 80 traffic to get Proxied as well an Open Proxy for you
to establish connections from

Manually  ( ie go into your ICQ or Internet Browser and set the Proxy to use
Firewall box on Port 3128)


Copt the Script below and modify it to suit your squid configuration

-------------/etc/squid/squi.conf --Copy From Below This Line---------------

#squid.conf -  a very basic config file for squid

#Turn logging to it's lowest level
debug_options ALL,1

#defines a group (or Access Control List) that includes all IP
#addresses
acl manager proto cache_object
acl all src 0.0.0.0/0.0.0.0
acl localhost src 127.0.0.1/255.255.255.255
acl allowed_hosts src 172.16.0.0/255.255.0.0

#allow all sites to use connect to us via HTTP
http_access allow allowed_hosts
http_access deny all
http_access allow localhost
http_access deny manager

#allow all sites to use us as a sibling
icp_access allow allowed_hosts
icp_access deny  all
icp_access allow localhost

http_port 3128
httpd_accel_with_proxy on
cache_dir ufs /var/spool/squid 1024 16 256
cache_mem 32 MB
cache_effective_user squid
cache_effective_group squid
visible_hostname cache.dynamicaccess.net
httpd_accel_port 80
httpd_accel_host virtual
no_cache deny manager
httpd_accel_uses_host_header on
dns_nameservers 172.16.0.253
prefer_direct off
ie_refresh off


--------------END of Squid.conf--------------------------------


no other rules are needed unless you dont allow for Inernal Eth Device/IP
in  Input & Ouput
to talk back to the lan... make sure you allow these .. !!!

$IPTABLES -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j ACCEPT
$IPTABLES -A OUTPUT -o $INTIF -s $INTIP -d $INTNET -j ACCEPT
$IPTABLES -A OUTPUT -o $INTIF -s $EXTIP -d $INTNET -j ACCEPT


I USE this rule to Redirect my webtraffic to squid on the same box ...

$IPTABLES -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
REDIRECT --to-port 3128

how do i know it works , well do a    /sbin/iptables -L -n -v -t nat

and you will see if the packets have gone through the correct Chain ... :D

have a look ....

Chain PREROUTING (policy ACCEPT 6998 packets, 420K bytes)
 pkts bytes target     prot opt in     out     source
destination
   82  3904 REDIRECT   tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0          tcp dpt:80 redir ports 3128
    0     0 DNAT       tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0          tcp dpt:8888 to:172.16.0.111:80
    0     0 DNAT       tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0          tcp dpt:8860 to:172.16.0.111:443
    0     0 DNAT       udp  --  eth1   *       0.0.0.0/0
0.0.0.0/0          udp dpt:8860 to:172.16.0.111:443
    0     0 DNAT       tcp  --  eth1   *       0.0.0.0/0
192.168.0.212      tcp to:172.16.0.52
    0     0 DNAT       udp  --  eth1   *       0.0.0.0/0
192.168.0.212      udp to:172.16.0.52
    0     0 DNAT       tcp  --  eth1   *       0.0.0.0/0
192.168.0.213      tcp to:172.16.0.53
    0     0 DNAT       udp  --  eth1   *       0.0.0.0/0
192.168.0.213      udp to:172.16.0.53

Chain POSTROUTING (policy ACCEPT 110 packets, 21759 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 SNAT       all  --  *      eth1    172.16.0.52
0.0.0.0/0          to:192.168.0.212
    0     0 SNAT       all  --  *      eth1    172.16.0.53
0.0.0.0/0          to:192.168.0.213
  964 45950 SNAT       all  --  *      eth1    0.0.0.0/0
0.0.0.0/0          to:192.168.0.253





