From: x xb <master_compiler@yahoo.com>
Subject: Strange thing
Date: Wed, 18 Jun 2003 14:42:11 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030618214211.26492.qmail@web80507.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I am using Red Hat 8 (2.4.18-14) with Iptable
(V1.2.6.a) , the layout of my net is:
 
               Host A  ----------  Firewall ------
Host B
              (Outside)                           
(My_WS) 

 Net A: 	172.19.100.0 - 172.19.100.31 
 Netmask : 	255.255.255.224
 IP A: 		172.19.100.28
 GW:		172.19.100.30

 Net B: 	172.19.100.32 - 172.19.100.63
 Netmask: 	255.255.255.224
 IP B: 		172.19.100.50
 GW: 		172.19.100.33

 And for the Firewall: 
 Eth0:	172.19.100.30
 Eth1:	172.19.100.33
 Both with netmask 255.255.255.224

 The rules for the Firewall are:

Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out    
source               destination         
1        0     0 ACCEPT     all  --  lo     *      
0.0.0.0/0            0.0.0.0/0 

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out    
source               destination         
1        0     0 ACCEPT     all  --  *      lo     
0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy DROP 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out    
source               destination         
1        0     0 ACCEPT     tcp  --  eth0   eth1   
0.0.0.0/0            172.19.100.50       tcp dpt:80 
2        0     0 ACCEPT     all  --  eth0   eth1   
0.0.0.0/0            0.0.0.0/0          state
RELATED,ESTABLISHED 
3        0     0 ACCEPT     all  --  eth1   eth0   
0.0.0.0/0            0.0.0.0/0  

The forward is enable in the FW (echo "1" >
/proc/sys/net/ipv4/ip_forward)and the routing table
is:
Kernel IP routing table
Destination     Gateway         Genmask         Flags
Metric Ref    Use Iface
172.19.100.32   *               255.255.255.224 U    
0      0        0 eth1
172.19.100.0    *               255.255.255.224 U    
0      0        0 eth0
127.0.0.0       *               255.0.0.0       U    
0      0        0 lo
default         172.19.100.1    0.0.0.0         UG   
0      0        0 eth0

I want that everything from Net B can go out, but from
Net A only to host B is allow.

Ok, where we go, if I tray to the webserver on host B
from host A everything is OK, then I make a ping form
host B to host A and also work. But if I down the
interface on host B and then bring it up again, when I
ping host A from host B doesn't work. I tray with
another hosts on LAN B (say 172.19.100.54) and it's
the same, all the packets are lost.
The only way I found to work is first make a ping to
the FW from host B and then retry 
to host A.

Thanks for your help.

Sorry, about my english.

__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com

