From: "Brent Clark" <bclark@eccotours.biz>
Subject: Gateway \ FW
Date: Mon, 19 Jul 2004 10:49:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HAEOIFPIBBBLGLHOMLLIKEHMCEAA.bclark@eccotours.biz>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0003_01C46D7E.1A0D1B70"
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
To: iptables <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0003_01C46D7E.1A0D1B70
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi all

I was fortunate a while ago where by some guys on this mailing was forth
coming with constructive critism and
advice for my gateway \ firewall.

I have since then pretty much read a lot of the internet sights pointed at
me to read etc, and I have hopefully
strengthed, secured my network \ firewall.

I once again ask if anyone would be so kind as to review my rules and, sure
some advice.
It would be most apprectiated.

I also have a rule as such /sbin/iptables -A FORWARD -i eth1 -o eth0 -j
ACCEPT which looks very wrong to me, BUT for some reason if its hashed, I
cant browse the internet, could anyone please tell me why.

Kind Regards and thanks once again to those who helped me a few weeks ago
and to those who may help me now.

Brent Clark

------=_NextPart_000_0003_01C46D7E.1A0D1B70
Content-Type: application/octet-stream;
	name="IP_FW_RULES"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="IP_FW_RULES"

#/bin/sh=0A=
=0A=
# Rules for gateway=0A=
=0A=
#Clear \ Flush all the rules from the different chains and tables=0A=
=0A=
/sbin/iptables --flush=0A=
/sbin/iptables --flush INPUT		#Flush the INPUT chain=0A=
/sbin/iptables --flush OUTPUT		#Flush the OUTPUT chain=0A=
/sbin/iptables --flush FORWARD		#Flush the FORWARD chain=0A=
/sbin/iptables -t nat --flush		#Flush the nat table=0A=
/sbin/iptables -t mangle --flush	#Flush the mangle table=0A=
/sbin/iptables --delete-chain		#Delete any pre-existing chains =0A=
/sbin/iptables -t nat --delete-chain	#Delete any pre-existing chains =
from nat table=0A=
/sbin/iptables -t mangle --delete-chain	#Delete any pre-existing chains =
from the mangle table=0A=
=0A=
#Setting the default Policies for the chains=0A=
/sbin/iptables --policy INPUT DROP	#Setting the default policy for INPUT =
chain=0A=
/sbin/iptables --policy FORWARD DROP	#Setting the default plicy for =
FORWARD chain=0A=
/sbin/iptables --policy OUTPUT DROP	#Setting the default policy for the =
OUTPUT chain=0A=
=0A=
#Create new chain=0A=
/sbin/iptables -N LOG_DROP		#Create new chain=0A=
/sbin/iptables -N LOG_ACCEPT		#Create new chain=0A=
=0A=
#Accepting traffic for and to internal interface=0A=
/sbin/iptables -A INPUT -i lo -j ACCEPT		#Allowing unlimited loopback =
traffic=0A=
/sbin/iptables -A OUTPUT -o lo -j ACCEPT	#Allowing unlimited loopback =
traffic=0A=
=0A=
###########################################################=0A=
#Stealth Scans and TCP state flags=0A=
#=0A=
# All of the bits are cleared=0A=
/sbin/iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP=0A=
=0A=
# SYN and FIN are both set=0A=
/sbin/iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP=0A=
=0A=
# SYN and RST are both set=0A=
/sbin/iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP=0A=
=0A=
# FIN and RST are both set=0A=
/sbin/iptables -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j DROP=0A=
=0A=
# FIN is the only bit set, without the expected accompanying ACK=0A=
/sbin/iptables -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP=0A=
=0A=
# PSH is the only bit set, without the expected accompanying ACK=0A=
/sbin/iptables -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP=0A=
=0A=
# URG is the only bit set, without the expected accompanying ACK=0A=
/sbin/iptables -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP=0A=
=0A=
###########################################################=0A=
# Using Connection State to By-Pass checking=0A=
# Creating the rules=0A=
/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT=0A=
/sbin/iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT=0A=
/sbin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT=0A=
=0A=
/sbin/iptables -A INPUT -m state --state INVALID -j LOG --log-prefix =
"INVALID input: "=0A=
/sbin/iptables -A INPUT -m state --state INVALID -j DROP=0A=
=0A=
/sbin/iptables -A OUTPUT -m state --state INVALID -j LOG --log-prefix =
"INVALID output: "=0A=
/sbin/iptables -A OUTPUT -m state --state INVALID -j DROP=0A=
=0A=
##########################################################=0A=
# Source address spoofing and other bad address=0A=
# Refuse spoofed packets pretending to be from the external interface IP =
address=0A=
/sbin/iptables -A INPUT -i eth0 -s 192.168.111.10 -j DROP=0A=
=0A=
# Refuse packets claiming to be from a CLASS A private network=0A=
/sbin/iptables -A INPUT -i eth0 -s 10.0.0.0/8 -j DROP=0A=
=0A=
# Refuse packets claiming to be from a CLASS B private network=0A=
/sbin/iptables -A INPUT -i eth0 -s 172.16.0.0/12 -j DROP=0A=
=0A=
# Refuse packets claiming to be from a CLASS C private network=0A=
/sbin/iptables -A INPUT -i eth0 -s 192.168.0.0/16 -j DROP=0A=
=0A=
# Refuse packets claiming to be from a CLASS D multicast address=0A=
/sbin/iptables -A INPUT -i eth0 -s 224.0.0.0/4 -j DROP=0A=
/sbin/iptables -A INPUT -i eth0 -p ! udp -d 224.0.0.0/4 -j DROP=0A=
/sbin/iptables -A INPUT -i eth0 -p udp -d 224.0.0.0/4 -j ACCEPT=0A=
=0A=
# Refuse packets claiming to be from a CLASS E reserved IP address=0A=
/sbin/iptables -A INPUT -i eth0 -s 240.0.0.0/5 -j DROP=0A=
=0A=
# Refuse packets claiming to be from the loopback interface # NEED MORE =
WORKING ON=0A=
#/sbin/iptables -A INPUT -i eth0 -s lo -j DROP=0A=
=0A=
# Refuse malformed broadcast packets=0A=
/sbin/iptables -A INPUT -i eth0 -s 255.255.255.255 -j LOG=0A=
/sbin/iptables -A INPUT -i eth0 -s 255.255.255.255 -j DROP=0A=
/sbin/iptables -A INPUT -i eth0 -d 0.0.0.0 -j LOG=0A=
/sbin/iptables -A INPUT -i eth0 -d 0.0.0.0 -j DROP=0A=
=0A=
# Refuse DHCP broadcasts=0A=
#/sbin/iptables -A INPUT -i eth0 -s 192.168.111.0 -j DROP # NEED MORE =
WORKING ON=0A=
#/sbin/iptables -A INPUT -i eth0 -s 192 -j DROP #NEED MORE WORKING ON=0A=
/sbin/iptables -A INPUT -i eth0 -d 255.255.255.255 -j DROP=0A=
=0A=
/sbin/iptables -A INPUT -i eth0 -s 0.0.0.0/8 -j DROP=0A=
/sbin/iptables -A INPUT -i eth0 -s 169.254.0.0/16 -j DROP=0A=
/sbin/iptables -A INPUT -i eth0 -s 192.0.2.0/24 -j DROP=0A=
=0A=
############################################################=0A=
# Disallowing TCP connections to certain server ports=0A=
# Block NFS, X-windows, Printer Port, Sun rpc/NFS=0A=
=0A=
/sbin/iptables -A OUTPUT -o eth0 -p udp -m multiport --dport 2049,4045 =
-m state --state NEW -j REJECT=0A=
/sbin/iptables -A INPUT -i eth0 -p udp -m multiport --dport 2049,4045 -m =
state --state NEW -j DROP=0A=
=0A=
/sbin/iptables -A OUTPUT -o eth0 -p tcp --syn --dport 6000:6063 -j =
REJECT #BLOCK X-windows=0A=
/sbin/iptables -A INPUT -i eth0 -p tcp --syn --dport 6000:6063 -j DROP  =
#BLOCK X-Windows=0A=
=0A=
/sbin/iptables -A INPUT -p TCP -s 0/0 -d 0/0 --dport 7100 -j DROP       =
#BLOCK X-Windows Font Server (TCP)=0A=
/sbin/iptables -A INPUT -p TCP -s 0/0 -d 0/0 --dport 515 -j DROP        =
#BLOCK Printer Port (TCP)=0A=
/sbin/iptables -A INPUT -p UDP -s 0/0 -d 0/0 --dport 515 -j DROP        =
#BlOCK Printer Port (UDP)=0A=
/sbin/iptables -A INPUT -p TCP -s 0/0 -d 0/0 --dport 111 -j DROP        =
#BLOCK Sun rpc/NFS (TCP)=0A=
/sbin/iptables -A INPUT -p UDP -s 0/0 -d 0/0 --dport 111 -j DROP        =
#BLOCK Sun rpc/NFS (UDP)=0A=
=0A=
############################################################=0A=
=0A=
#/sbin/iptables -A INPUT -m state --state NEW -i ! eth0 -j ACCEPT=0A=
=0A=
/sbin/iptables -A FORWARD -i eth0 -o eth1 -m state --state =
ESTABLISHED,RELATED -j ACCEPT=0A=
#/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE=0A=
/sbin/iptables -t nat -A POSTROUTING -s 192.168.111.0/24  -j MASQUERADE=0A=
/sbin/iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT #NOT SURE=0A=
=0A=
#Allow for resolving of  DNS and lookup from  gate=0A=
/sbin/iptables -A OUTPUT -o eth0 -p udp --dport 53 -m state --state NEW =
-j ACCEPT=0A=
/sbin/iptables -A INPUT -i eth0 -p udp --sport 53 -j ACCEPT=0A=
=0A=
#############################################################=0A=
# Allow for mail traffic=0A=
# /sbin/iptables -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT=0A=
# /sbin/iptables -A OUTPUT -p tcp -m tcp  --dport 25 -j ACCEPT=0A=
/sbin/iptables -A OUTPUT -o eth0 -p tcp --dport 25 -m state --state NEW =
-j ACCEPT=0A=
/sbin/iptables -A INPUT -i eth0 -p tcp ! --syn --sport 25 --dport =
1024:65535 -j ACCEPT=0A=
=0A=
#############################################################=0A=
# Allow access gate from 192.168.111.0/255.255.255.0=0A=
/sbin/iptables -A INPUT -i eth1 -p all -s 192.168.111.0/24 -j ACCEPT=0A=
/sbin/iptables -A OUTPUT -o eth1 -p all -s 192.168.111.0/24 -j ACCEPT=0A=
=0A=
# Allow access gate from 192.168.10.0/255.255.255.0=0A=
# /sbin/iptables -A INPUT -p all -s 192.168.10.0/24 -i eth0  -j ACCEPT=0A=
# /sbin/iptables -A OUTPUT -p all -s 192.168.10.0/24 -o eth0 -j ACCEPT=0A=
############################################################=0A=
=0A=
# Allow access to port 80(http) and 443(https) to the gate=0A=
/sbin/iptables -A OUTPUT -m state --state NEW -p tcp -m multiport =
--dport 80,443 -j ACCEPT=0A=
/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED  -p tcp =
--dport 80 -j ACCEPT=0A=
=0A=
###########################################################=0A=
# Allowing ssh to remote servers=0A=
/sbin/iptables -A OUTPUT -o eth0 -p tcp --dport 22 -m state --state NEW =
-j ACCEPT=0A=
/sbin/iptables -A INPUT -i eth0 -p tcp ! --syn --sport 22 -j ACCEPT=0A=
###########################################################=0A=
# FTP ACCESS=0A=
# /sbin/iptables -A INPUT -p tcp --dport 21 -m state --state NEW -j =
ACCEPT=0A=
# /sbin/iptables -A INPUT -p udp --dport 21 -m state --state NEW -j =
ACCEPT=0A=
/sbin/iptables -A INPUT -p tcp -m tcp --dport 21  -j  ACCEPT=0A=
/sbin/iptables -A OUTPUT -p tcp -m tcp --dport 21  -j  ACCEPT=0A=
# /sbin/iptables -A OUTPUT -p udp --dport 21 -m state --state NEW -j =
ACCEPT=0A=
=0A=
# Ntp update=0A=
# /sbin/iptables -A INPUT -p tcp --dport 123 -m state --state NEW -j =
ACCEPT=0A=
# /sbin/iptables -A INPUT -p udp --dport 123 -m state --state NEW -j =
ACCEPT=0A=
# /sbin/iptables -A OUTPUT -p tcp --dport 123 -m state --state NEW -j =
ACCEPT=0A=
# /sbin/iptables -A OUTPUT -p udp --dport 123 -m state --state NEW -j =
ACCEPT=0A=
=0A=
# Drop all netbios connections etc=0A=
/sbin/iptables -A FORWARD -p UDP --dport 135 -j DROP=0A=
/sbin/iptables -A FORWARD -p TCP --dport 135 -j DROP=0A=
/sbin/iptables -A FORWARD -p UDP --dport 137 -j DROP=0A=
/sbin/iptables -A FORWARD -p TCP --dport 137 -j DROP=0A=
/sbin/iptables -A FORWARD -p UDP --dport 138 -j DROP=0A=
/sbin/iptables -A FORWARD -p TCP --dport 138 -j DROP=0A=
/sbin/iptables -A FORWARD -p UDP --dport 139 -j DROP=0A=
/sbin/iptables -A FORWARD -p TCP --dport 139 -j DROP=0A=
=0A=
#############################################################=0A=
# Allowing me to ping from here and dealing in ICMP packets=0A=
/sbin/iptables -A INPUT -p icmp --icmp-type source-quench -j ACCEPT=0A=
/sbin/iptables -A INPUT -p icmp --icmp-type parameter-problem -j ACCEPT=0A=
/sbin/iptables -A INPUT -p icmp --icmp-type destination-unreachable -j =
ACCEPT=0A=
/sbin/iptables -A INPUT -i eth0 -p icmp --icmp-type time-exceeded -j =
ACCEPT=0A=
/sbin/iptables -A OUTPUT -p icmp --icmp-type source-quench -j ACCEPT=0A=
/sbin/iptables -A OUTPUT -p icmp --icmp-type parameter-problem -j ACCEPT=0A=
/sbin/iptables -A OUTPUT -p icmp --icmp-type fragmentation-needed -j =
ACCEPT=0A=
/sbin/iptables -A OUTPUT -p icmp --icmp-type echo-request -m state =
--state NEW -j ACCEPT=0A=
/sbin/iptables -A OUTPUT -o eth1 -p icmp --icmp-type =
destination-unreachable -j ACCEPT=0A=
/sbin/iptables -A INPUT -i eth0 -p icmp --icmp-type ! echo-request -j LOG=0A=
=0A=
############################################################=0A=
# Create some logging=0A=
/sbin/iptables -A INPUT -p igmp -j DROP=0A=
#/sbin/iptables -A INPUT -i ppp0  -j LOG --log-prefix "\iptables "=0A=
#/sbin/iptables -A INPUT -j LOG --log-prefix "INPUT_DROP: "=0A=
#/sbin/iptables -A OUTPUT -j LOG --log-prefix "OUTPUT_DROP: "=0A=
/sbin/iptables -A INPUT -j LOG_DROP=0A=
/sbin/iptables -A OUTPUT -j LOG_DROP=0A=
/sbin/iptables -A LOG_DROP -j LOG --log-prefix "[IPTABLES DROP]: " =
--log-tcp-options --log-ip-options=0A=
/sbin/iptables -A LOG_DROP -j DROP=0A=
/sbin/iptables -A LOG_ACCEPT -j LOG --log-prefix "[IPTABLES ACCEPT]: " =
--log-tcp-options --log-ip-options=0A=
/sbin/iptables -A LOG_ACCEPT -j ACCEPT=0A=
=0A=
echo 1 > /proc/sys/net/ipv4/ip_dynaddr			#=0A=
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians	#Enable logging for =
malformed Ip Address=0A=
echo 1 > /proc/sys/net/ipv4/ip_forward=0A=
echo 1 > /proc/sys/net/ipv4/conf/all/proxy_arp=0A=
echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter=0A=
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts=0A=
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route=0A=
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects=0A=
#echo "32768 61000" > /proc/sys/net/ipv4/ip_local_port_range=0A=

------=_NextPart_000_0003_01C46D7E.1A0D1B70--


