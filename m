From: "John Jones" <jjones@merlintechnologies.com>
Subject: Strange misunderstandings
Date: Fri, 31 May 2002 12:11:22 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <001301c208d6$f3a956a0$6301a8c0@JJONES1>
Reply-To: <jjones@merlintechnologies.com>
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
To: 'Iptables' <netfilter@lists.samba.org>

Two issues, first issue is a simple question:

[root] iptables -h
...
  --check   -C chain            Test this packet on chain
...

[root] iptables --check
iptables v1.2.6a: Unknown arg `--check'

What's up with that?  The help screen shows me it is a command, but it
doesn't exist?  Is this an optional kernel compilation thing that is
missing, or has it been removed from the distro?


Second issue:

I hate to post something like this to the list, but I need help.  I am
replacing an IPCHAINS firewall with an IPTABLES firewall, and am running
into failures that I cannot track down.

Below is my ruleset, simplified to remove extraneous information:

Iptables 1.2.6a on Debian 3.0:

Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination         
  859 61128 ACCEPT     tcp  --  *      *       0.0.0.0/0
66.38.133.120      tcp dpt:22 
   15  1260 ACCEPT     all  --  *      *       0.0.0.0/0
10.0.0.3           
    0     0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          LOG flags 0 level 4 prefix `INPUT:' 

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination         
  208 13839 ACCEPT     udp  --  *      *       0.0.0.0/0
10.0.0.10          udp dpt:53 
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0
10.0.0.10          udp dpt:53 
    0     0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          LOG flags 0 level 4 prefix `FORWARD:' 

Chain OUTPUT (policy ACCEPT 15 packets, 1260 bytes)
 pkts bytes target     prot opt in     out     source
destination         
  767  202K ACCEPT     all  --  *      *       0.0.0.0/0
209.139.199.253    
    0     0 ACCEPT     all  --  *      *       10.0.0.10
0.0.0.0/0          
   15  1260 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          LOG flags 0 level 4 prefix `OUTPUT:' 

----------------------- NAT TABLES ---------------------------

Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination         
   52  3475 DNAT       udp  --  *      *       0.0.0.0/0
66.38.133.120      udp dpt:53 to:10.0.0.10:53 
    0     0 DNAT       udp  --  *      *       0.0.0.0/0
66.38.133.120      udp dpt:53 to:10.0.0.10:53 
    0     0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          LOG flags 0 level 4 prefix `NAT-PREROUTING:' 

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination         
    0     0 MASQUERADE  all  --  *      eth1    10.0.0.0/24
0.0.0.0            
    0     0 SNAT       all  --  *      eth1    10.0.0.0/24
0.0.0.0/0          to:66.38.133.120 
   69  4835 ACCEPT     all  --  *      *       0.0.0.0/0
10.0.0.10          
    0     0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          LOG flags 0 level 4 prefix `NAT-POSTROUTING:' 

Chain OUTPUT (policy ACCEPT 15 packets, 1260 bytes)
 pkts bytes target     prot opt in     out     source
destination         
   15  1260 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          LOG flags 0 level 4 prefix `NAT-OUTPUT:' 

---------------------- FINISH -------------------------------

What is happening/wrong, is that I cannot seem to get an answer when I
point my nameserver settings to 66.38.133.120.  From everything that I
can tell, it is getting the traffic, processing it through the chains
correctly, but the workstation is not getting a response.  Further, I
have set up a logging entry on the nameserver (10.0.0.10) to log
anything from the internal interface of the firewall (10.0.0.3), but it
is not seeing anything at all.  That is why I think that I have somehow
screwed up the above rules.  I can ping between the two machines fine,
and when that is done, entries in the /var/log/messages file -do- come
up.

The relevant section of my setup script is below.

DMZ_TARGET="10.0.0.10"
EXT_IP_NS1="66.38.133.120"

iptables -t nat -I PREROUTING 1 -p udp -d $EXT_IP_NS1 --dport 53 -j DNAT
--to $DMZ_TARGET:53
iptables -I FORWARD 1 -p udp -d $DMZ_TARGET --dport 53 -j ACCEPT
iptables -t nat -I PREROUTING 1 -p udp -d $EXT_IP_NS2 --dport 53 -j DNAT
--to $DMZ_TARGET:53
iptables -I FORWARD 1 -p udp -d $DMZ_TARGET --dport 53 -j ACCEPT

Can anyone spot what I am missing here?  I am banging my head off my
desk trying to spot the Stupid Mistake that I am overlooking.  Any help
appreciated.


