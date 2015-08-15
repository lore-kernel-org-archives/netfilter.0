From: sillysausage <sillysausage@privatedemail.net>
Subject: Re: Filtering bogon ranges from exiting WAN
Date: Sat, 15 Aug 2015 23:57:32 +0930
Message-ID: <55CF4C54.60908@privatedemail.net>
References: <55CB3ECD.2010509@privatedemail.net>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <55CB3ECD.2010509@privatedemail.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Turns out I needed to strip my marks off the packets which were bogons.

Then with the correct ordering write FORWARD and OUTPUT rules that matched
what I was trying to achieve

The full set of rules are here:

I documented it here:

http://wiki.alpinelinux.org/wiki/Linux_Router_with_VPN_on_a_Raspberry_Pi#Blocking_bogons

#########################################################################
# Advanced routing rule set
# Uses 192.168.1.0 via ISP
#      192.168.2.0 via VPN
#      192.168.3.0 via LAN
#
# Packets to/from 192.168.1.0/24 are marked with 0x1 and routed to ISP
# Packets to/from 192.168.2.0/24 are marked with 0x2 and routed to VPN
# Packets to/from 192.168.3.0/24 are routed to LAN and not forwarded onto
#                                    the internet
#
#########################################################################

#
# Mangle Table
# This is the place where our markings happen, whether they be 0x1 or 0x2
#
*mangle

# Set default policies for table
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]

# Restore CONNMARK to the MARK (If one doesn't exist then no mark is set)
-A PREROUTING -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff

# If packet MARK is 2, then it means there is already a connection mark and the
# original packet came in on VPN
-A PREROUTING -s 192.168.2.0/24 -m mark --mark 0x2 -j ACCEPT

# Check exception (this is a server which when accessed on a 192.168.2.0/24 address will go out the ISP table) are 0x1
#-A PREROUTING -s 192.168.2.0/24 -d <IP_OF_EXCEPTED_SERVER>/32 -m mark --mark 0x1 -j ACCEPT

# Mark packets coming from 192.168.2.0/24 are 0x2
-A PREROUTING -s 192.168.2.0/24 -j MARK --set-xmark 0x2/0xffffffff

# If packet MARK is 1, then it means there is already a connection mark and the
# original packet came in on ISP
-A PREROUTING -s 192.168.1.0/24 -m mark --mark 0x1 -j ACCEPT

# Mark packets 192.168.1.0/24 are 0x1
-A PREROUTING -s 192.168.1.0/24 -j MARK --set-xmark 0x1/0xffffffff

# Mark exception (this is a server which when accessed on a 192.168.2.0/24 address will go out the ISP table) as 0x1
#-A PREROUTING -s 192.168.2.0/24 -d <IP_OF_EXCEPTED_SERVER>/32 -j MARK --set-xmark 0x1/0xffffff

# Strip mark if packet is destined for modem.
-A PREROUTING -d 192.168.0.1/32 -j MARK --set-xmark 0x0/0xffffffff

# Strip mark if unknown bogon range to be blocked
-A PREROUTING -m set --match-set bogon-bn-nonagg dst -j MARK --set-xmark 0x0/0xffffffff

# Save MARK to CONNMARK (remember iproute can't see CONNMARKs)
-A PREROUTING -j CONNMARK --save-mark --nfmask 0xffffffff --ctmask 0xffffffff
COMMIT

#
# Filter Table
# This is where we decide to ACCEPT, DROP or REJECT things
#
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]

# Create rule chain per input interface for forwarding packets
:FWD_ETH0 - [0:0]
:FWD_ETH1 - [0:0]
:FWD_PPP0 - [0:0]
:FWD_TUN0 - [0:0]

# Create rule chain per input interface for input packets (for host itself)
:IN_ETH0 - [0:0]
:IN_ETH1 - [0:0]
:IN_PPP0 - [0:0]
:IN_TUN0 - [0:0]

# Create a drop chain
:LOG_DROP - [0:0]

# Create a reject chain
:LOG_REJECT - [0:0]

# Create an output chain
:OUT_PPP0 - [0:0]
:OUT_TUN0 - [0:0]

# Pass input packet to corresponding rule chain
-A INPUT -i lo -j ACCEPT
-A INPUT -i eth0 -j IN_ETH0
-A INPUT -i eth1 -j IN_ETH1
-A INPUT -i ppp0 -j IN_PPP0
-A INPUT -i tun0 -j IN_TUN0

# Track forwarded packets
-A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Pass forwarded packet to corresponding rule chain
-A FORWARD -i eth0 -j FWD_ETH0
-A FORWARD -i eth1 -j FWD_ETH1
-A FORWARD -i ppp0 -j FWD_PPP0
-A FORWARD -i tun0 -j FWD_TUN0

# Pass output interface to corresponding chain
-A OUTPUT -o ppp0 -j OUT_PPP0
-A OUTPUT -o tun0 -j OUT_TUN0

# Forward traffic to Modem
-A FWD_ETH0 -d 192.168.0.1/32 -j ACCEPT

# Allow routing to remote address on VPN
-A FWD_ETH0 -s 192.168.1.0/24 -d 172.16.32.1/32 -o tun0 -j ACCEPT
-A FWD_ETH0 -s 192.168.2.0/24 -d 172.16.32.1/32 -o tun0 -j ACCEPT

# Allow forwarding from LAN hosts to LAN ONLY subnet
-A FWD_ETH0 -s 192.168.1.0/24 -d 192.168.3.0/24 -j ACCEPT
-A FWD_ETH0 -s 192.168.2.0/24 -d 192.168.3.0/24 -j ACCEPT

# Allow LAN ONLY subnet to contact other LAN hosts
-A FWD_ETH0 -s 192.168.3.0/24 -d 192.168.1.0/24 -j ACCEPT
-A FWD_ETH0 -s 192.168.3.0/24 -d 192.168.2.0/24 -j ACCEPT

# Refuse to forward bogons to the internet! eg 192.168.9.0/24 or 10.0.0.0
# or any other range which we are not using on our LAN
-A FWD_ETH0 -m set --match-set bogon-bn-nonagg dst -j LOG_REJECT

# Forward traffic to ISP
-A FWD_ETH0 -s 192.168.1.0/24 -j ACCEPT

# Forward traffic to VPN
-A FWD_ETH0 -s 192.168.2.0/24 -j ACCEPT

# Prevent 192.168.3.0/24 from accessing internet
-A FWD_ETH0 -s 192.168.3.0/24 -j LOG_REJECT

# Allow excepted server to be FORWARD to ppp0
#-A FWD_ETH0 -s 192.168.2.0/24 -d <IP_OF_EXCEPTED_SERVER>/32 -o ppp0 -j ACCEPT

# Forward SSH packets from network to modem
-A FWD_ETH1 -s 192.168.0.1/32 -d 192.168.1.0/24 -p tcp -m tcp --sport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A FWD_ETH1 -s 192.168.0.1/32 -d 192.168.2.0/24 -p tcp -m tcp --sport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Forward HTTP packets from network to mode
-A FWD_ETH1 -s 192.168.0.1/32 -d 192.168.1.0/24 -p tcp -m tcp --sport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A FWD_ETH1 -s 192.168.0.1/32 -d 192.168.2.0/24 -p tcp -m tcp --sport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Forward Bittorrent Port to workstation
-A FWD_TUN0 -d 192.168.2.30/32 -p tcp -m tcp --dport 6881:6889 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A FWD_TUN0 -d 192.168.2.30/32 -p udp -m udp --dport 6881:6889 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# SSH to Router
-A IN_ETH0 -s 192.168.1.0/24 -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A IN_ETH0 -s 192.168.2.0/24 -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# DNS to Router
-A IN_ETH0 -s 192.168.1.0/24 -p udp -m udp --dport 53 -m conntrack --ctstate NEW -j ACCEPT
-A IN_ETH0 -s 192.168.2.0/24 -p udp -m udp --dport 53 -m conntrack --ctstate NEW -j ACCEPT

# FreeRadius Client (eg a UniFi AP)
-A IN_ETH0 -s 192.168.3.10/32 -p tcp -m tcp --dport 1812 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A IN_ETH0 -s 192.168.3.10/32 -p udp -m udp --dport 1812 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Ubiquiti UAP Device Discovery Broadcast
-A IN_ETH0 -s 192.168.3.10/32 -p udp -m udp --dport 10001 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# NTP to Router
-A IN_ETH0 -s 192.168.1.0/24 -p udp -m udp --dport 123 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A IN_ETH0 -s 192.168.2.0/24 -p udp -m udp --dport 123 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A IN_ETH0 -s 192.168.3.0/24 -p udp -m udp --dport 123 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Accept traffic to router on both subnets
-A IN_ETH0 -s 192.168.1.0/24 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A IN_ETH0 -s 192.168.2.0/24 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Allow excepted server to be INPUT to eth0 from LAN
#-A IN_ETH0 -s 192.168.2.0/24 -d <IP_OF_EXCEPTED_SERVER>/32 -o ppp0 -j ACCEPT

# SSH To Modem from Router
-A IN_ETH1 -s 192.168.0.1/32 -d 192.168.0.0/30 -p tcp -m tcp --sport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# HTTP To Modem from Router
-A IN_ETH1 -s 192.168.0.1/32 -d 192.168.0.0/30 -p tcp -m tcp --sport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Deny bogons from ISP
-A IN_PPP0 -m set --match-set bogon-bn-nonagg src -j LOG_REJECT

# Accept incoming tracked PPP0 connection
-A IN_PPP0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Log dropped packets coming in on PPP0
-A IN_PPP0 -j LOG --log-prefix "DROP:INPUT " --log-level 6
-A IN_PPP0 -j LOG_DROP

# Accept traffic from IP on VPN (exception not a bogon)
-A IN_TUN0 -d 172.16.32.0/20 -j ACCEPT

# Accept incoming tracked TUN0 connection
-A IN_TUN0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Log dropped packets coming in on TUN0
-A IN_TUN0 -j LOG --log-prefix "DROP:INPUT " --log-level 6
-A IN_TUN0 -j LOG_DROP

# Log rejected packets
-A LOG_REJECT -j LOG --log-prefix "Rejected Bogon: " --log-level 6
-A LOG_REJECT -j REJECT --reject-with icmp-port-unreachable

# Deny bogons to ISP
-A OUT_PPP0 -m set --match-set bogon-bn-nonagg dst -j LOG_REJECT

# Allow traffic to IP on VPN (exception not a bogon)
-A OUT_TUN0 -d 172.16.32.0/20 -j ACCEPT

# Deny bogons to VPN
-A OUT_TUN0 -m set --match-set bogon-bn-nonagg dst -j LOG_REJECT
COMMIT

#
# NAT Table
# This is where translation of packets happens and "forwarding" of ports
# to specific hosts.
#
*nat
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]

# Port forwarding for Bittorrent
-A PREROUTING -i tun0 -p tcp -m tcp --dport 6881:6889 -j DNAT --to-destination 192.168.2.20
-A PREROUTING -i tun0 -p udp -m udp --dport 6881:6889 -j DNAT --to-destination 192.168.2.20

# Allows routing to our modem subnet so we can access the web interface
-A POSTROUTING -s 192.168.1.0/24 -d 192.168.0.1/32 -o eth1 -p tcp -m tcp --dport 80 -j MASQUERADE
-A POSTROUTING -s 192.168.2.0/24 -d 192.168.0.1/32 -o eth1 -p tcp -m tcp --dport 80 -j MASQUERADE

# Allows hosts of the network to use the VPN tunnel
-A POSTROUTING -o tun0 -j MASQUERADE

# Allows hosts of the network to use the PPP tunnel
-A POSTROUTING -o ppp0 -j MASQUERADE
COMMIT

