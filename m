From: "Mam Ruoc" <mamruoc@hotmail.com>
Subject: Something wrong with my script!
Date: Mon, 10 Feb 2003 03:03:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F412aZcdjaS36Il06sI00004e50@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello netfiler/iptables experts!

I got a problem with my iptables script. It seemed to run fined, and I=20
started using --state flag...

But recently I did a nmap on my computer and got suprising results, s=E5 I =

tried several other port scanner and got results alike nmap.. Here's the=20
result:

Nmap v3.00;
The Connect() Scan took 1664 seconds to scan 1601 ports.
Interesting ports on c-641073d5.028-29-6f736c3.cust.bredband.no=20
(213.115.16.100):
(The 1585 ports scanned but not shown below are in state: filtered)
Port       State       Service
21/tcp     open        ftp
25/tcp     open        smtp
80/tcp     open        http
81/tcp     open        hosts2-ns
82/tcp     open        xfer
83/tcp     open        mit-ml-dev
110/tcp    open        pop-3
119/tcp    open        nntp
270/tcp    open        unknown
469/tcp    closed      rcp
990/tcp    closed      ftps
1080/tcp   open        socks
2013/tcp   closed      raid-am
5190/tcp   open        aol
6103/tcp   closed      RETS-or-BackupExec
8080/tcp   open        http-proxy


And I tried another portscanner called AW Security Port Scanner v4.61 (I=20
only did scanning from port 1 to 1080):
#02:47:37 New scanning.

[Connect 02:47:47] Host: hoang.no-ip.com IP: 213.115.16.100 Remote Port: 21=
=20
Local Port: 4433
Local Socket: 604  Standard Service: File Transfer [Control] :: Common=20
trojans for this port: Back Construction, Blade Runner, Doly Trojan, Fore, =

Invisible FTP, Juggernaut 42 , Larva, MotIv FTP, Net Administrator, Senna=20
Spy FTP server, Traitor 21, WebEx, WinCrash

[Connect 02:47:47] Host: hoang.no-ip.com IP: 213.115.16.100 Remote Port: 25=
=20
Local Port: 4437
Local Socket: 652  Standard Service: Simple Mail Transfer :: Common trojans=
=20
for this port: Ajan, Antigen, Email Password Sender - EPS, EPS II, Gip,=20
Gris, Happy99, Hpteam mail, I love you, Kuang2, Magic Horse, MBT (Mail=20
Bombing Trojan), Moscow Email trojan, Naebi, NewApt worm, ProMail trojan,=20
Shtirlitz, Stealth, Tapiras, Terminator, WinPC, WinSp

[Incoming Data 02:47:57] Host: hoang.no-ip.com IP: 213.115.16.100 Remote=20
Port: 21 Local Port: 4433

[Session Closed 02:48:08] Host: hoang.no-ip.com IP: 213.115.16.100 Remote=20
Port: 25 Local Port: 4437

[Connect 02:48:17] Host: hoang.no-ip.com IP: 213.115.16.100 Remote Port: 80=
=20
Local Port: 4493
Local Socket: 572  Standard Service: World Wide Web HTTP :: Common trojans =

for this port: AckCmd, Back End, CGI Backdoor, Executor, Hooker, RingZero=20
and many others

[Connect 02:48:18] Host: hoang.no-ip.com IP: 213.115.16.100 Remote Port: 81=
=20
Local Port: 4495
Local Socket: 664  Standard Service: HOSTS2 Name Server :: Common trojans=20
for this port: RemoConChubo

[Connect 02:48:22] Host: hoang.no-ip.com IP: 213.115.16.100 Remote Port: 82=
=20
Local Port: 4498
Local Socket: 668  Standard Service: XFER Utility

[Connect 02:48:22] Host: hoang.no-ip.com IP: 213.115.16.100 Remote Port: 83=
=20
Local Port: 4499
Local Socket: 568  Standard Service: MIT ML Device

[Session Closed 02:48:40] Host: hoang.no-ip.com IP: 213.115.16.100 Remote=20
Port: 81 Local Port: 4495

[Session Closed 02:48:44] Host: hoang.no-ip.com IP: 213.115.16.100 Remote=20
Port: 83 Local Port: 4499

[Session Closed 02:48:44] Host: hoang.no-ip.com IP: 213.115.16.100 Remote=20
Port: 82 Local Port: 4498

[Connect 02:48:44] Host: hoang.no-ip.com IP: 213.115.16.100 Remote Port: 11=
0=20
Local Port: 4528
Local Socket: 692  Standard Service: Post Office protocol - Version 3 ::=20
Common trojans for this port: ProMail trojan

[Connect 02:48:50] Host: hoang.no-ip.com IP: 213.115.16.100 Remote Port: 11=
9=20
Local Port: 4540
Local Socket: 684  Standard Service: Network News Transfer Protocol ::=20
Common trojans for this port: Happy99

[Session Closed 02:49:04] Host: hoang.no-ip.com IP: 213.115.16.100 Remote=20
Port: 110 Local Port: 4528

[Session Closed 02:49:11] Host: hoang.no-ip.com IP: 213.115.16.100 Remote=20
Port: 119 Local Port: 4540

[Connect 02:57:10] Host: hoang.no-ip.com IP: 213.115.16.100 Remote Port:=20
1080 Local Port: 1820
Local Socket: 680  Standard Service: Socks :: Common trojans for this port:=
=20
WinHole, SubSeven 2.2

#02:57:16 End scanning.

As you can see, it's alot mre open ports than I thought...

I'm using Debian Woody (unstable)
The may daemons I'm using is:
snmp, apache, apache-ssl, exim (non-deamon), proftpd, mysql, inted, ssh...


Here's the script I'm using:
#!/bin/bash

echo "Starting IPTables... All shields up!"

# Setting eth0 tp promisous mode, to make snort able to log...
ifconfig eth0 promisc

# Clean old rules
iptables -F
iptables -X
iptables -Z

# Load connection-tracking modules
modprobe ip_conntrack
modprobe ip_conntrack_ftp
modprobe ip_conntrack_irc

# Set everything to DROP as default
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP



############### Definations ################################################

NAMESERVER_1=3D"195.54.122.200"
NAMESERVER_2=3D"195.54.122.204"
BROADCAST=3D"213.115.16.127"
LOOPBACK=3D"127.0.0.0/8"
CLASS_A=3D"10.0.0.0/8"
CLASS_B=3D"172.16.0.0/12"
CLASS_C=3D"192.168.0.0/16"
CLASS_D_MULTICAST=3D"224.0.0.0/4"
CLASS_E_RESERVED_NET=3D"240.0.0.0/5"
P_PORTS=3D"0:1023"
UP_PORTS=3D"1024:65535"




############### Kernel flags=20
################################################
# To dynamically change kernel parameters and variables on the fly you need

# Disable response to ping.
/bin/echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_all

# Disable response to broadcasts.
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

# Don't accept source routed packets.
echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route

# Disable ICMP redirect acceptance.
echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects

# Enable bad error message protection
echo "1" > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

# Log spoofed packets, source routed packets, redirect packets
echo "1" > /proc/sys/net/ipv4/conf/all/log_martians

# Turn on reverse path filtering. This helps make sure that packets use
# legitimate source addresses, by automatically rejecting incoming packets
# if the routing table entry for their source address doesn't match the=20
network
# interface they're arriving on. This has security advantages because it=20
prevents
# so-called IP spoofing, however it can pose problems if you use asymmetric=
=20
routing
# (packets from you to a host take a different path than packets from that =

host to you)
# or if you operate a non-routing host which has several IP addresses on=20
different
# interfaces. (Note - If you turn on IP forwarding, you will also get this).
for interface in /proc/sys/net/ipv4/conf/*/rp_filter; do
   /bin/echo "1" > ${interface}
done

# Make sure that IP forwarding is turned off. We only want this for a=20
multi-homed host.
/bin/echo "0" > /proc/sys/net/ipv4/ip_forward

############### Firewall Ruless=20
################################################

### LOOPBACK
# Loopback - Allow unlimited traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT


### SYN-Flooding Protection
iptables -N syn-flood
iptables -A INPUT -i eth0 -p tcp --syn -j syn-flood
iptables -A syn-flood -m limit --limit 1/s --limit-burst 10 -j RETURN
iptables -A syn-flood -j DROP


### Make sure that new TCP connections are SYN packets
iptables -A INPUT -i eth0 -p tcp ! --syn -m state --state NEW -j DROP


### FRAGMENTS
# Fragments : Don't trust the little buggers. Send 'em to hell.
#iptables -A INPUT -i eth0 -f -j LOG --log-level debug --log-prefix=20
"IPTABLES FRAGMENTS: "
iptables -A INPUT -i eth0 -f -j DROP


### Spoofing
# Most of this anti-spoofing stuff is theoretically not really necessary=20
with the flags we
# have set in the kernel above ........... but you never know there isn't a=
=20
bug somewhere in
# your IP stack.
# Refuse spoofed packets claiming to be the loopback
iptables -A INPUT -i eth0 -d $LOOPBACK -j DROP
# Refuse packets claiming to be from a Class A private network.
iptables -A INPUT  -i eth0 -s $CLASS_A -j DROP
# Refuse packets claiming to be from a Class B private network.
iptables -A INPUT  -i eth0 -s $CLASS_B -j DROP
# Refuse packets claiming to be from a Class C private network.
iptables -A INPUT  -i eth0 -s $CLASS_C -j DROP
# Refuse Class D multicast addresses. Multicast is illegal as a source=20
address.
iptables -A INPUT -i eth0 -s $CLASS_D_MULTICAST -j DROP
# Refuse Class E reserved IP addresses.
iptables -A INPUT -i eth0 -s $CLASS_E_RESERVED_NET -j DROP


# DNS
# Allow UDP packets in for DNS client from nameservers
iptables -A INPUT -i eth0 -p udp -s 0/0 --sport 53 -m state --state=20
ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p udp -d 0/0 --dport 53 -j ACCEPT
# Allow UDP packets to DNS servers from client.
iptables -A OUTPUT -o eth0 -p udp -d $NAMESERVER_1 --dport 53 -m state=20
--state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp -d $NAMESERVER_2 --dport 53 -m state=20
--state NEW,ESTABLISHED -j ACCEPT


# SSH
# allow all sshd incoming connections (including the port fw)
iptables -A INPUT -i eth0 -p tcp --dport 270 -m state --state=20
NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 270 -m state --state ESTABLISHED =

-j ACCEPT


### HTTP
# allow all http/https incoming connections
iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHE=
D=20
-j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 80 -m state --state ESTABLISHED -=
j=20
ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 443 -m state --state=20
NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 443 -m state --state ESTABLISHED =

-j ACCEPT
#allow all http/https outgoing connections
iptables -A INPUT  -i eth0 -p tcp --sport 80 -m state --state ESTABLISHED -=
j=20
ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 80 -m state --state=20
NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT  -i eth0 -p tcp --sport 443 -m state --state ESTABLISHED =

-j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 443 -m state --state=20
NEW,ESTABLISHED -j ACCEPT


### FTP
## Incoming
# allow all ftp incoming connections
iptables -A INPUT  -i eth0 -p tcp --dport 21 -m state --state=20
NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 21 -m state --state ESTABLISHED -=
j=20
ACCEPT
# Enable active ftp transfers
iptables -A INPUT  -i eth0 -p tcp --dport 20 -m state --state ESTABLISHED -=
j=20
ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 20 -m state --state=20
ESTABLISHED,RELATED -j ACCEPT
# Enable passive ftp transfers
iptables -A INPUT  -i eth0 -p tcp --sport $UP_PORTS --dport $UP_PORTS -m=20
state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport $UP_PORTS --dport $UP_PORTS -m=20
state --state ESTABLISHED,RELATED -j ACCEPT
## Outgoing
# Allow ftp outbound.
iptables -A INPUT  -i eth0 -p tcp --sport 21 -m state --state ESTABLISHED -=
j=20
ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 21 -m state --state=20
NEW,ESTABLISHED -j ACCEPT
# Enable active ftp transfers
iptables -A INPUT  -i eth0 -p tcp --sport 20 -m state --state=20
ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 20 -m state --state ESTABLISHED -=
j=20
ACCEPT
# Enable passive ftp transfers
iptables -A INPUT  -i eth0 -p tcp --sport $UP_PORTS --dport $UP_PORTS -m=20
state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport $UP_PORTS --dport $UP_PORTS -m=20
state --state ESTABLISHED -j ACCEPT


## SMTP
# Allow smtp outbound. (mail)
iptables -A INPUT  -i eth0 -p tcp --sport 25 -m state --state ESTABLISHED -=
j=20
ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 25 -m state --state=20
NEW,ESTABLISHED -j ACCEPT


### ICMP
# Allow ICMP in if it is related to other connections
iptables -A INPUT -i eth0 -p icmp -m state --state ESTABLISHED,RELATED -j=20
ACCEPT
# We always allow icmp out.
iptables -A OUTPUT -o eth0 -p icmp -m state --state NEW,ESTABLISHED,RELATED=
=20
-j ACCEPT


### LOGGING:
# Any udp not already allowed is logged and then dropped.
#iptables -A INPUT  -i eth0 -p udp -j LOG --log-prefix "IPTABLES UDP-IN: "
iptables -A INPUT  -i eth0 -p udp -j DROP
#iptables -A OUTPUT -o eth0 -p udp -j LOG --log-prefix "IPTABLES UDP-OUT: "
iptables -A OUTPUT -o eth0 -p udp -j DROP
# Any icmp not already allowed is logged and then dropped.
#iptables -A INPUT  -i eth0 -p icmp -j LOG --log-prefix "IPTABLES ICMP-IN: "
iptables -A INPUT  -i eth0 -p icmp -j DROP
#iptables -A OUTPUT -o eth0 -p icmp -j LOG --log-prefix "IPTABLES ICMP-OUT:=
=20
"
iptables -A OUTPUT -o eth0 -p icmp -j DROP
# Any tcp not already allowed is logged and then dropped.
#iptables -A INPUT  -i eth0 -p tcp -j LOG --log-prefix "IPTABLES TCP-IN: "
iptables -A INPUT  -i eth0 -p tcp -j DROP
#iptables -A OUTPUT -o eth0 -p tcp -j LOG --log-prefix "IPTABLES TCP-OUT: "
iptables -A OUTPUT -o eth0 -p tcp -j DROP
# Anything else not already allowed is logged and then dropped.
# It will be dropped by the default policy anyway ........ but let's be=20
paranoid.
#iptables -A INPUT  -i eth0 -j LOG --log-prefix "IPTABLES PROTOCOL-X-IN: "
iptables -A INPUT  -i eth0 -j DROP
#iptables -A OUTPUT -o eth0 -j LOG --log-prefix "IPTABLES PROTOCOL-X-OUT: "
iptables -A OUTPUT -o eth0 -j DROP


Can somebody help me please!!! I don't like the report from nmap!!!

reagrds

_________________________________________________________________
MSN Messenger http://www.msn.no/messenger - Den korteste veien mellom deg o=
g=20
dine venner


