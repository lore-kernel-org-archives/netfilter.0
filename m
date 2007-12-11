From: "Shaun Mccullagh" <Shaun.Mccullagh@xb.nl>
Subject: Re: IPIP decapsulation
Date: Tue, 11 Dec 2007 17:13:42 +0100
Message-ID: <CC12CD48AEDA1E4B8A3F626DA84E927209CD4BAA@ka-cap-sr-3601.xb.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Thanks to Pascal I have now got the whole system working for plain http

I've assembled a simple web director using Keepalived and iptables
consisting of
 
1 x Director at Location A 
1 x Real Server at Location B
1 x Real Server atLocation C

The locations are about 30 miles apart.

The Director periodically checks that Real Server B is available. If for
any reason it is not, all browser requests are forwarded to Real Server
C until Real Server B has been repaired.

All systems are running CentOS 4.5


                          Director A (62.101.52.99)
                              |    Virtual Server (62.101.52.106)
                              |
                              |
                              |
                              |
				Iptables Firewall (62.101.15.9)
                              |
			Real Server B (10.1.60.10)



Browser Requests are sent to the Web Director. Keepalived uses LVS to
encapsulate the datagrams using IPIP and tunnel them to an IPtables
Firewall. The Real Server B is on the same LAN as the iptables firewall

The IP Addresses used on the Director are

eth0: inet 62.101.52.99/28 brd 62.101.52.111 scope global eth0
          (this is the source address used by IPIP encapsulation)

      inet 62.101.52.106/28 scope global secondary eth0  
      (This is used as a Virtual Server IP)

LVS looks like this on the Director:

Prot LocalAddress:Port Scheduler Flags
  -> RemoteAddress:Port           Forward Weight ActiveConn InActConn
TCP  62.101.52.106:80 wlc persistent 86400
  -> 62.101.15.9:80               Tunnel  1      4          0         

IPtables firewall uses
    inet 62.101.15.9/24 scope global secondary eth1.11
    inet 10.1.60.5/24 eth0.60

A tunnel interface and tunnel were created on the firewall

tun0@NONE: <POINTOPOINT,NOARP,UP> mtu 1480 qdisc noqueue 
    link/ipip 62.101.15.9 peer 62.101.52.99
    inet 62.101.52.106 peer 62.101.52.255/32 scope global tun2


The ip command was used to create an endpoint for the tunnel created by
the Director. The kernel can then decapsulate the datagrams
 
ip tunnel add tun2 mode ipip remote 62.100.52.99 local 62.101.15.9

A tunnel interface for tun2 was then configured with a dummy endpoint: 

ifconfig tun2 62.101.52.106 pointopoint 62.100.52.255

This is required so that the kernel can use the source address
62.101.52.106 when 
it returns the datagrams to the client browser.


Iptables looks like this

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         
DNAT       tcp  --  0.0.0.0/0              dport 80 62.101.52.106
to:10.1.60.10

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
SNAT       all  --  10.1.60.10           0.0.0.0/0
to: 62.101.52.106


Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     tcp  --  0.0.0.0/0            10.1.60.10   dport 80

Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     ipencap  62.101.52.99          62.101.15.9
ACCEPT     tcp  --  62.101.52.106         62.101.15.9   dport 80

Finally the RP filter must be disabled on the tunnels for the tunnel to
work

sysctl -w net.ipv4.conf.tun2.rp_filter=0


Keepalived config looks like this

vrrp_instance VI_0 {
        state MASTER
        interface eth1
        lvs_sync_daemon_interface eth1
        track_interface {
                eth0
        }
        virtual_router_id 3
        priority 100
        advert_int 5
        authentication {
                auth_type PASS
                auth_pass xxxxxx
        }
        virtual_ipaddress {
                62.101.52.106/28 dev eth0
        }
        garp_master_delay 1
        smtp_alert
}



virtual_server 62.101.52.106 80 {
   delay_loop 20
   lb_algo wlc
   lb_kind TUN
   persistence_timeout 86400
   protocol TCP

  
   real_server 80.242.34.68 80 {
       weight 1
       # check real server on port 80, real server must respond
       # within 20 seconds
       TCP_CHECK {
          connect_port 80
          connect_timeout 20
       }
       # Real server will be removed from the pool after 3 retries
       nb_get_retry 3
       # Daemon will wait 2 seconds before retrying
       delay_before_retry 2
   }
  sorry_server 62.101.15.9 80
}

virtual_server 62.101.52.106 443 {
   delay_loop 20
   lb_algo wlc
   lb_kind TUN
   persistence_timeout 86400
   protocol TCP

   real_server 80.242.34.68 443 {
       weight 1
       # check real server on port 80, real server must respond
       # within 20 seconds
       TCP_CHECK {
          connect_port 80
          connect_timeout 20
       }
       # Real server will be removed from the pool after 3 retries
       nb_get_retry 3
       # Daemon will wait 2 seconds before retrying
       delay_before_retry 2
   }
  sorry_server 62.101.15.9 443
}





Op dit e-mailbericht is een disclaimer van toepassing, welke te vinden is op http://www.xb.nl/disclaimer.html



