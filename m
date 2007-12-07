From: "Shaun Mccullagh" <Shaun.Mccullagh@xb.nl>
Subject: IPIP decapsulation
Date: Fri, 7 Dec 2007 16:21:01 +0100
Message-ID: <CC12CD48AEDA1E4B8A3F626DA84E927209CD49CD@ka-cap-sr-3601.xb.local>
References: <20071207235514.592f568c@penpal4u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
In-Reply-To: <20071207235514.592f568c@penpal4u.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: John Donath <John.Donath@xb.nl>

Hi,

I'm trying to a assemble a simple web director consisting of a Director
at Location A, one Real Server at Location B and one Real Server at
Location C

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



The idea is Browser Requests are sent to the Web Director. This then
encapsulates the datagrams using IPIP and tunnels them to the IPtable
Firewall which is on the same LAN as Real Server B

I've setup a tunnel on the IP Tables firewall so that it can return the
datagrams to the client browser with the same source address as the
Director

The IP Addresses used on the Director are

eth0: inet 62.101.52.99/28 brd 62.101.52.111 scope global eth0
      inet 62.101.52.106/28 scope global secondary eth0  
      (This is used as a Virtual Server IP)

Ipvsadm looks like this on the Director:

Prot LocalAddress:Port Scheduler Flags
  -> RemoteAddress:Port           Forward Weight ActiveConn InActConn
TCP  62.101.52.106:80 wlc persistent 86400
  -> 62.101.15.9:80               Tunnel  1      4          0         

IPtables firewall uses
    inet 62.101.15.9/24 scope global secondary eth1.11
    inet 10.1.60.5/24 eth0.60

and

tun0@NONE: <POINTOPOINT,NOARP,UP> mtu 1480 qdisc noqueue 
    link/ipip 62.101.15.9 peer 62.101.52.99
    inet 62.101.52.106 peer 62.101.52.255/32 scope global tun2

This almost works.

The problem is I cannot figure out how to get the IPtables firewall to
forward the decapsulated datagrams to Real Server B. I believe this can
be done with mangling but I can't quite figure this out.

Please could someone explain how to do this?

Many thanks

Shaun


Here is my current NAT table

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         
DNAT       tcp  --  0.0.0.0/0            62.101.15.9  dport 80
to:10.1.60.10

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
SNAT       all  --  10.1.60.10           0.0.0.0/0
to:62.101.15.9

Input chain look like this

Chain INPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     tcp  --  62.101.52.106         62.101.15.9   dport 80






Op dit e-mailbericht is een disclaimer van toepassing, welke te vinden is op http://www.xb.nl/disclaimer.html



