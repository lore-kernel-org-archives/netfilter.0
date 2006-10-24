From: "=?ISO-8859-1?Q?Juan_Carlos_Pel=E1ez_Mendoza?=" <jcpelaez@gmail.com>
Subject: Blocking SMTP Worm
Date: Tue, 24 Oct 2006 08:54:41 -0500
Message-ID: <19fb1ac90610240654x44bdd20em7e04b21469739a10@mail.gmail.com>
References: <19fb1ac90610240653x69cc1951g9766d7c809ddecef@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <19fb1ac90610240653x69cc1951g9766d7c809ddecef@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hi list,

My IP Address have been listed in the RBL's too many times, I
installed into my linux box MailScanner + Spamassassin + Clamavmodule
+ FProt, I set up the iptables rules allowing only smtp, pop and ssh
traffic, but when I see the traffic with tcpdump I see this strange
behavior:

17:14:42.255867 IP 192.168.0.92.2802 >
Static-IP-cr2001181.cable.net.co.smtp: S 396792405:396792405(0) win
16384 <mss 1460,nop,nop,sackOK>
17:14:43.457612 IP 192.168.0.92.2803 >
Static-IP-cr2001181.cable.net.co.smtp  : S 760094736:760094736(0) win
16384 <mss 1460,nop,nop,sackOK>
17:14:46.512975 IP 192.168.0.92.2804 >
Static-IP-cr2001181.cable.net.co.smtp: S 804817506:804817506(0) win
16384 <mss 1460,nop,nop,sackOK>
17:14:49.466442 IP 192.168.0.92.2804 >
Static-IP-cr2001181.cable.net.co.smtp: S 804817506:804817506(0) win
16384 <mss 1460,nop,nop,sackOK>
17:14:50.118528 IP 192.168.0.92.2805 > mailgw2.diveo.net.co.smtp  : S
2079962326:2079962326(0) win 16384 <mss 1460,nop,nop,sackOK>
17:14:53.071734 IP 192.168.0.92.2805 > mailgw2.diveo.net.co.smtp: S
2079962326:2079962326(0) win 16384 <mss 1460,nop,nop,sackOK>

I see the traffic today and still getting that result after blocking
the traffic for the  192.168.0.92 address:

08:40:10.664379 IP 192.168.0.92.2728 >
emt200-31-197-53.emtelco.com.smtp: S 3599806789:3599806789(0) win
16384 <mss 1460,nop,nop,sackOK>
08:40:16.683771  IP 192.168.0.92.2728 >
emt200-31-197-53.emtelco.com.smtp: S 3599806789:3599806789(0) win
16384 <mss 1460,nop,nop,sackOK>
08:40:20.731636 IP 192.168.0.92.2731 >
bbvaganadero.telefonica.net.co.smtp: S 4026584844:4026584844(0) win
16384 <mss 1460,nop,nop,sackOK>
08:40:23.706369 IP 192.168.0.92.2731 >
bbvaganadero.telefonica.net.co.smtp: S 4026584844:4026584844(0) win
16384 <mss 1460,nop,nop,sackOK>


What can I do to stop and block this worm???

Here are my basic rules for IPtables.


echo 1 > /proc/sys/net/ipv4/ip_forward
iptables --flush
modprobe ip_conntrack
modprobe ip_conntrack_ftp
modprobe ip_nat_ftp
modprobe ip_conntrack_irc

iptables --table nat --flush

  iptables --table nat --append POSTROUTING --out-interface eth0 -j MASQUER=
ADE
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

#Blocking  192.168.0.92 SMTP Traffic
 iptables -A FORWARD -p tcp --dport 25 -s 192.168.0.92 -j DROP

iptables -A FORWARD -i eth1 -j ACCEPT

echo "Enrutamiento Activado..."

# Bloqueando ip  218.55.23.50
iptables -A INPUT -s 218.55.23.50 -j DROP

# Bloqueando ip  201.160.33.60
iptables -A INPUT -s  201.160.33.60 -j DROP

iptables -A INPUT -s 192.168.0.92 -j DROP
iptables -A FORWARD -p tcp --dport 25 -j DROP

#Permitir trafico de entrada a puertos SMTP, POP, SSH
 iptables -A INPUT -p tcp --dport 25 -s 192.168.0.0/24 -d PRIVATE_IP -j ACC=
EPT
iptables -t filter -A INPUT -p tcp -s 0/0 -d  PUBLIC_IP --dport 25 -j ACCEP=
T
iptables -t filter -A INPUT -p tcp --dport 25 -s  192.168.0.0/24 -d 0/0 -j =
DROP
iptables -A INPUT -p tcp -s 0/0 -d   192.168.0.0/24 --sport 25 -i eth0 -j D=
ROP

iptables -t filter -A INPUT -p tcp -s 0/0 -d 0/0 --dport 110 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 0/0 -d 0/0 --dport 22 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s 0/0 -d 0/0 --dport 3306 -j REJECT


# Botar paquetes que vayan de la Lan por el puerto 25
iptables -A FORWARD -p tcp --dport 25 -j DROP



Can anybody help me with this???


Thanks,



Juan Carlos Pel=E1ez Mendoza

