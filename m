From: Mohamed Nassih <nassihmohamed@caramail.com>
Subject: iptables and permits ports
Date: Wed, 11 Sep 2002 21:23:46 GMT+1
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1031772226005316@caramail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_NextPart_Caramail_0053161031772226_ID"
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
To: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--=_NextPart_Caramail_0053161031772226_ID
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


 Hi,

 my firewall file is like below, It is work without any 
problem, today I test to connect to a oracle server via the 
internet from inside to the port 1521(in outside oracle 
server), and it is work.

 Normaly as you can see from the roles I drop all paquets 
that do not have as a distination-port www,ftp..the 
firewall must drop all paquets with the port-destination 
1521!!
 Can I have please explanation of this..


The firewall file :

/sbin/modprobe iptables iptable_nat 
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_irc
/sbin/modprobe iptable_filter

if [ -e /proc/sys/net/ipv4/conf/all/rp_filter ]
then
for filtre in /proc/sys/net/ipv4/conf/*/rp_filter
do
echo 1 > $filtre
done
fi

echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

iptables -F
iptables -X

iptables -t nat -A POSTROUTING -o eth0 -s 10.154.17.0/24 -j 
MASQUERADE

iptables -A INPUT -i eth0 -s 199.243.181.226 -j DROP

iptables -A INPUT -i eth1 -s ! 10.154.17.0/24 -j DROP
iptables -A INPUT -i eth0 -p tcp ! --syn -m state --state 
NEW -j DROP

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j 
ACCEPT

iptables -A INPUT -i eth1 -p tcp --destination-port www -j 
ACCEPT
iptables -A INPUT -i eth1 -p tcp --destination-port ftp -j 
ACCEPT
iptables -A INPUT -i eth1 -p tcp --destination-port ftp-
data -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --destination-port smtp -j 
ACCEPT
iptables -A INPUT -i eth1 -p tcp --destination-port 110 -j 
ACCEPT
iptables -A INPUT -i eth1 -d 198.235.216.131 -p udp --
destination-port domain -j ACCEPT
iptables -A INPUT -i eth1 -d 198.235.216.131 -p tcp --
destination-port domain -j ACCEPT
iptables -A INPUT -i eth1 -d 198.235.216.130 -p udp --
destination-port domain -j ACCEPT
iptables -A INPUT -i eth1 -d 198.235.216.130 -p tcp --
destination-port domain -j ACCEPT

iptables -A INPUT -i eth0 -p tcp --destination-port www -j 
ACCEPT
iptables -A INPUT -i eth0 -p tcp --destination-port ftp -j 
ACCEPT
iptables -A INPUT -i eth0 -p tcp --destination-port ftp-
data -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --destination-port smtp -j 
ACCEPT
#iptables -A INPUT -i eth0 -p tcp --destination-port 110 -j 
ACCEPT

iptables -A INPUT -p tcp --dport 113 -j REJECT --reject-
with tcp-reset

iptables -A INPUT -j DROP

Thanks in advance.
______________________________________________________
Bo=EEte aux lettres - Caramail - http://www.caramail.com


--=_NextPart_Caramail_0053161031772226_ID--


