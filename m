From: George Garvey <tmwg-netfilter@inxservices.com>
Subject: NAT not working on one of 3 firewalls
Date: Mon, 24 Jun 2002 11:31:21 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624113121.B868@inxservices.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

I'm using almost the same iptables scripts on 3 systems. 2 will do NAT,
1 won't.

The 2 that do both have 3 NICs, 1 connected to a switch for a LAN, 2
connected to DSL lines. The one that doesn't has 2 NICs, 1 for a LAN, 1
for a DSL.

The DSL I'm having problems with is connected through a router that
translates a single IP to 5 IPs, only one of which I'm using. I'm told
by the ISP that I can use any 2 of the 5 on the internet. At least,
that's my understanding.

This system also has a GRE tunnel. I've turned of IPSEC until I get the
nat worked out.

I've attached a dump from iptables. I did a search/replace to change the
internet IPs to a unique identifier in the dump. If you need the IPs,
I'll supply them.

The LAN works fine. Internet with the firewall works fine.

If I ping an internet IP from the LAN, I'm pretty sure it goes out to
the internet with the source IP still the LAN IP, without translation.

I have no clue what I'm doing wrong. Any assistance will be appreciated.

XX.XXX.XXX.XXX is the IP on eth1 of the firewall. YY.YYY.YYY.YYY is the
IP at the other end of the GRE tunnel.

Chain INPUT (policy ACCEPT 5 packets, 372 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0          
    2   152 ACCEPT     all  --  eth0   *       192.168.2.0/24       0.0.0.0/0          
    4   208 ACCEPT     all  --  eth1   *       XX.XXX.XXX.XXX/29    XX.XXX.XXX.XXX/29  
    0     0 log-and-rej-in  all  --  eth1   *       192.168.2.0/24       0.0.0.0/0          
    0     0 ACCEPT     icmp --  eth1   *       0.0.0.0/0            XX.XXX.XXX.XXX     
  745 66748 ACCEPT     all  --  eth1   *       0.0.0.0/0            XX.XXX.XXX.XXX     state RELATED,ESTABLISHED 
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            XX.XXX.XXX.XXX     state NEW,RELATED,ESTABLISHED multiport dports 113,123,209 
    0     0 ACCEPT     udp  --  eth1   *       0.0.0.0/0            XX.XXX.XXX.XXX     state NEW,RELATED,ESTABLISHED multiport dports 123,500,50,51 
    0     0 ACCEPT     47   --  eth1   *       YY.YYY.YYY.YYY         XX.XXX.XXX.XXX     
    0     0 ACCEPT     all  --  withvan *       192.168.3.1          192.168.2.0/24     
    0     0 ACCEPT     all  --  withvan *       192.168.1.12         XX.XXX.XXX.XXX     
  715 47612 ACCEPT     all  --  withvan *       192.168.1.0/24       192.168.2.2        
    0     0 ACCEPT     all  --  withvan *       192.168.1.0/24       192.168.3.2        
    0     0 log-and-rej-in  all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     all  --  eth0   withvan  0.0.0.0/0            0.0.0.0/0          
    0     0 ACCEPT     all  --  withvan eth0    0.0.0.0/0            0.0.0.0/0          
    0     0 ACCEPT     all  --  eth1   eth0    0.0.0.0/0            0.0.0.0/0          state RELATED,ESTABLISHED 
    0     0 ACCEPT     all  --  eth0   eth1    0.0.0.0/0            0.0.0.0/0          
    0     0 log-and-rej-fwd  all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain OUTPUT (policy ACCEPT 65 packets, 12174 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     all  --  *      lo      0.0.0.0/0            0.0.0.0/0          
    0     0 ACCEPT     all  --  *      eth0    XX.XXX.XXX.XXX       192.168.2.0/24     
   32  5342 ACCEPT     all  --  *      eth0    192.168.2.2          192.168.2.0/24     
    0     0 ACCEPT     icmp --  *      eth1    XX.XXX.XXX.XXX       0.0.0.0/0          
    0     0 ACCEPT     tcp  --  *      eth1    0.0.0.0/0            0.0.0.0/0          tcp spt:209 
    0     0 ACCEPT     all  --  *      withvan  192.168.3.2          192.168.1.0/24     
  425 46996 ACCEPT     all  --  *      withvan  192.168.2.2          192.168.1.0/24     
    0     0 ACCEPT     all  --  *      withvan  192.168.2.2          192.168.3.1        
    0     0 log-and-rej-out  all  --  *      eth1    0.0.0.0/0            192.168.2.0/24     
  449 58860 ACCEPT     all  --  *      eth1    XX.XXX.XXX.XXX       0.0.0.0/0          
    0     0 log-and-rej-out  all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain log-and-rej-fwd (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 7 prefix `REJECT-FWD: ' 
    0     0 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          reject-with icmp-port-unreachable 

Chain log-and-rej-in (2 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 7 prefix `REJECT-INP: ' 
    0     0 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          reject-with icmp-port-unreachable 

Chain log-and-rej-out (2 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 7 prefix `REJECT-OUT: ' 
    0     0 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          reject-with icmp-port-unreachable 

MANGLE

Chain PREROUTING (policy ACCEPT 2026 packets, 166K bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain INPUT (policy ACCEPT 1988 packets, 163K bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain FORWARD (policy ACCEPT 25 packets, 1872 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 16420 packets, 2797K bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain POSTROUTING (policy ACCEPT 16445 packets, 2799K bytes)
 pkts bytes target     prot opt in     out     source               destination         

FILTER

Chain INPUT (policy ACCEPT 5 packets, 372 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0          
    2   152 ACCEPT     all  --  eth0   *       192.168.2.0/24       0.0.0.0/0          
    4   208 ACCEPT     all  --  eth1   *       XX.XXX.XXX.XXX/29    XX.XXX.XXX.XXX/29  
    0     0 log-and-rej-in  all  --  eth1   *       192.168.2.0/24       0.0.0.0/0          
    0     0 ACCEPT     icmp --  eth1   *       0.0.0.0/0            XX.XXX.XXX.XXX     
  745 66748 ACCEPT     all  --  eth1   *       0.0.0.0/0            XX.XXX.XXX.XXX     state RELATED,ESTABLISHED 
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            XX.XXX.XXX.XXX     state NEW,RELATED,ESTABLISHED multiport dports 113,123,209 
    0     0 ACCEPT     udp  --  eth1   *       0.0.0.0/0            XX.XXX.XXX.XXX     state NEW,RELATED,ESTABLISHED multiport dports 123,500,50,51 
    0     0 ACCEPT     47   --  eth1   *       YY.YYY.YYY.YYY         XX.XXX.XXX.XXX     
    0     0 ACCEPT     all  --  withvan *       192.168.3.1          192.168.2.0/24     
    0     0 ACCEPT     all  --  withvan *       192.168.1.12         XX.XXX.XXX.XXX     
  715 47612 ACCEPT     all  --  withvan *       192.168.1.0/24       192.168.2.2        
    0     0 ACCEPT     all  --  withvan *       192.168.1.0/24       192.168.3.2        
    0     0 log-and-rej-in  all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     all  --  eth0   withvan  0.0.0.0/0            0.0.0.0/0          
    0     0 ACCEPT     all  --  withvan eth0    0.0.0.0/0            0.0.0.0/0          
    0     0 ACCEPT     all  --  eth1   eth0    0.0.0.0/0            0.0.0.0/0          state RELATED,ESTABLISHED 
    0     0 ACCEPT     all  --  eth0   eth1    0.0.0.0/0            0.0.0.0/0          
    0     0 log-and-rej-fwd  all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain OUTPUT (policy ACCEPT 65 packets, 12174 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     all  --  *      lo      0.0.0.0/0            0.0.0.0/0          
    0     0 ACCEPT     all  --  *      eth0    XX.XXX.XXX.XXX       192.168.2.0/24     
   32  5342 ACCEPT     all  --  *      eth0    192.168.2.2          192.168.2.0/24     
    0     0 ACCEPT     icmp --  *      eth1    XX.XXX.XXX.XXX       0.0.0.0/0          
    0     0 ACCEPT     tcp  --  *      eth1    0.0.0.0/0            0.0.0.0/0          tcp spt:209 
    0     0 ACCEPT     all  --  *      withvan  192.168.3.2          192.168.1.0/24     
  425 46996 ACCEPT     all  --  *      withvan  192.168.2.2          192.168.1.0/24     
    0     0 ACCEPT     all  --  *      withvan  192.168.2.2          192.168.3.1        
    0     0 log-and-rej-out  all  --  *      eth1    0.0.0.0/0            192.168.2.0/24     
  449 58860 ACCEPT     all  --  *      eth1    XX.XXX.XXX.XXX       0.0.0.0/0          
    0     0 log-and-rej-out  all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain log-and-rej-fwd (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 7 prefix `REJECT-FWD: ' 
    0     0 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          reject-with icmp-port-unreachable 

Chain log-and-rej-in (2 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 7 prefix `REJECT-INP: ' 
    0     0 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          reject-with icmp-port-unreachable 

Chain log-and-rej-out (2 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 7 prefix `REJECT-OUT: ' 
    0     0 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          reject-with icmp-port-unreachable 

NAT

Chain PREROUTING (policy ACCEPT 26 packets, 1872 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain POSTROUTING (policy ACCEPT 16 packets, 1439 bytes)
 pkts bytes target     prot opt in     out     source               destination         
   16  1184 SNAT       all  --  *      eth1    0.0.0.0/0            0.0.0.0/0          to:XX.XXX.XXX.XXX 

Chain OUTPUT (policy ACCEPT 43 packets, 3409 bytes)
 pkts bytes target     prot opt in     out     source               destination         

