From: "Franco Antonio Catena" <facatena@surson.com.br>
Subject: IPTABLES SO ESTRANGE
Date: Sun, 9 Mar 2003 00:02:03 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAtFtUV6DRYkmMbGSF92ZpwsKAAAAQAAAAuC4RbOFB7kqjxlbChBdS5QEAAAAA@surson.com.br>
References: <20030308132643.611e6f0a.arnt@c2i.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030308132643.611e6f0a.arnt@c2i.net>
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
To: 'Arnt Karlsen' <arnt@c2i.net>, netfilter@lists.netfilter.org

Hi,

I have a linux box with 2 netcardas eth0 External and eth1 intternal. I
want that apache runs in port 81 instead of 80 becouse I have a nat
forwarding to IIS. The problem is that the script dont work. Im not able
to telnet from internal address to port 81. The Apache was started but I
dont know why I cant telnet 192.168.1.1 81?
 

for i in `ls /lib/modules/2.4.18-2cl/kernel/net/ipv4/netfilter/ip*|cut
-f \ 3 -d "."|cut -f 6 -d "/"|grep -v ipchains`;do  modprobe $i;done

#modprobe ip_tables
#insmod ip_conntrack
#insmod ip_conntrack_ftp
#modprobe ipt_LOG
#modprobe ipt_multi[Bport
#modprobe ipt_REJECT
#modprobe ipt_MASQUERADE


iptables -F

# Politicas default
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT



iptables -P FORWARD ACCEPT


iptables -A INPUT -i eth0 --fragment -p icmp -j LOG --log-prefix
"Fragmented ICMP: " iptables -A INPUT -i eth0 --fragment -p icmp -j DROP



iptables -A INPUT -i eth0 -p tcp --dport 3128 -j LOG --log-prefix "USO
DO  SQUID "

iptables -A INPUT -s 192.168.1.0/255.255.255.0 -p tcp --dport 81 -j LOG
--log-prefix "WEB INTERNA " iptables -A INPUT -i eth0 -m multiport -p
tcp --dport 21,22,25,53,80,81,110,500,3128 -j ACCEPT iptables -A INPUT
-s 192.168.1.0/255.255.255.0  -m multiport -p tcp -d 192.168.1.1 --dport
21,22,25,53,80,81,110,500,3128 -j ACCEPT iptables -A INPUT -i eth0 -m
multiport -p udp --dport 21,25,53,80,110,500 -j ACCEPT


iptables -A INPUT -s 192.168.1.0/255.255.255.0 -p  tcp --dport 22 -j
ACCEPT iptables -A INPUT -s 192.168.1.0/255.255.255.0 -p  tcp --dport 81
-j ACCEPT

iptables -A INPUT -j ACCEPT -m state --state RELATED,ESTABLISHED




iptables -A INPUT -i eth0 -p tcp --dport 3128 -j DROP

iptables -A INPUT -i eth0 -j LOG --log-prefix "FIREWALL : INPUT "

iptables -A INPUT -i eth0 -j DROP

# Regras de Saida

iptables -A OUTPUT -o eth0 -p tcp -m state --state NEW --dport 443
--sport 1024:65535 -j ACCEPT

#Bloqueando saida NETbios
iptables -A OUTPUT -o eth0 -m multiport -p tcp --dport 135,137,138,139
-j DROP iptables -A OUTPUT -o eth0 -m multiport -p udp --dport
135,137,138,139 -j DROP


iptables -A OUTPUT -o eth0 -j ACCEPT

# NAT
#iptables -t nat -A PREROUTING -j NAT --to-dest 192.168.1.1 -d
apache.surson.com.br -p tvp 
iptables -t nat -A PREROUTING -j DNAT --to-dest 192.168.1.2 -i eth0 -p
tcp -m multiport --dport 21,25,80,110,3389,137,50,51,1723 #iptables -t
nat -A PREROUTING --dst apache.surson.com.br -p TCP --dport 80  -j DNAT
--to-destination 192.168.1.1

# Masquerade
#iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/255.255.0.0 -d
192.168.0.0/255.255.0.0 -j LOG --log-prefix "Firewall VPN " 

iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/255.255.0.0 -d \!
192.168.0.0/255.255.0.0 -j MASQUERADE


# Bloqueio de saida de pacotes do tipo Windows Networking iptables -A
FORWARD -i eth0 -m multiport -p tcp --dport 135,137,138,139 -j LOG
--log-prefix " Fire BLOQ TCP NETBIOS " 
iptables -A FORWARD -i eth0 -m multiport -p udp --dport 135,137,138,139
-j LOG --log-prefix " Fire BLOQ UDP NETBIOS " iptables -A FORWARD -i
eth0 -m multiport -p tcp --dport 135,137,138,139 -j DROP iptables -A
FORWARD -i eth0 -m multiport -p udp --dport 135,137,138,139 -j DROP

# Forwarding para saida
iptables -A FORWARD -i eth0 -m state --state ESTABLISHED,RELATED -j
ACCEPT



iptables -A FORWARD -s 192.168.1.1/24 -d ! 192.168.1.1 -p tcp  --dport
3128  -j DROP iptables -A FORWARD -s 192.168.1.1/24 -d ! 192.168.1.1 -p
tcp --dport 8080 -j DROP iptables -A FORWARD -i eth1 -j ACCEPT


# Kernel Level
echo "32768" > /proc/sys/net/ipv4/ip_conntrack_max
echo "1"     > /proc/sys/net/ipv4/tcp_abort_on_overflow
echo "1"     > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo "1"     > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
echo "1"     > /proc/sys/net/ipv4/ip_forward

for i in /proc/sys/net/ipv4/conf/*/rp_filter 
do
  echo 0 > $i 
done

for i in /proc/sys/net/ipv4/conf/*/log_martians
 do
  echo 1 > $i 
 done

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.459 / Virus Database: 258 - Release Date: 25/2/2003
 


