From: Louis Garcia <louisg00@bellsouth.net>
Subject: Understanding iptables
Date: 16 May 2002 18:09:48 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <1021586991.1123.24.camel@tiger>
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

I'm just trying to teach myself how to configure a filewall using
iptables. This is my current script:

# Set up a default DROP policy for the built-in chains.
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

## LOOPBACK
# Allow unlimited traffic on the loopback interface.
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

## SYN-FLOODING PROTECTION
iptables -N syn-flood
iptables -A INPUT -i eth0 -p tcp --syn -j syn-flood
iptables -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
iptables -A syn-flood -j DROP

## Make sure NEW tcp connections are SYN packets
iptables -A INPUT -i eth0 -p tcp ! --syn -m state --state NEW -j DROP

## FRAGMENTS
# Log fragments just to see if we get any, and deny them too.
iptables -A INPUT -i eth0 -f -j LOG --log-prefix "IPTABLES FRAGMENTS: "
iptables -A INPUT -i eth0 -f -j DROP

## SPOOFING
# Refuse spoofed packets pretending to be from your IP address.
iptables -A INPUT -i eth0 -s 192.168.1.4/27 -j DROP
# Refuse packets claiming to be from a Class A private network.
iptables -A INPUT -i eth0 -s 10.0.0.0/8 -j DROP
# Refuse packets claiming to be from a Class B private network.
iptables -A INPUT -i eth0 -s 172.16.0.0/12 -j DROP
# Refuse packets claiming to be from a Class C private network.
iptables -A INPUT -i eth0 -s 192.168.0.0/16 -j DROP
# Refuse Class D multicast addresses. Multicast is illegal as a source
# address.
iptables -A INPUT -i eth0 -s 224.0.0.0/4 -j DROP
# Refuse Class E reserved IP addresses.
iptables -A INPUT -i eth0 -s  240.0.0.0/4 -j DROP
# Refuse packets claiming to be to the loopback interface.
iptables -A INPUT -i eth0 -d 127.0.0.1/27 -j DROP
# Refuse broadcast address packets.
iptables -A INPUT -i eth0 -d 192.168.1.31 -j DROP

## DNS server access (53)
# Allow UDP packets in for DNS client from nameservers.
iptables -A INPUT -i eth0 -p udp -s 205.152.16.20 --sport 53 -m \
state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p udp -s 205.152.0.5 --sport 53 -m \
state --state ESTABLISHED -j ACCEPT
# Allow UDP packets to DNS servers from client.
iptables -A OUTPUT -o eth0 -p udp -d 205.152.16.20 --dport 53 -m \
state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp -d 205.152.0.5 --dport 53 -m \
state --state NEW,ESTABLISHED -j ACCEPT

## Web sites access (80,443)
# Allow www outbound to http. (80)
iptables -A INPUT -i eth0 -p tcp --sport 80 -m state --state \
ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 80 -m state --state \
NEW,ESTABLISHED -j ACCEPT
# Allow www outbound to https. (443)
iptables -A INPUT -i eth0 -p tcp --sport 443 -m state --state \
ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 443 -m state --state \
NEW,ESTABLISHED -j ACCEPT

## POP (110)
# Allow pop outbound.
iptables -A INPUT -i eth0 -p tcp --sport 110 -m state --state \
ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 110 -m state --state \
NEW,ESTABLISHED -j ACCEPT

## SMTP (25)
# Allow smtp outbound.
iptables -A INPUT -i eth0 -p tcp --sport 25 -m state --state \
ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 25 -m state --state \
NEW,ESTABLISHED -j ACCEPT

## NTTP (119)
# Allow news outbound.
iptables -A INPUT -i eth0 -p tcp --sport 119 -m state --state \
ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 119 -m state --state \
NEW,ESTABLISHED -j ACCEPT

## FTP (20,21,1024:65535)
# Allow ftp outbound. (21)
iptables -A INPUT -i eth0 -p tcp --sport 21 -m state --state \
ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 21 -m state --state \
NEW,ESTABLISHED -j ACCEPT
1) Active ftp. (20)
iptables -A INPUT -i eth0 -p tcp --sport 20 -m state --state \
ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 20 -m state --state \
ESTABLISHED -j ACCEPT
# 2) Passive ftp. (1024:65535)
iptables -A INPUT -i eth0 -p tcp --sport 1024:65535 --dport \
1024:65535 -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 1024:65535 --dport \
1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT

## AUTH server (113)
# Reject ident probes
iptables -A INPUT -i eth0 -p tcp --dport 113 -j REJECT

## TRACEROUTE
# Outgoing traceroute anywhere.
iptables -A OUTPUT -o eth0 -p udp --sport 32769:65535 --dport \
33434:33523 -m state --state NEW -j ACCEPT

## ICMP
# We accept icmp in if it is "related" to other connections (e.g a time
# exceeded (11) from a traceroute) or it is part of an "established"
# connection (e.g. an echo reply (0) from an echo-request (8)).
iptables -A INPUT -i eth0 -p icmp -m state --state ESTABLISHED,RELATED \
-j ACCEPT
# We always allow icmp out.
iptables -A OUTPUT -o eth0 -p icmp -m state --state \
NEW,ESTABLISHED,RELATED -j ACCEPT


I'm on a workstation which has no services to offer. Everything is
working great, but I want to add a few things like ability to mount nfs
shares, samba client, ssh out, ping out, and traceroute out. Can someone
help me out?

Also do I have do iptables -P OUTPUT DROP or can I
iptables -P OUTPUT ACCEPT  to allow anything out??


Thanks --Lou



