From: "Alexis" <alexis@attla.net.ar>
Subject: Fw: Multihomed firewall and port forwarding nightmare ))):-(
Date: Wed, 14 Jan 2004 22:33:43 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00db01c3db07$9daf47f0$0200000a@heretic>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


----- Original Message -----=20
From: "Alexis" <alexis@attla.net.ar>
To: "Caracal - G. Hostettler" <100112_2660@bluewin.ch>
Sent: Wednesday, January 14, 2004 10:31 PM
Subject: Re: Multihomed firewall and port forwarding nightmare ))):-(


> this is the solution for the schema with 3 external interfaces.
> First some basics, you dont need 3 default routes, as the word say, the
> DEFAULT is the route that packets will take if no other more specific
route
> is in the routing table, so if you have one default this is enough. In
some
> devices, having 3 defaults will (in some way) do a load balancing by
flows,
> im not really shure if it works in linux, but i could say it isnt.
>
> Having 3 interfaces to the same lan is not a good idea, but if you think
> you're protected with this schema, so you can use it. Those interfaces are
> connected and remember the term "connected" to the same net, so all
packets
> will not follow any route at all, all packets in a connecetd network are
> switched, but not routed, this means that you dont need at all to specify
a
> default route, but, in order to keep the mind sanity, we will think that
we
> need the default route. or better said, the default route pointing to a
next
> hop.
>
> so , having 3 interfaces for wan, 1 router for gateway (if the router
> crashed, all 3 wan interfaces will stop working) and one lan interface you
> need to do this in order to get some "backup" route if some ethernet wan
> interfaces gets down.
>
> ip route add default dev eth1
> ip route add default dev eth2 metric 10
> ip route add default dev eth3 metric 20
>
> so, all outgoing traffic will use eth1 when its up and so on.
>
> All incoming traffic will use its assigned interface (the router will
check
> its arp table and then use the MAC address in his table to switch the
packet
> with this mac address as destination)
>
>
> now you have a "correct" routing.
>
> how i didnt read (and i wont do this :) ) the rules that youve posted, ill
> assume for internal LAN the following IP for the servers
>
> 192.168.124.5 ftp
> 192.168.124.6 mail
> 192.168.124.7 http
>
> (i assume all LAN hosts have the Firewall IP address as default next hop)
>
> this are the MOST basic set of rules for your  schema
>
> modprobe ip_nat_ftp
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
>
> iptables -A FORWARD -i lo -j ACCEPT
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> #all outgoing traffic allowed
> iptables -A FORWARD -i eth0 -m state --state NEW -j ACCEPT
> #incoming traffic restricted by services
> iptables -A FORWARD -i eth1 -d 195.65.176.162 -p tcp --dport 21 -m
> state --state NEW -j ACCEPT
> iptables -A FORWARD -i eth2 -d 195.65.176.163 -p tcp --dport 110 -m
> state --state NEW -j ACCEPT
> iptables -A FORWARD -i eth2 -d 195.65.176.163 -p tcp --dport 25 -m
> state --state NEW -j ACCEPT
> iptables -A FORWARD -i eth3 -d 195.65.176.164 -p tcp --dport 80 -m
> state --state NEW -j ACCEPT
> iptables -A FORWARD -i eth4 -d 195.65.176.164 -p tcp --dport 443 -m
> state --state NEW -j ACCEPT
>
> echo 1 > /proc/sys/net/ipv4/ip_forward
>
> #now the POSTROUTING and PREROUTING statements (in order to figure, the
> following statements are nasty, dirty and ugly too :) )
>
> iptables -t nat -A PREROUTING -i eth1 -d 195.65.176.162 -p tcp --dport
21 -j
> DNAT --to 192.168.124.5:21
> iptables -t nat -A PREROUTING -i eth2 -d 195.65.176.163 -p tcp --dport
25 -j
> DNAT --to 192.168.124.6:25
> iptables -t nat -A PREROUTING -i eth2 -d 195.65.176.163 -p tcp --dport
> 110 -j DNAT --to 192.168.124.6:110
> iptables -t nat -A PREROUTING -i eth3 -d 195.65.176.164 -p tcp --dport
80 -j
> DNAT --to 192.168.124.7:80
> iptables -t nat -A PREROUTING -i eth3 -d 195.65.176.164 -p tcp --dport
> 443 -j DNAT --to 192.168.124.7:443
>
> iptables -t nat -A POSTROUTING -o eth1 -s 192.168.124.5 -j SNAT --to
> 195.65.176.162
> iptables -t nat -A POSTROUTING -o eth2 -s 192.168.124.6 -j SNAT --to
> 195.65.176.163
> iptables -t nat -A POSTROUTING -o eth3 -s 192.168.124.7 -j SNAT --to
> 195.65.176.164
>
>
> ill repeat, this is a nasty way to achieve the goal, ill use some chains,
> other PRE & POST routing statements and for shure, only one interface.
>
>
> try this and then tell us a tail how it was
>
>
> regards
>
>
>
>
> ----- Original Message -----=20
> From: "Caracal - G. Hostettler" <100112_2660@bluewin.ch>
> To: <netfilter@lists.netfilter.org>
> Sent: Wednesday, January 14, 2004 6:12 PM
> Subject: Multihomed firewall and port forwarding nightmare ))):-(
>
>
> Hi!
>
> Using ipchains for a while and relatively new to iptables.
>
> I have to setup a somewhat special multihomed firewall:
> It has three external interfaces with public addresses, one for http, one
> for both smtp and pop3 and the third for ftp. These are real hardware
NICS,
> not virtual.
>
> It has one internal interface which acts as the gateway for the LAN.
>
>           Debian 3.0r1 iptables 1.2.6a kernel 2.4.18           ISP router
>         +--------------------------------------------+
> +----------------+
>         |                  195.65.176.162 ftp        |     |
> |
> LAN --- +192.168.124.253   195.65.176.163 smtp/pop3  + --- +
195.65.176.161
> + --- Internet
>         |                  195.65.176.164 http       |     |
> |
>         +--------------------------------------------+
> +----------------+
>
> LAN: 192.168.124.0/24, public IP range: 195.65.176.160/29
>
> DNSes are hosted by the ISP. I have local DNSes for the LAN.
>
> What is working:
>
> From the LAN, everything works fine, all 4 protocols are working from any
> client, all port redirections are fine.
> From the public IP range, as you might think, same thing, everything works
> fine from any test workstation plugged in it.
>
> The problem is from the Internet (aka going through the firewall...).
> Every request to the http server run fine, both ICMP's and port 80
> forwarding.
> But I cannot even ping the smtp/pop3 external interface, and ports 25 and
> 110 do connect, just send no packets back, then disconnection occurs after
> workstation timeout !
> The same thing occurs with the ftp connection.
>
> After some days and nights of fumbling and reading, I turn to the list.
> Sorry if this topic has been already submitted and solved, I could not
find
> it.
>
> Pleeeeeeease help !
>
> Here are the output of iptables-save as well as the routing table of the
> firewall:
>
> # Generated by iptables-save v1.2.6a on Wed Jan 14 23:44:21 2004
>
> *mangle
>
> :PREROUTING ACCEPT [338:163396]
>
> :INPUT ACCEPT [26:1386]
>
> :FORWARD ACCEPT [297:161318]
>
> :OUTPUT ACCEPT [68:8805]
>
> :POSTROUTING ACCEPT [313:161958]
>
> COMMIT
>
> # Completed on Wed Jan 14 23:44:21 2004
>
> # Generated by iptables-save v1.2.6a on Wed Jan 14 23:44:21 2004
>
> *filter
>
> :INPUT DROP [0:0]
>
> :FORWARD DROP [0:0]
>
> :OUTPUT DROP [0:0]
>
> :allowed - [0:0]
>
> :bad_tcp_packets - [0:0]
>
> :icmp_packets - [0:0]
>
> :tcp_packets - [0:0]
>
> :udp_packets - [0:0]
>
> -A INPUT -p tcp -j bad_tcp_packets
>
> -A INPUT -s 192.168.124.0/255.255.255.0 -i eth0 -j ACCEPT
>
> -A INPUT -s 127.0.0.1 -i lo -j ACCEPT
>
> -A INPUT -s 192.168.124.254 -i lo -j ACCEPT
>
> -A INPUT -s 195.65.176.162 -i lo -j ACCEPT
>
> -A INPUT -s 195.65.176.163 -i lo -j ACCEPT
>
> -A INPUT -s 195.65.176.164 -i lo -j ACCEPT
>
> -A INPUT -i eth0 -p udp -m udp --sport 68 --dport 67 -j ACCEPT
>
> -A INPUT -d 195.65.176.162 -m state --state RELATED,ESTABLISHED -j ACCEPT
>
> -A INPUT -d 195.65.176.163 -m state --state RELATED,ESTABLISHED -j ACCEPT
>
> -A INPUT -d 195.65.176.164 -m state --state RELATED,ESTABLISHED -j ACCEPT
>
> -A INPUT -i eth1 -p tcp -j tcp_packets
>
> -A INPUT -i eth1 -p udp -j udp_packets
>
> -A INPUT -i eth1 -p icmp -j icmp_packets
>
> -A INPUT -i eth2 -p tcp -j tcp_packets
>
> -A INPUT -i eth2 -p udp -j udp_packets
>
> -A INPUT -i eth2 -p icmp -j icmp_packets
>
> -A INPUT -i eth3 -p tcp -j tcp_packets
>
> -A INPUT -i eth3 -p udp -j udp_packets
>
> -A INPUT -i eth3 -p icmp -j icmp_packets
>
> -A INPUT -d 224.0.0.0/255.0.0.0 -i eth1 -j DROP
>
> -A INPUT -d 224.0.0.0/255.0.0.0 -i eth2 -j DROP
>
> -A INPUT -d 224.0.0.0/255.0.0.0 -i eth3 -j DROP
>
> -A INPUT -m limit --limit 3/min --limit-burst 3 -j LOG --log-prefix "IPT
> INPUT packet died: " --log-level 7
>
> -A FORWARD -p tcp -j bad_tcp_packets
>
> -A FORWARD -i eth0 -j ACCEPT
>
> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
>
> -A FORWARD -d 192.168.124.103 -p tcp -m tcp --dport 80 -j ACCEPT
>
> -A FORWARD -d 192.168.124.104 -p tcp -m tcp --dport 25 -j ACCEPT
>
> -A FORWARD -d 192.168.124.104 -p tcp -m tcp --dport 110 -j ACCEPT
>
> -A FORWARD -d 192.168.124.105 -p tcp -m tcp --dport 21 -j ACCEPT
>
> -A FORWARD -m limit --limit 3/min --limit-burst 3 -j LOG --log-prefix "IPT
> FORWARD packet died: " --log-level 7
>
> -A OUTPUT -p tcp -j bad_tcp_packets
>
> -A OUTPUT -s 127.0.0.1 -j ACCEPT
>
> -A OUTPUT -s 192.168.124.254 -j ACCEPT
>
> -A OUTPUT -s 195.65.176.162 -j ACCEPT
>
> -A OUTPUT -s 195.65.176.163 -j ACCEPT
>
> -A OUTPUT -s 195.65.176.164 -j ACCEPT
>
> -A OUTPUT -m limit --limit 3/min --limit-burst 3 -j LOG --log-prefix "IPT
> OUTPUT packet died: " --log-level 7
>
> -A allowed -p tcp -m tcp --tcp-flags SYN,RST,ACK SYN -j ACCEPT
>
> -A allowed -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
>
> -A allowed -p tcp -j DROP
>
> -A bad_tcp_packets -p tcp -m tcp --tcp-flags SYN,ACK SYN,ACK -m
> state --state NEW -j REJECT --reject-with tcp-reset
>
> -A bad_tcp_packets -p tcp -m tcp ! --tcp-flags SYN,RST,ACK SYN -m
> state --state NEW -j LOG --log-prefix "NEW not SYN: " --log-level 7
>
> -A bad_tcp_packets -p tcp -m tcp ! --tcp-flags SYN,RST,ACK SYN -m
> state --state NEW -j DROP
>
> -A icmp_packets -p icmp -m icmp --icmp-type 8 -j ACCEPT
>
> -A icmp_packets -p icmp -m icmp --icmp-type 11 -j ACCEPT
>
> -A tcp_packets -p tcp -m tcp --dport 21 -j allowed
>
> -A tcp_packets -p tcp -m tcp --dport 80 -j allowed
>
> -A udp_packets -d 195.65.176.167 -i eth1 -p udp -m udp --dport 135:139 -j
> DROP
>
> COMMIT
>
> # Completed on Wed Jan 14 23:44:21 2004
>
> # Generated by iptables-save v1.2.6a on Wed Jan 14 23:44:21 2004
>
> *nat
>
> :PREROUTING ACCEPT [32:1675]
>
> :POSTROUTING ACCEPT [0:0]
>
> :OUTPUT ACCEPT [24:1752]
>
> -A PREROUTING -d 195.65.176.164 -p tcp -m tcp --dport 80 -j
> DNAT --to-destination 192.168.124.103:80
>
> -A PREROUTING -d 195.65.176.163 -p tcp -m multiport --ports smtp,pop3 -j
> DNAT --to-destination 192.168.124.104
>
> -A PREROUTING -d 195.65.176.162 -p tcp -m tcp --dport 21 -j
> DNAT --to-destination 192.168.124.105:21
>
> -A POSTROUTING -d 192.168.124.105 -p tcp -m tcp --dport 21 -j
> SNAT --to-source 192.168.124.254
>
> -A POSTROUTING -d 192.168.124.104 -p tcp -m multiport --ports smtp,pop3 -j
> SNAT --to-source 192.168.124.254
>
> -A POSTROUTING -d 192.168.124.103 -p tcp -m tcp --dport 80 -j
> SNAT --to-source 192.168.124.254
>
> -A POSTROUTING -o eth1 -j SNAT --to-source 195.65.176.162
>
> -A POSTROUTING -o eth2 -j SNAT --to-source 195.65.176.163
>
> -A POSTROUTING -o eth3 -j SNAT --to-source 195.65.176.164
>
> COMMIT
>
> # Completed on Wed Jan 14 23:44:21 2004
>
> ---------------------------------------------------------------
>
> Kernel IP routing table
>
> Destination Gateway Genmask Flags Metric Ref Use Iface
>
> 195.65.176.160 * 255.255.255.248 U 0 0 0 eth1
>
> 195.65.176.160 * 255.255.255.248 U 0 0 0 eth2
>
> 195.65.176.160 * 255.255.255.248 U 0 0 0 eth3
>
> localnet * 255.255.255.0 U 0 0 0 eth0
>
> default 195.65.176.161 0.0.0.0 UG 0 0 0 eth3
>
> default 195.65.176.161 0.0.0.0 UG 0 0 0 eth2
>
> default 195.65.176.161 0.0.0.0 UG 0 0 0 eth1
>
> default 192.168.124.253 0.0.0.0 UG 0 0 0 eth0
>
>
>
> Caracal - G. Hostettler
>
>
> e-mail travaux g=E9n=E9raux : info@caracal.ch
> e-mail travaux webmaster : info@caracal.ch
> e-mail personnel : ghostettler@caracal.ch
>



