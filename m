From: "Daniel Desages" <daniel@desages.com>
Subject: Strange firewall problem, help needed
Date: Sat, 1 Feb 2003 13:16:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c2c9eb$b2285380$0300a8c0@pacifique>
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

Hello,
First sorry for this long message, I'm trying to give as much info as I =
can.

I have a strange problem, I've really read all FAQs I could find, but
couldn't find an answer to it :=20
- I have a Debian Gnu/Linux firewall with kernel 2.4.20, iptables =
v1.2.7a.
It's a pentium 133 MHz,=20
  connected to a cable modem (dynamic ip) on one side and static ip
192.168.0.1 on the other.
- Behind it, two computers :=20
	One is a dual-boot windows 2000/linux, static ip 192.168.0.2
	The other one is dual-boot WindowsXP/linux. static ip 192.168.0.3
- The firewall is also used as a dns server, mail gateway (smtp + pop) =
for
the lan.
- The first client box can go on the internet with no problem.
- The second client can go on the internet with no problem under linux, =
the
normal connection spped is about 40 KB/s
  Under windows XP, the connection is established, then the speed slows =
down
rapidly and constantly until it's 2.6 KB/s.=20
  then it stays at that speed :( I checked the log, there is nothing =
related
to packets dropped. Ftp connection, if I use "passive", is slow while
  connecting and gives 	timeout while retrieving the dir list

If I use squid proxy on the firewall and set it up in the XP box, it's =
fast
as it should be. I should also say that I checked the speed in the lan,=20
It's normal between the three computers.

I tried to play with MTU, but didn't get different results. Could you =
please
tell me if there is something wrong with my iptables script ?=20
You'll notice it's kindda paranoid setup, maybe too much ?

Thanks in advance for your help. No the details :=20


The iptables modules that are loaded are (lsmod):

ipt_state                568   1  (autoclean)
cls_u32                 4220   0  (autoclean)
ip_conntrack_ftp        3824   1  (autoclean)
ip_nat_ftp              2928   0  (unused)
ipt_MASQUERADE          1240   1  (autoclean)
ipt_REDIRECT             856   0  (autoclean)
ipt_LOG                 3224  11  (autoclean)
iptable_mangle          2192   0  (autoclean) (unused)
iptable_filter          1668   1  (autoclean)
iptable_nat            14488   2  [ip_nat_ftp ipt_MASQUERADE =
ipt_REDIRECT]
ip_tables              10616   9  [ipt_state ipt_MASQUERADE ipt_REDIRECT
ipt_LOG iptable_mangle iptable_filter iptable_nat]
ip_conntrack           16768   3  [ipt_state ip_conntrack_ftp ip_nat_ftp
ipt_MASQUERADE ipt_REDIRECT iptable_nat]
af_packet              12008   0  (autoclean)

Here is what route -n give :=20
Destination     Passerelle      Genmask         Indic Metric Ref    Use
Iface
212.198.135.0   0.0.0.0         255.255.255.0   U     0      0        0 =
eth1
192.168.0.0     0.0.0.0         255.255.255.0   U     0      0        0 =
eth0
0.0.0.0         212.198.135.1   0.0.0.0         UG    0      0        0 =
eth1

And below is the firewall script I use (genereated with ipmasq to
dynamically set eth1 ip address:

#: Interfaces found:
#:   eth1	212.198.135.235/255.255.255.0
#:   eth1	212.198.135.235/255.255.255.0
#:   eth0	192.168.0.1/255.255.255.0
#: Turn off forwarding for 2.1 kernels
#: Disable automatic IP defragmentation
#: Disable  ip_dynaddr
echo "0" > /proc/sys/net/ipv4/ip_forward
echo "0" > /proc/sys/net/ipv4/ip_dynaddr
#: Flush all and set default policy of deny.
/sbin/iptables -P INPUT DROP
/sbin/iptables -P OUTPUT DROP
/sbin/iptables -P FORWARD DROP
/sbin/iptables -F INPUT
/sbin/iptables -F OUTPUT
/sbin/iptables -F FORWARD
/sbin/iptables -t mangle -P PREROUTING ACCEPT
/sbin/iptables -t mangle -P OUTPUT ACCEPT
/sbin/iptables -t mangle -F PREROUTING
/sbin/iptables -t mangle -F OUTPUT
/sbin/iptables -t nat -P PREROUTING ACCEPT
/sbin/iptables -t nat -P POSTROUTING ACCEPT
/sbin/iptables -t nat -P OUTPUT ACCEPT
/sbin/iptables -t nat -F PREROUTING
/sbin/iptables -t nat -F POSTROUTING
/sbin/iptables -t nat -F OUTPUT
#: Forward packets among internal networks
#: Accept all packets coming in from the loopback interface
/sbin/iptables -A INPUT -j ACCEPT -i lo
#: Deny and log all packets trying to come in from a 127.0.0.0/8 address
#: over a non-'lo' interface
/sbin/iptables -A INPUT -j LOG -i ! lo -s 127.0.0.1/255.0.0.0
/sbin/iptables -A INPUT -j DROP -i ! lo -s 127.0.0.1/255.0.0.0
#: r=E8gles de DNAT=20
#: Accept dumb broadcast packets on internal interfaces
/sbin/iptables -A INPUT -j ACCEPT -i eth0 -d 255.255.255.255/32
#: Accept packets from internal networks on internal interfaces
/sbin/iptables -A INPUT -j ACCEPT -i eth0 -s 192.168.0.1/255.255.255.0
#: Accept multicast packets (adresses 224.0.0.0) from internal =
interfaces
/sbin/iptables -A INPUT -j ACCEPT -i eth0 -d 224.0.0.0/4 -p ! tcp
#: Disallow and log packets trying to come in over external interfaces
#: from hosts claiming to be internal
/sbin/iptables -A INPUT -j LOG -i eth1 -s 192.168.0.1/255.255.255.0
/sbin/iptables -A INPUT -j DROP -i eth1 -s 192.168.0.1/255.255.255.0
#: Firewall for incoming packets
/sbin/iptables -A INPUT -j ACCEPT -i eth1 -d =
212.198.135.235/255.255.255.0
-p tcp --destination-port ssh
/sbin/iptables -A INPUT -j ACCEPT -i eth1 -d =
212.198.135.235/255.255.255.0
-p tcp --destination-port auth
/sbin/iptables -A INPUT -j ACCEPT -i eth1 -d =
212.198.135.235/255.255.255.0
-p tcp --destination-port bootpc
/sbin/iptables -A INPUT -j ACCEPT -i eth1 -d =
212.198.135.235/255.255.255.0
-p tcp --destination-port www
/sbin/iptables -A INPUT -j ACCEPT -i eth1 -d =
212.198.135.235/255.255.255.0
-p udp --destination-port bootpc
/sbin/iptables -A INPUT -j DROP -i eth1 -d 212.198.135.235/255.255.255.0 =
-p
tcp --destination-port nameserver
/sbin/iptables -A INPUT -j DROP -i eth1 -d 212.198.135.235/255.255.255.0 =
-p
tcp --destination-port smtp
/sbin/iptables -A INPUT -j DROP -i eth1 -d 212.198.135.235/255.255.255.0 =
-p
tcp --destination-port pop3
/sbin/iptables -A INPUT -j DROP -i eth1 -d 212.198.135.235/255.255.255.0 =
-p
tcp --destination-port netbios-ns
/sbin/iptables -A INPUT -j DROP -i eth1 -d 212.198.135.235/255.255.255.0 =
-p
tcp --destination-port netbios-ssn
/sbin/iptables -A INPUT -j DROP -i eth1 -d 212.198.135.235/255.255.255.0 =
-p
tcp --destination-port 3000
/sbin/iptables -A INPUT -j DROP -i eth1 -d 212.198.135.235/255.255.255.0 =
-p
tcp --destination-port 3128
/sbin/iptables -A INPUT -j DROP -i eth1 -d 212.198.135.235/255.255.255.0 =
-p
udp --destination-port nameserver
/sbin/iptables -A INPUT -j DROP -i eth1 -d 212.198.135.235/255.255.255.0 =
-p
udp --destination-port netbios-ns
/sbin/iptables -A INPUT -j DROP -i eth1 -d 212.198.135.235/255.255.255.0 =
-p
udp --destination-port netbios-ssn
/sbin/iptables -A INPUT -j DROP -i eth1 -d 212.198.135.235/255.255.255.0 =
-p
udp --destination-port 3128
/sbin/iptables -A INPUT -j LOG -i eth1 -d 212.198.135.235/255.255.255.0 =
-p
tcp --destination-port 1:1023
/sbin/iptables -A INPUT -j DROP -i eth1 -d 212.198.135.235/255.255.255.0 =
-p
tcp --destination-port 1:1023
/sbin/iptables -A INPUT -j LOG -i eth1 -d 212.198.135.235/255.255.255.0 =
-p
udp --destination-port 1:1023
/sbin/iptables -A INPUT -j DROP -i eth1 -d 212.198.135.235/255.255.255.0 =
-p
udp --destination-port 1:1023
#: Accept dumb broadcast packets on external interfaces
/sbin/iptables -A INPUT -j ACCEPT -i eth1 -d 255.255.255.255/32
/sbin/iptables -A INPUT -j ACCEPT -i eth1 -d 224.0.0.1
#: Accept incoming packets from external networks on external interfaces
/sbin/iptables -A INPUT -j ACCEPT -i eth1 -d 212.198.135.235/32
/sbin/iptables -A INPUT -j ACCEPT -i eth1 -d 212.198.135.255/32
#: Masquerade packets from internal networks
/sbin/iptables -t nat -A POSTROUTING -s 192.168.0.1/255.255.255.0 -j
MASQUERADE
/sbin/iptables -A FORWARD -i eth0 -o eth1 -s 192.168.0.1/255.255.255.0 =
-j
ACCEPT
/sbin/iptables -A FORWARD -o eth0 -i eth1 -d 192.168.0.1/255.255.255.0 =
-j
ACCEPT
#: Allow packets to go out over the loopback interface
/sbin/iptables -A OUTPUT -j ACCEPT -o lo
#: Allow dumb broadcast packets to leave on internal interfaces
/sbin/iptables -A OUTPUT -j ACCEPT -o eth0 -d 255.255.255.255/32
#: Allow packets for internal hosts to be delivered using internal
interfaces
/sbin/iptables -A OUTPUT -j ACCEPT -o eth0 -d 192.168.0.1/255.255.255.0
#: Allow multicast packets (adresses 224.0.0.0) to be delivered using
#: internal interfaces
/sbin/iptables -A OUTPUT -j ACCEPT -o eth0 -d 224.0.0.0/4 -p ! tcp
#: Deny and log packets attempting to leave over external interfaces
claiming
#: to be for internal networks
/sbin/iptables -A FORWARD -j LOG -o eth1 -d 192.168.0.1/255.255.255.0
/sbin/iptables -A FORWARD -j DROP -o eth1 -d 192.168.0.1/255.255.255.0
/sbin/iptables -A OUTPUT -j LOG -o eth1 -d 192.168.0.1/255.255.255.0
/sbin/iptables -A OUTPUT -j DROP -o eth1 -d 192.168.0.1/255.255.255.0
#: Firewall for outgoing packets
/sbin/iptables -A OUTPUT -j ACCEPT -o eth1 -s =
212.198.135.235/255.255.255.0
-p tcp --source-port ssh
/sbin/iptables -A OUTPUT -j ACCEPT -o eth1 -s =
212.198.135.235/255.255.255.0
-p tcp --source-port auth
/sbin/iptables -A OUTPUT -j ACCEPT -o eth1 -s =
212.198.135.235/255.255.255.0
-p tcp --source-port bootpc
/sbin/iptables -A OUTPUT -j ACCEPT -o eth1 -s =
212.198.135.235/255.255.255.0
-p tcp --source-port www
/sbin/iptables -A OUTPUT -j ACCEPT -o eth1 -s =
212.198.135.235/255.255.255.0
-p udp --source-port bootpc
/sbin/iptables -A OUTPUT -j DROP -o eth1 -s 0.0.0.0/0 -p tcp =
--source-port
nameserver
/sbin/iptables -A OUTPUT -j DROP -o eth1 -s 0.0.0.0/0 -p tcp =
--source-port
smtp
/sbin/iptables -A OUTPUT -j DROP -o eth1 -s 0.0.0.0/0 -p tcp =
--source-port
pop3
/sbin/iptables -A OUTPUT -j DROP -o eth1 -s 0.0.0.0/0 -p tcp =
--source-port
netbios-ns
/sbin/iptables -A OUTPUT -j DROP -o eth1 -s 0.0.0.0/0 -p tcp =
--source-port
netbios-ssn
/sbin/iptables -A OUTPUT -j DROP -o eth1 -s 0.0.0.0/0 -p tcp =
--source-port
3000
/sbin/iptables -A OUTPUT -j DROP -o eth1 -s 0.0.0.0/0 -p tcp =
--source-port
3128
/sbin/iptables -A OUTPUT -j DROP -o eth1 -s 0.0.0.0/0 -p udp =
--source-port
nameserver
/sbin/iptables -A OUTPUT -j DROP -o eth1 -s 0.0.0.0/0 -p udp =
--source-port
netbios-ns
/sbin/iptables -A OUTPUT -j DROP -o eth1 -s 0.0.0.0/0 -p udp =
--source-port
netbios-ssn
/sbin/iptables -A OUTPUT -j DROP -o eth1 -s 0.0.0.0/0 -p udp =
--source-port
3128
/sbin/iptables -A OUTPUT -j LOG -o eth1 -s 0.0.0.0/0 -p tcp =
--source-port
1:1023
/sbin/iptables -A OUTPUT -j DROP -o eth1 -s 0.0.0.0/0 -p tcp =
--source-port
1:1023
/sbin/iptables -A OUTPUT -j LOG -o eth1 -s 0.0.0.0/0 -p udp =
--source-port
1:1023
/sbin/iptables -A OUTPUT -j DROP -o eth1 -s 0.0.0.0/0 -p udp =
--source-port
1:1023
#: Allow dumb broadcast packets to leave on external interfaces
/sbin/iptables -A OUTPUT -j ACCEPT -o eth1 -d 255.255.255.255/32
#: Allow packets for external networks leave over external interfaces
/sbin/iptables -A OUTPUT -j ACCEPT -o eth1 -s 212.198.135.235/32
/sbin/iptables -A OUTPUT -j ACCEPT -o eth1 -s 212.198.135.255/32
#: Turn on forwarding for 2.1 kernels
#: Enable automatic IP defragmentation
#: Enable ip_dynaddr
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/ip_dynaddr
#: Set masqerading timeouts:
#:   2 hrs for TCP
#:   10 sec for TCP after FIN has been sent
#:   160 sec for UDP (important for ICQ users)
#: Run the deprecated /etc/ipmasq.rules, if present
#: Deny and log anything that may have snuck past any of our other rules
/sbin/iptables -A INPUT -j LOG -s 0.0.0.0/0 -d 0.0.0.0/0
/sbin/iptables -A INPUT -j DROP -s 0.0.0.0/0 -d 0.0.0.0/0
/sbin/iptables -A OUTPUT -j LOG -s 0.0.0.0/0 -d 0.0.0.0/0
/sbin/iptables -A OUTPUT -j DROP -s 0.0.0.0/0 -d 0.0.0.0/0
/sbin/iptables -A FORWARD -j LOG -s 0.0.0.0/0 -d 0.0.0.0/0
/sbin/iptables -A FORWARD -j DROP -s 0.0.0.0/0 -d 0.0.0.0/0

Please CC me any answer so I'm sure to get them, I'm not subscribed to =
the
list.

--
Daniel Desages


