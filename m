From: "Victor Wren" <vwren_netfilter@timension.com>
Subject: Yet another xNAT question
Date: Tue, 13 Jul 2004 13:51:56 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F3E8FC.5160.B171D3@localhost>
Reply-To: vwren_netfilter@timension.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Content-description: Mail message body
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

I've been trying to put together a DMZ firewall for several days, now, to 
replace an aging (1996 vintage) Watchguard Firebox.  I've read Oskar's 
tutorials, and used his scripts as a starting point.  I'm starting to lose 
track of all the experimentation I've done, and which things got what other 
things to halfway work.

My configuration is this:
OUTSIDE INTERFACE (ETH2) 67.116.23.77 on net 67.116.23.64/28
DMZ INTERFACE (ETH1) 10.10.2.244 on net 10.10.2.0/24
INSIDE (ETH0) 10.10.1.254 on net 10.10.1.0/24

I have six sites, and I'd like to have the firewall just translate addresses 
from the public IPs to the 10.10.2.0/24 addresses.

I've set up ETH2 on the firewall with virtual addresses, like this:
eth2:65 --> 67.116.23.65
eth2:66 --> 67.116.23.66
eth2:67 --> 67.116.23.67
etc...
The DMZ addresses are also virtual interfaces on another machine
eth1 -->    10.10.2.32
eth1:0 --> 10.10.2.33
eth1:1 --> 10.10.2.34
etc...

The default route for the DMZ machine is 10.10.2.254
The default route for the firewall is 67.116.23.78 (an address on the SBC 
side of my DSL bridge)

As I understand it, the only things that should matter for packets destined 
for the DMZ are the PREROUTING, POSTROUTING and FORWARD chains.

I have the following NAT rules for each of my public IPs (with the addresses 
incremented, of course):

iptables -t nat -A PREROUTING -i eth2 -d 67.116.23.65 
  -j DNAT --to-destination 10.10.2.32
iptables -t nat -A POSTROUTING -o eth2 -s 10.10.2.32 
  -j SNAT --to-source 67.116.23.65

------------------------------------------------------
These are the forwarding rules:
--------------------------------------------------
# bad TCP packets we don't want 
# (this is Oskar's basic SYN/ACK rule)
iptables -A FORWARD -p tcp -j bad_tcp_packets

#               DMZ SECTION
# General rules
iptables -A FORWARD -i eth1 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth1 -m state 
  --state ESTABLISHED,RELATED  -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -m state 
  --state ESTABLISHED,RELATED -j ACCEPT

# Allow HTTP traffic across firewall
iptables -A FORWARD -p tcp --dport http -j allowed

# DNS server on DMZ
iptables -A FORWARD -p udp --dport domain -j ACCEPT

# Allow forwarding of NTP packets
iptables -A FORWARD -p udp --dport ntp -j ACCEPT

# Allow SMTP connection to/from all servers
iptables -A FORWARD -p tcp --dport smtp -j allowed

# Allow ICMP traffic
iptables -A FORWARD -p icmp -j icmp_packets

--------------------------------------------------------
# CHAIN: "allowed"
iptables -A allowed -p tcp --syn -j ACCEPT
iptables -A allowed -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A allowed -p tcp -j DROP

# CHAIN: "icmp_packets"
iptables -A icmp_packets -p icmp --icmp-type echo-request -j ACCEPT
iptables -A icmp_packets -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A icmp_packets -p icmp --icmp-type time-exceeded -j ACCEPT
iptables -A icmp_packets -p icmp --icmp-type destination-unreachable 
  -j ACCEPT


Pinging the outside interfaces (67.116.23.65-70) from my home machine 
elsewhere on the internet doesn't get any response.  Pinging the firewall 
interface (67.116.23.77) does get a response.  The counters in "nat" and 
"FORWARD" are solidly stuck at zero, suggesting somehow that the packets 
aren't even getting to the chains.  I can ping back and forth across all the 
private DMZ addresses between the firewall and the DMZ machine, so that part 
of the configuration seems valid.

I feel like I am having a fundamental lack of understanding about how 
DNAT/SNAT works, but I'm at a loss as to how to debug this.  I'd rather have 
my servers on a DMZ network, because the alternative is trying to figure out 
how to do routing across a machine where two of the interfaces have the same 
IP address.  Maybe that's not as ugly as I fear.

Victor Wren



Victor Wren
Designer,
Timension Inc.
1350 C Pear Ave
Mountain View CA 94043
(650) 564-9397
Fax: (650) 564-9398
Opinions stated in this letter are not necessarily
those of Timension Inc. or the management.  All
Rights Reserved.  No spitting.


