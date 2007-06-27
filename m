From: "JOR HAY" <flexbumpchest@gmail.com>
Subject: Rule added,
	packets no longer forwarded across interfaces. What's wrong with my
	rule?
Date: Tue, 26 Jun 2007 22:33:17 -0500
Message-ID: <b7b807230706262033p1aba026bg8a4aac93349c2a70@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=Xo/18tlopUQLhAutjVjTvF4KeMG4hFPL1/9Fwq8FUO4RNe3IAaDdrXnthxIdm/KZAqtPie4E6GzGuJ99qryUeGFfAP97dbjkoI+b5dRdSjtGraNTf+iXc1pXN6hjY+gVnE67+OX9dF1C4E9JghDPCDbNmmbca1pJbrlHOLlsLOM=
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi everybody,
I'm using openswan for site to site vpns.  It creates an ipsec0
interface with a public ip address bound to it (xx.xx.xx.254), and
private subnets are routed, encrypted, through it.  I then have
OpenVPN running on tun0, with a private ip, and OpenVPN's dhcp server
gives connecting clients addresses in the same range.  Before I apply
my netfilter rules, packets are forwarded from one private subnet to
another, like so:
client(in 172.23.23.0/24) --openvpn--> tun0 -ip_forward-> ipsec0
--openswan--> destination private net (10.1.182.1/32).

Everything works.  Recently, however, the admin of the other side
(10.1.182.1) told me I had to use a different range on my end, as
another client of his was using 172.23.*.  I said fine, I can change
my clients to 172.25.25.0/24 -- but I have vpns to multiple places and
I don't really want to change the client IPs, I want to nat them again
if their destination is 10.1.182.1.

I picked up the bulk of these rules from a simple script that's been
working for me for a long time off some site.  The only thing I've
really added that makes it not work is:
-A POSTROUTING -s 10.1.182.1/32 -j SNAT --to 172.25.25.2
So I added the line to the rules I already had -- now I can still do
most things, but I can't ping any network that goes out the ipsec0
interface (even nets like 10.10.10.0/24 that have no rules on this
firewall!).  What am I doing wrong?

My rules:

#The NAT portion of the ruleset. Used for Network Address Transalation.
#Usually not needed on a typical web server, but it's there if you need it.
*nat
:PREROUTING ACCEPT [127173:7033011]
:POSTROUTING ACCEPT [31583:2332178]
:OUTPUT ACCEPT [32021:2375633]
#Change source of packets to site1
-A POSTROUTING -s 10.1.182.1/32 -j SNAT --to 172.25.25.2
COMMIT

#The Mangle portion of the ruleset. Here is where unwanted packet
types get dropped.
#This helps in making port scans against your server a bit more time
consuming and difficult, but not impossible.
*mangle
:PREROUTING ACCEPT [444:43563]
:INPUT ACCEPT [444:43563]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [402:144198]
:POSTROUTING ACCEPT [402:144198]
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
COMMIT

#The FILTER section of the ruleset is where we initially drop all
packets and then selectively open certain ports.
#We will also enable logging of all dropped requests.
*filter
:INPUT DROP [1:242]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
:LOG_DROP - [0:0]
:LOG_ACCEPT - [0:0]
:icmp_packets - [0:0]

#INPUT RULES
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

#SSH SECTION
-A INPUT -p tcp -m tcp --dport 65324 -j LOG_ACCEPT

#OPENSWAN IPSEC site-to-site VPN ports
-A INPUT -p udp -m udp -d xx.xx.xx.254 --dport 500 -j LOG_ACCEPT
-A INPUT -p udp -m udp -d xx.xx.xx.254 --dport 4500 -j LOG_ACCEPT
-A INPUT -p 50 -d xx.xx.xx.254 -j LOG_ACCEPT
#OPENVPN
-A INPUT -p udp -m udp -d xx.xx.xx.254 --dport 1194 -j LOG_ACCEPT

#allow * on loopback
-A INPUT -s 127.0.0.1 -j ACCEPT
-A INPUT -p icmp -j icmp_packets
# Now drop everything we didn't allow in
-A INPUT -j LOG_DROP

#Next, we cover the OUTPUT rules, or the rules for all outgoing traffic.
#Note how at the end we log any outbound packets that are not accepted.
-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 20 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 21 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 23 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 25 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 26 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 53 -j ACCEPT
-A OUTPUT -p udp -m udp --dport 53 -j ACCEPT
-A OUTPUT -p udp -m udp --sport 53 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 80 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 90 -j ACCEPT
-A OUTPUT -p udp -m udp --dport 123 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 443 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 783 -j ACCEPT
-A OUTPUT -p udp -m udp --dport 500 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 993 -j ACCEPT
-A OUTPUT -p 50 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 1025:65535 -j ACCEPT
-A OUTPUT -p udp -m udp --dport 1025:65535 -j ACCEPT
# Allow shell traceroutes to anywhere (replies come in as ICMP)
-A OUTPUT -p udp --sport 32769:65535 --dport 33434:33523 -j ACCEPT
# Allow all loopback
-A OUTPUT -d 127.0.0.1 -j ACCEPT
-A OUTPUT -p icmp -j icmp_packets
-A OUTPUT -j LOG_DROP

#Here we have 2 sets of logging rules. One for dropped packets to log
all dropped requests and one for accepted packets,
# should we wish to log any accepted requesets.
-A LOG_DROP -j LOG --log-prefix "[IPTABLES DROP] : " --log-tcp-options
--log-ip-options
-A LOG_DROP -j DROP
-A LOG_ACCEPT -j LOG --log-prefix "[IPTABLES ACCEPT] : "
--log-tcp-options --log-ip-options
-A LOG_ACCEPT -j ACCEPT

#And finally, a rule to deal with ICMP requests. We drop all ping
requests except from our own server.
# 0 = echo reply, 3 = dest unreachable, 8 = echo request, 11 =
timeout, 30 = traceroute reply
-A icmp_packets -p icmp -m icmp --icmp-type 0 -j ACCEPT
-A icmp_packets -p icmp -m icmp --icmp-type 3 -j ACCEPT
-A icmp_packets -p icmp -m icmp --icmp-type 8 -m limit --limit
2/second -j ACCEPT
-A icmp_packets -p icmp -m icmp --icmp-type 11 -j ACCEPT
-A icmp_packets -p icmp -m icmp --icmp-type 30 -j ACCEPT
-A icmp_packets -p icmp -m icmp -j LOG_DROP
COMMIT

-----
Thanks for anyone who helps me out

