From: "Svein E. Seldal" <Svein.Seldal@solidas.com>
Subject: Re: Connection opening problem (prev: FTP/auth problems (slooow links))
Date: Mon, 14 Oct 2002 10:31:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DAA80EA.7070106@solidas.com>
References: <3DA97045.2040803@solidas.com> <20021013235022.ZXXG27697.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040109050003030901080404"
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------040109050003030901080404
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I've investigated this problem more closely, and it seems to me that the 
problem is *not* related to FTP only, but the general time-delay on 
connection openings. The reason this is apparent on FTP, is when 
transferring 1000 small files, 1000 connections has to be opened, thus 
the delay will be significant and noticeable.

A couple of persons have asked be about /etc/resolv.conf and how DNS 
resolver is setup. I thought the incoming/outgoing packets never where 
resolved with DNS due to the significant delay. Is this true?

Antony Stone wrote:
> Without seeing your ruleset I cannot be certain, but I would not expect the 
> latter situation to work properly, for reasons explained below...

Here you go...

> I think you need to think about the route of packets and their replies.
> 
> Consider machine 192.168.0.10 connecting to 192.168.0.5.   Both are on the 
> same subnet, therefore client sends packets to server and server sends 
> packets to client - all works well.
> 
> Now consider 192.168.0.10 sending packets to 1.2.3.5.   These go via your 
> router, which translates 1.2.3.5 to 192.168.0.5, and returns them to the 
> subnet where they originated.   Now where is the server going to reply to ?   
> 192.168.0.10, because that is the address which sent the original packet...
> 
> Therefore 192.168.0.10 sends a packet to 1.2.3.5 and gets a reply from 
> 192.168.0.5 (the reply goes directly from server to client, not through the 
> NAT router, because both addresses are on the same subnet), therefore 
> 192.168.0.10 gets confused and unhappy.

Maby I have been thinking all wrong all the time, but I'm not quite sure 
this statement is quite true... Please correct me if I'm wrong.!

192.168.0.10 is sending packets to 1.2.3.5. The router received it and 
does a DNAT, translating destination 1.2.3.5 to 192.168.0.5. Then it 
performs the FW-stuff. Then it is going to be sent out on the interface, 
it will be SNAT'ed, where the source address, 192.168.0.10 will be 
changed to 1.2.3.10. Hence, the packet the server receives is to 
192.168.0.5 and from 1.2.3.10. And this works reversely for packets 
being sent back to the client.

Regardless of the discussion above is correct or not, the same phenomen 
is observerved on connections from internet to lan and on lan to internet.

BTW! Is there a benefit of increasing the routing memory in the kernel? 
(Regardless of the problems above.) This is a dedicated router, so IMHO 
should use as much memory for routing as possible, right?


Thanks for all the help I get,
(If I cant resolve this within a sensible amount of time, my boss will 
buy a Cisco router...)

Svein

--------------040109050003030901080404
Content-Type: text/plain;
 name="iptables_rules.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="iptables_rules.txt"

# SES 14.10.2002
#
# The network setup:
# ------------------
#
#                       eth0: 1.2.3.66
#                               v
#  Internet --- dsl_router --- lan_router --- lan
#                      ^               ^
#                 1.2.3.65     eth1: 192.168.0.2
#
# - External IP range is: 1.2.3.65/27
# - Internal IP range is: 192.168.0.0/24
# - The internal addresses 192.168.0.1-192.168.0.29 should be
#   NAT'ed 1-to-1 for 1.2.3.65-1.2.3.94
# - Some addresses (192.168.0.31-192.168.0.49) should be given
#   access to the internet with masquerade.
#
# Syslog routing loggings:
# ------------------------
#  E1:  192.168.0.x have been used from the outside
#  E2:  Incoming traffic to the router
#  E3:  Ip fragments
#  W1:  Incoming (but rejected) traffic to the other machines
#
#
*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]

################################################################
#
#  Network Address translation
#
################################################################

#
# Setup NAT for incoming packets (initiated from the outside)
#
# To make a connection from source 192.168.0.x to 1.2.3.x
# destination work, we have to translate on all addresses. This implies
# that you can talk with yourself by using your 1.2.3.x address, instead
# of the 192.168.0.x address. However in the prior case, the traffic will
# be routed through the router.
#
[0:0] -A PREROUTING -d 1.2.3.67 -j DNAT --to-destination 192.168.0.3 
[0:0] -A PREROUTING -d 1.2.3.68 -j DNAT --to-destination 192.168.0.4 
[0:0] -A PREROUTING -d 1.2.3.69 -j DNAT --to-destination 192.168.0.5 
[0:0] -A PREROUTING -d 1.2.3.70 -j DNAT --to-destination 192.168.0.6 
[0:0] -A PREROUTING -d 1.2.3.71 -j DNAT --to-destination 192.168.0.7 
[0:0] -A PREROUTING -d 1.2.3.72 -j DNAT --to-destination 192.168.0.8 
[0:0] -A PREROUTING -d 1.2.3.73 -j DNAT --to-destination 192.168.0.9 
[0:0] -A PREROUTING -d 1.2.3.74 -j DNAT --to-destination 192.168.0.10 
[0:0] -A PREROUTING -d 1.2.3.75 -j DNAT --to-destination 192.168.0.11 
[0:0] -A PREROUTING -d 1.2.3.76 -j DNAT --to-destination 192.168.0.12 
[0:0] -A PREROUTING -d 1.2.3.77 -j DNAT --to-destination 192.168.0.13 
[0:0] -A PREROUTING -d 1.2.3.78 -j DNAT --to-destination 192.168.0.14 
[0:0] -A PREROUTING -d 1.2.3.79 -j DNAT --to-destination 192.168.0.15 
[0:0] -A PREROUTING -d 1.2.3.80 -j DNAT --to-destination 192.168.0.16 
[0:0] -A PREROUTING -d 1.2.3.81 -j DNAT --to-destination 192.168.0.17 
[0:0] -A PREROUTING -d 1.2.3.82 -j DNAT --to-destination 192.168.0.18 
[0:0] -A PREROUTING -d 1.2.3.83 -j DNAT --to-destination 192.168.0.19 
[0:0] -A PREROUTING -d 1.2.3.84 -j DNAT --to-destination 192.168.0.20 
[0:0] -A PREROUTING -d 1.2.3.85 -j DNAT --to-destination 192.168.0.21 
[0:0] -A PREROUTING -d 1.2.3.86 -j DNAT --to-destination 192.168.0.22 
[0:0] -A PREROUTING -d 1.2.3.87 -j DNAT --to-destination 192.168.0.23 
[0:0] -A PREROUTING -d 1.2.3.88 -j DNAT --to-destination 192.168.0.24 
[0:0] -A PREROUTING -d 1.2.3.89 -j DNAT --to-destination 192.168.0.25 
[0:0] -A PREROUTING -d 1.2.3.90 -j DNAT --to-destination 192.168.0.26 
[0:0] -A PREROUTING -d 1.2.3.91 -j DNAT --to-destination 192.168.0.27 
[0:0] -A PREROUTING -d 1.2.3.92 -j DNAT --to-destination 192.168.0.28 
[0:0] -A PREROUTING -d 1.2.3.93 -j DNAT --to-destination 192.168.0.29 

#
# Setup NAT for outgoing packets (initiated from the inside)
#
[0:0] -A POSTROUTING -s 192.168.0.3 -j SNAT --to-source 1.2.3.67 
[0:0] -A POSTROUTING -s 192.168.0.4 -j SNAT --to-source 1.2.3.68 
[0:0] -A POSTROUTING -s 192.168.0.5 -j SNAT --to-source 1.2.3.69 
[0:0] -A POSTROUTING -s 192.168.0.6 -j SNAT --to-source 1.2.3.70 
[0:0] -A POSTROUTING -s 192.168.0.7 -j SNAT --to-source 1.2.3.71 
[0:0] -A POSTROUTING -s 192.168.0.8 -j SNAT --to-source 1.2.3.72 
[0:0] -A POSTROUTING -s 192.168.0.9 -j SNAT --to-source 1.2.3.73 
[0:0] -A POSTROUTING -s 192.168.0.10 -j SNAT --to-source 1.2.3.74 
[0:0] -A POSTROUTING -s 192.168.0.11 -j SNAT --to-source 1.2.3.75 
[0:0] -A POSTROUTING -s 192.168.0.12 -j SNAT --to-source 1.2.3.76 
[0:0] -A POSTROUTING -s 192.168.0.13 -j SNAT --to-source 1.2.3.77 
[0:0] -A POSTROUTING -s 192.168.0.14 -j SNAT --to-source 1.2.3.78 
[0:0] -A POSTROUTING -s 192.168.0.15 -j SNAT --to-source 1.2.3.79 
[0:0] -A POSTROUTING -s 192.168.0.16 -j SNAT --to-source 1.2.3.80 
[0:0] -A POSTROUTING -s 192.168.0.17 -j SNAT --to-source 1.2.3.81 
[0:0] -A POSTROUTING -s 192.168.0.18 -j SNAT --to-source 1.2.3.82 
[0:0] -A POSTROUTING -s 192.168.0.19 -j SNAT --to-source 1.2.3.83 
[0:0] -A POSTROUTING -s 192.168.0.20 -j SNAT --to-source 1.2.3.84 
[0:0] -A POSTROUTING -s 192.168.0.21 -j SNAT --to-source 1.2.3.85 
[0:0] -A POSTROUTING -s 192.168.0.22 -j SNAT --to-source 1.2.3.86 
[0:0] -A POSTROUTING -s 192.168.0.23 -j SNAT --to-source 1.2.3.87 
[0:0] -A POSTROUTING -s 192.168.0.24 -j SNAT --to-source 1.2.3.88 
[0:0] -A POSTROUTING -s 192.168.0.25 -j SNAT --to-source 1.2.3.89 
[0:0] -A POSTROUTING -s 192.168.0.26 -j SNAT --to-source 1.2.3.90 
[0:0] -A POSTROUTING -s 192.168.0.27 -j SNAT --to-source 1.2.3.91 
[0:0] -A POSTROUTING -s 192.168.0.28 -j SNAT --to-source 1.2.3.92 
[0:0] -A POSTROUTING -s 192.168.0.29 -j SNAT --to-source 1.2.3.93 
[0:0] -A POSTROUTING -s 192.168.0.30 -j SNAT --to-source 1.2.3.94 

#
# Setup masquerade for select IP's. These will have the external
# address equal to the router's IP
#
[0:0] -A POSTROUTING -s 192.168.0.31 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.32 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.33 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.34 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.35 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.36 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.37 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.38 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.39 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.40 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.41 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.42 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.43 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.44 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.45 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.46 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.47 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.48 -j MASQUERADE 
[0:0] -A POSTROUTING -s 192.168.0.49 -j MASQUERADE 

COMMIT


*filter

:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]


################################################################
#
#  Check chains
#
################################################################

:SYNFLOOD - [0:0]
:CHECK - [0:0]

#
# SYN-flood protection chain
#
[0:0] -A SYNFLOOD -m limit --limit 1/s --limit-burst 4 -j RETURN
[0:0] -A SYNFLOOD -j DROP

#
# SYN-flooding protection
#
[0:0] -A CHECK -p tcp -m tcp --tcp-flags SYN,RST,ACK SYN -j SYNFLOOD

#
# Make sure new TCP connections are SYN packets
#
[0:0] -A CHECK -p tcp -m tcp ! --tcp-flags SYN,RST,ACK SYN -m state --state NEW -j DROP 

#
# Do not allow fragments
#
[0:0] -A CHECK -f -j LOG --log-prefix "routing (E3): "
[0:0] -A CHECK -f -j DROP



################################################################
#
#  Router input/output
#
################################################################

#
# Always allow loopback
#
[0:0] -A INPUT -i lo -j ACCEPT 
[0:0] -A OUTPUT -o lo -j ACCEPT 

#
# Verify the data
#
[0:0] -A INPUT -j CHECK

#
# Always allow outgoing ICMP, well-known incoming ICMP
#
[0:0] -A INPUT -p icmp -m state --state ESTABLISHED,RELATED -j ACCEPT
[0:0] -A OUTPUT -p icmp -j ACCEPT 

#
# Always allow ICMP
#
#[0:0] -A INPUT -p icmp -j ACCEPT
#[0:0] -A OUTPUT -p icmp -j ACCEPT 

#
# Allow traffic coming to/from the inside subnet
#
[0:0] -A INPUT -s 192.168.0.0/24 -i eth1 -j ACCEPT 
[0:0] -A OUTPUT -d 192.168.0.0/24 -o eth1 -j ACCEPT

#
# Allow traffic to/from the WAN router
#
[0:0] -A INPUT -s 1.2.3.65 -i eth0 -j ACCEPT
[0:0] -A OUTPUT -d 1.2.3.65 -o eth0 -j ACCEPT

#
# Allow output traffic from the router to an internal machine
#
[0:0] -A OUTPUT -d 1.2.3.64/27 -j ACCEPT

#
# Reject the external packets that are claiming to be our internal IP's
# (this is an error)
#
[0:0] -A INPUT -s 192.168.0.0/24 -i eth0 -j LOG --log-prefix "routing (E1): "
[0:0] -A INPUT -s 192.168.0.0/24 -i eth0 -j DROP

#
# ALlow NTP out and in (well known only)
#
[0:0] -A OUTPUT -o eth0 -p udp -m udp --dport ntp -j ACCEPT
[0:0] -A INPUT -i eth0 -p udp -m udp -m state --state ESTABLISHED,RELATED -j ACCEPT


# NB! Either use:

#
# Allow only wellknown connections in and reject the others of the router
#
#[0:0] -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
#[0:0] -A INPUT -i eth0 -m state --state NEW,INVALID -j LOG --log-prefix "routing (E2): "
#[0:0] -A INPUT -i eth0 -m state --state NEW,INVALID -j DROP

#
# Allow all traffic out of the router
#
#[0:0] -A OUTPUT -d ! 192.168.0.0/24 -o eth0 -j ACCEPT


# ... or use:

#
# Do not allow incoming connection to the router (from the outside)
#
[0:0] -A INPUT -i eth0 -j LOG --log-prefix "routing (E2): "
[0:0] -A INPUT -i eth0 -j DROP



################################################################
#
#  Firewall
#
################################################################

#
# Verify the data
#
[0:0] -A FORWARD -j CHECK

#
# Make sure we dont receive internal IP's from the outside.
#
[0:0] -A FORWARD -s 192.168.0.0/24 -i eth0 -j LOG --log-prefix "routing (E1): "
[0:0] -A FORWARD -s 192.168.0.0/24 -i eth0 -j DROP

#
# Allow the packets coming from the inside address range going to 
# the external address range (i.e. loopback)
#
[0:0] -A FORWARD -s 192.168.0.0/24 -d 192.168.0.0/24 -j ACCEPT

#
# Allow outbound traffic on all links
#
[0:0] -A FORWARD -s 192.168.0.0/24 -d ! 192.168.0.0/24 -j ACCEPT


# -- All below is incomning accesses from the outside only


#
# Always/never allow ICMP from the outside
# (ICMP from the inside has already received ACCEPT above) 
#
[0:0] -A FORWARD -p icmp -m state --state ESTABLISHED,RELATED -j ACCEPT
#[0:0] -A FORWARD -p icmp -j ACCEPT 

#
# Always allow traceroute from the outside
#
#[0:0] -A FORWARD -p udp -m udp --sport 32769:65535 --dport 33434:33523 -j ACCEPT


#--- Firewall rules here ---

#
# Machine: ns (192.168.0.3)
# 
[0:0] -A FORWARD -d 192.168.0.3 -p tcp -m tcp --dport domain -j ACCEPT
[0:0] -A FORWARD -d 192.168.0.3 -p udp -m udp --dport domain -j ACCEPT

#
# Machine: ns2 (192.168.0.4)
# 
[0:0] -A FORWARD -d 192.168.0.4 -p tcp -m tcp --dport domain -j ACCEPT
[0:0] -A FORWARD -d 192.168.0.4 -p udp -m udp --dport domain -j ACCEPT

#
# Machine: mail (192.168.0.5)
# 
[0:0] -A FORWARD -d 192.168.0.5 -p tcp -m tcp --dport smtp -j ACCEPT
[0:0] -A FORWARD -d 192.168.0.5 -p tcp -m tcp --dport pop3 -j ACCEPT
[0:0] -A FORWARD -d 192.168.0.5 -p tcp -m tcp --dport iwebmsg-ssl -j ACCEPT
[0:0] -A FORWARD -d 192.168.0.5 -p tcp -m tcp --dport iwebmsg-spell -j ACCEPT
[0:0] -A FORWARD -d 192.168.0.5 -p tcp -m tcp --dport auth -j REJECT --reject-with tcp-reset

#
# Machine: www (192.168.0.6)
# 
[0:0] -A FORWARD -d 192.168.0.6 -p tcp -m tcp --dport http -j ACCEPT
[0:0] -A FORWARD -d 192.168.0.6 -p tcp -m tcp --dport ftp -j ACCEPT
[0:0] -A FORWARD -d 192.168.0.6 -p tcp -m tcp --dport auth -j REJECT --reject-with tcp-reset

#
# Machine: dev (192.168.0.9)
#
[0:0] -A FORWARD -d 192.168.0.9 -p tcp -m tcp --dport ssh -j ACCEPT
[0:0] -A FORWARD -d 192.168.0.9 -p tcp -m tcp --dport http -j ACCEPT
[0:0] -A FORWARD -d 192.168.0.9 -p tcp -m tcp --dport pop3 -j ACCEPT
[0:0] -A FORWARD -d 192.168.0.9 -p tcp -m tcp --dport smtp -j ACCEPT
[0:0] -A FORWARD -d 192.168.0.9 -p tcp -m tcp --dport https -j ACCEPT
[0:0] -A FORWARD -d 192.168.0.9 -p tcp -m tcp --dport ftp -j ACCEPT
[0:0] -A FORWARD -d 192.168.0.9 -p tcp -m tcp --dport auth -j REJECT --reject-with tcp-reset


#------------------------------


#
# Allow only well-known packets on incoming requests, reject and log the
# others
#
[0:0] -A FORWARD -s ! 192.168.0.0/24 -m state --state ESTABLISHED,RELATED -j ACCEPT
[0:0] -A FORWARD -s ! 192.168.0.0/24 -m state --state NEW,INVALID -j LOG --log-prefix "routing (W1): "
[0:0] -A FORWARD -s ! 192.168.0.0/24 -m state --state NEW,INVALID -j DROP


COMMIT

--------------040109050003030901080404--


