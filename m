From: "FRANCO" <facatena@surson.com.br>
Subject: RES: I want to find a good script to make my firewall up
Date: Sun, 30 Mar 2003 10:06:39 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAuo8zdkdi7k61lwTUcExU18KAAAAQAAAAFs8iAuzW6keNbAn+OX0+xgEAAAAA@surson.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: 
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



Hello, =20
 =20
thank you very much for having answered me so quickly. =20
 =20
I need a script that closes the more doors you criticize, as well as it
avoids attacks for scan, fllod, spoofing, trojans and things like =
this...
Besides I need something for to avoid or to protect who uses ICQ, KAAZA =
and
MESSENGER.  =20
I have been having countless problems with mine it plans that rotates
iptables + it DANCES THE SAMBA + WEBMIN. The SAMBA doesn't authenticate =
in
him same (smbclient \ \samba\netlogon -U user%passwd). I already changed
everything that was possible, only remaining the firewall. =20
 =20
[]s


# Antes de tudo, chama os modulos

# Script para chamar todos os modulos do iptables
# Se mudar o kernel, necessita mudar este script
for i in `ls /lib/modules/2.4.18-2cl/kernel/net/ipv4/netfilter/ip*|cut =
-f \
3 -d "."|cut -f 6 -d "/"|grep -v ipchains`;do  modprobe $i;done


# Limpa todas regras
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -t nat -F
iptables -t mangle -F
#limpa todos os chains
iptables -X
iptables -t nat -X
iptables -t mangle -X

# Politicas default
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# Evite usar pol=EDticas de drop (conversado no telefone)=20
#iptables -P FORWARD DROP iptables -P FORWARD ACCEPT=20
#modprobe ip_tables #insmod ip_conntrack=20
#insmod ip_conntrack_ftp #modprobe ipt_LOG=20
#modprobe ipt_multi[Bport=20
#modprobe ipt_REJECT=20
#modprobe ipt_MASQUERADE=20
# Regras de entrada (utilizando o multiport)=20
#iptables -A INPUT -i eth0 -m multiport -p tcp --dport
21,22,25,53,80,110,500,3128 -j LOG iptables -A INPUT -s
192.168.1.0/255.255.255.0 -p tcp --dport 81 -j LOG --log-prefix "WEB =
INTERNA
"

iptables -A INPUT -i eth0 -m multiport -p tcp --dport
21,22,25,53,80,110,500,1753,3128 -j ACCEPT iptables -A INPUT -i eth0 -m
multiport -p udp --dport 21,25,53,500,1753 -j ACCEPT #iptables -A INPUT =
-s
192.168.1.0/255.255.255.0 -p  tcp --dport 22 -j LOG

#aceita netbios interna

iptables -A INPUT -i eth1 -m multiport -p tcp --dport 135,137,138,139 -j =
LOG
--log-prefix "FIRE NETTCP IN" iptables -A INPUT -i eth1 -m multiport -p =
udp
--dport 135,137,138,139 -j LOG --log-prefix "FIRE NETUDP IN " iptables =
-A
INPUT -i eth1 -m multiport -p tcp --dport 135,137,138,139 -j ACCEPT =
iptables
-A INPUT -i eth1 -m multiport -p udp --dport 135,137,138,139 -j ACCEPT

#VPN
iptables -A INPUT -i eth0 -p 47 -j LOG --log-prefix "FIREWALL IN VPN"
iptables -A INPUT -i eth1 -p tcp --dport 3128 -j LOG --log-prefix =
"Firewall
SQUID: " iptables -A INPUT -i eth0 -p 47 -j ACCEPT #iptables -A INPUT -i
eth1 -p tcp --dport 3128 -j ACCEPT

#NULL SCAN
iptables -A INPUT -i eth0 -p tcp -m tcp --tcp-flags ALL NONE -j LOG
--log-level crit --log-prefix " NMAP NULL SCANNING: " iptables -A INPUT =
-i
eth0 -p tcp -m tcp --tcp-flags ALL NONE -j DROP iptables -A INPUT -i =
eth0 -p
tcp -m tcp --tcp-flags ALL NONE -j DROP

#porta 22
iptables -A INPUT -s 192.168.1.0/255.255.255.0 -p  tcp --dport 22 -j =
ACCEPT


iptables -A INPUT -j ACCEPT -m state --state RELATED,ESTABLISHED

# bloqueio a tentativa de acesso externo ao SQUID
#iptables -A INPUT -i eth0 -p tcp --dport 3128 -j DROP

iptables -A INPUT -i eth0 -j LOG --log-prefix "FIREWALL : INPUT "

iptables -A INPUT -i eth0 -j DROP

# Regras de Saida + LOG
iptables -A OUTPUT -o eth0 -m multiport -p tcp --dport 135,137,138,139 =
-j
LOG --log-prefix "FIRE NETTCP OUT " iptables -A OUTPUT -o eth0 -m =
multiport
-p udp --dport 135,137,138,139 -j LOG --log-prefix "FIRE NETUDP OUT "
iptables -A OUTPUT -o eth0 -m multiport -p tcp --dport 135,137,138,139 =
-j
DROP iptables -A OUTPUT -o eth0 -m multiport -p udp --dport =
135,137,138,139
-j DROP iptables -A OUTPUT -o eth0 -j ACCEPT

# NAT
#iptables -t nat -A PREROUTING -j NAT --to-dest 192.168.1.1 -d
apache.surson.com.br -p tvp iptables -t nat -A PREROUTING -j DNAT =
--to-dest
192.168.1.2 -i eth0 -p tcp -m multiport --dport
21,25,80,110,3389,137,50,51,1723 iptables -t nat -A PREROUTING -j DNAT
--to-dest 192.168.0.1 -i eth0 -p 47

# Masquerade
#iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

#Regra Masquerade mudada devido ao VPN

iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/255.255.0.0 -d
192.168.0.0/255.255.0.0 -j LOG --log-prefix "Firewall VPN " iptables -t =
nat
-A POSTROUTING -o eth0 -s 192.168.0.0/255.255.0.0 -d \!
192.168.0.0/255.255.0.0 -j MASQUERADE


# Bloqueio de saida de pacotes do tipo Windows Networking iptables -A
FORWARD -i eth0 -m multiport -p tcp --dport 135,137,138,139 -j LOG
--log-prefix " Fire BLOQ TCP NETBIOS " iptables -A FORWARD -i eth0 -m
multiport -p udp --dport 135,137,138,139 -j LOG --log-prefix " Fire BLOQ =
UDP
NETBIOS " iptables -A FORWARD -i eth0 -m multiport -p tcp --dport
135,137,138,139 -j DROP iptables -A FORWARD -i eth0 -m multiport -p udp
--dport 135,137,138,139 -j DROP

# Forwarding para saida
iptables -A FORWARD -i eth0 -m state --state ESTABLISHED,RELATED -j =
ACCEPT
iptables -A FORWARD -i eth1 -j ACCEPT

# Limita acao de ips internos a outros squids

iptables -A FORWARD -s 192.168.1.0/24 -d ! 192.168.1.1 -p tcp  --dport =
3128
-j DROP iptables -A FORWARD -s 192.168.1.0/24 -d ! 192.168.1.1 -p tcp
--dport 8080 -j DROP #iptables -A FORWARD -s 192.168.1.1/24 -p tcp =
--dport
80 -j DROP



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




Franco Catena
http://www.surson.com.br
tel 011-50813861
cel:78535362
NEXTEL: 55*26006*1
MSN: facdavilla@hotmail.com
ICQ: 24755602


-----Mensagem original-----
De: Kim Jensen [mailto:kimj@dawn.dk]=20
Enviada em: domingo, 30 de mar=E7o de 2003 09:45
Para: FRANCO; 'Changho Choi'; netfilter@lists.netfilter.org
Assunto: Re: I want to find a good script to make my firewall up


On Sunday 30 March 2003 14:25, FRANCO wrote:
> Good morning,
>
> could they find out where I get a SCRIPT for maintaining my FIREWALL
> the best configured possible and more I also hold?
>
> Thank you very much
>
Please specify your needs - there are many different ways of setting up =
a=20
firewall, so unless we know what you wish for, then it is hard for us to =

help.

Nomatter, you can find some good guidelines for setting up your firewall =
in=20
the netfilter documentation.

/Kim

---
Incoming mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.465 / Virus Database: 263 - Release Date: 25/3/2003
=20

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.465 / Virus Database: 263 - Release Date: 25/3/2003
=20

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.465 / Virus Database: 263 - Release Date: 25/3/2003
=20


