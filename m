From: "security" <security@lea-linux.com>
Subject: Re: list delete bug: kernel crash
Date: Tue, 31 Aug 2004 15:17:46 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <000a01c48f5c$e8560050$0a00a8c0@aziz>
References: <003701c48ee9$e1ad1f40$0a00a8c0@aziz><1093949437.2435.4.camel@nienna.balabit>
	<001c01c48f4f$2a7f7140$0a00a8c0@aziz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: KOVACS Krisztian <hidden@balabit.hu>
Cc: netfilter@lists.netfilter.org


----- Original Message ----- 
From: "security" <security@lea-linux.com>
To: "KOVACS Krisztian" <hidden@balabit.hu>
Cc: <netfilter@lists.netfilter.org>
Sent: Tuesday, August 31, 2004 1:39 PM
Subject: Re: list delete bug: kernel crash


>
>>
>>  As always, the first thing you should try is testing the memory of
>> your computer. The problems seems to be caused by trying to call
>> ip_nat_setup_info() on an already confirmed connection, which is known
>> to cause hash corruption.
>>
>
> I have launch memtest86 and, surprise, i have got memory error. I think i 
> have found the faulty module memory (no more memtest86 error when i leave 
> it from my computer).
> So i will test some day to see if i got no more crash.
>

Hum still have crash. I have test again my memory, made 10 pass with 
memtest86 without error found.

>>BTW, while running memtest, could you send us the nat table of your
>>iptables ruleset, along with the routing setup? And also a list of
>>loaded (iptables-related) kernel modules would be useful.


Here are informations:

-----------------------------
NAT:
-----------------------------

/usr/sbin/iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o ppp0 -j 
MASQUERADE

#Bittorent redirect to 192.168.0.10

iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 6881:6889 -j 
DNAT --to-dest 192.168.0.10
iptables -A FORWARD -p tcp -i ppp0 --dport 6881:6889 -d 192.168.0.10 -j 
ACCEPT
iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 6881:6889 -j 
DNAT --to-dest 192.168.0.10
iptables -A FORWARD -p udp -i ppp0 --dport 6881:6889 -d 192.168.0.10 -j 
ACCEPT

# nat module for ftp and irc

modprobe ip_nat_ftp
modprobe ip_nat_irc





----------------------------------
Firewall rules
----------------------------------

# Flush all rules in chains
iptables -F

#delete all user's chains
iptables -X

#Forward rules

#Create a new chain: KEEP_STATE
iptables -N KEEP_STATE
iptables -F KEEP_STATE

#Drop packet in bad states
iptables -A KEEP_STATE -m state --state INVALID -j DROP

#Accept packet in good states
iptables -A KEEP_STATE -m state --state RELATED,ESTABLISHED -j ACCEPT

#deny bad packet and log them
iptables -A FORWARD -p tcp --tcp-flags ALL FIN,URG,PSH -m limit --limit 
5/minute -j LOG --log-level notice --log-prefix "NMAP-XMAS: "
iptables -A FORWARD -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
iptables -A FORWARD -p tcp --tcp-flags SYN,FIN SYN,FIN -m limit --limit 
5/minute -j LOG --log-level notice --log-prefix "SYN/FIN: "
iptables -A FORWARD -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN,RST -m limit --limit 
5/minute -j LOG --log-level notice --log-prefix "SYN/RST: "
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN,RST -j DROP

#Drop RST/ACKs to limit OS detection throught pinging
iptables -A FORWARD -p tcp --tcp-flags RST RST,ACK -m limit --limit 
5/minute -j LOG --log-level notice --log-prefix "RST/ACK: "
iptables -A FORWARD -p tcp --tcp-flags RST RST,ACK -j DROP


#drop possible directory traversal port
iptables -A FORWARD -p tcp --dport 2301 -j DROP

#deny pings from outside and accept local / network
iptables -A FORWARD -p icmp --icmp-type 0/0 -d 192.168.0.0/24 -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type 0/0 -m limit --limit 5/minute -j 
LOG --log-level notice --log-prefix "Drop Echo Reply: "
iptables -A FORWARD -p icmp --icmp-type 0/0 -j DROP

#reject identd to avoid timeout on irc connect
iptables -A FORWARD -p tcp --dport 113 -j REJECT
#Pass all boxes to the keep_state chain
iptables -A FORWARD -j KEEP_STATE


#################### BLOCK SPECIFIC HOSTS #######################
iptables -A FORWARD -s 194.237.107.150 -j DROP
iptables -A FORWARD -d 194.237.107.150 -j DROP


#Allow outgoing traffic
iptables -A FORWARD -s 192.168.0.0/24 -j ACCEPT

#Deny all traffic not define by any rules
iptables -A FORWARD -j DROP

## own gateway input/ouput rules

#deny bad packet and log them
iptables -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -m limit --limit 
5/minute -j LOG --log-level notice --log-prefix "NMAP-XMAS: "
iptables -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -m limit --limit 
5/minute -j LOG --log-level notice --log-prefix "SYN/FIN: "
iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -m limit --limit 
5/minute -j LOG --log-level notice --log-prefix "SYN/RST: "
iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP

#Drop RST/ACKs to limit OS detection throught pinging
iptables -A INPUT -p tcp --tcp-flags RST RST,ACK -m limit --limit 5/minute -j 
LOG --log-level notice --log-prefix "RST/ACK: "
iptables -A INPUT -p tcp --tcp-flags RST RST,ACK -j DROP


#drop possible directory traversal port
iptables -A INPUT -p tcp --dport 2301 -j DROP
iptables -A OUTPUT -p icmp --icmp-type 0/0 -d 192.168.0.0/24 -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type 0/0 -d 127.0.0.0/24 -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type 0/0 -m limit --limit 5/minute -j 
LOG --log-level notice --log-prefix "Drop icmp echo:"
iptables -A OUTPUT -p icmp --icmp-type 0/0 -j DROP


#################### BLOCK SPECIFIC HOSTS #######################
iptables -A INPUT -s 194.237.107.150 -j DROP
iptables -A INPUT -d 194.237.107.150 -j DROP
iptables -A OUTPUT -s 194.237.107.150 -j DROP
iptables -A OUTPUT -d 194.237.107.150 -j DROP


## irc behavior
iptables -A INPUT -p tcp --dport 113 -j REJECT

#Pass all in keep_state
iptables -A INPUT -j KEEP_STATE

#Allow SSH input/output
iptables -A INPUT -p tcp  --dport 22 -j ACCEPT
iptables -A INPUT -p tcp  --sport 22 -j ACCEPT
#Allow all local traffic
iptables -A INPUT -p tcp -s 127.0.0.1 -j ACCEPT
iptables -A INPUT -p udp -s 127.0.0.1 -j ACCEPT
iptables -A INPUT -p icmp -s 127.0.0.1 -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.0.0/24 -j ACCEPT
iptables -A INPUT -p udp -s 192.168.0.0/24 -j ACCEPT
iptables -A INPUT -p icmp -s 192.168.0.0/24 -j ACCEPT

#Allow ping and traceroute from this host, reply for staff adsl
iptables -A INPUT -p icmp --icmp-type 0/0 -i ppp0 -j ACCEPT

#Allow DC
#iptables -A INPUT -p tcp --sport 14567 -j ACCEPT
#iptables -A INPUT -p udp --sport 14567 -j ACCEPT
iptables -A INPUT -p tcp --dport 14567 -j ACCEPT
iptables -A INPUT -p udp --dport 14567 -j ACCEPT
#Allow DNS from this host

#Block netbios
iptables -A INPUT -i ppp0 -p tcp --dport 139 -j REJECT
iptables -A INPUT -p tcp --sport 53 -j ACCEPT
iptables -A INPUT -p udp --sport 53 -j ACCEPT

#Allow webmin & web
iptables -A INPUT -p tcp --dport 10000 -j ACCEPT
#iptables -A INPUT -p tcp --dport 80 -j ACCEPT

#Allow smtp
iptables -A INPUT -p tcp --dport 25 -j ACCEPT
#Allow cvs
iptables -A INPUT -p tcp --dport 2401 -j ACCEPT
#Allow stream server
iptables -A INPUT -p tcp --dport 8090 -j ACCEPT
#Allow ftp from this host
iptables -A INPUT -p tcp --sport 21 -j ACCEPT
iptables -A INPUT -p tcp --sport 20 -j ACCEPT

#Allow dhcpd for local network
iptables -A INPUT -i eth0 -p tcp --sport 68 --dport 67 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --sport 68 --dport 67 -j ACCEPT

#Allow emule for natting
iptables -A INPUT -p tcp -s 0/0 --dport 4661 -j ACCEPT
iptables -A INPUT -p tcp -s 0/0 --dport 4662 -j ACCEPT
iptables -A INPUT -p tcp -s 0/0 --dport 4711 -j ACCEPT
iptables -A INPUT -p udp -s 0/0 --dport 4665 -j ACCEPT
iptables -A INPUT -p udp -s 0/0 --dport 4672 -j ACCEPT

#Deny all other
iptables -A INPUT -j DROP



