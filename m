From: Paulo Ricardo Bruck <pauloric@contato.com.br>
Subject: iptables + ipsec can't  open an application
Date: Fri, 28 Jan 2005 18:26:04 -0200
Message-ID: <1106943964.28230.18.camel@pauloric.intranet>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: "Netfilter Mailling List (E-mail)" <netfilter@lists.netfilter.org>

Hi guys

I've been testing debian sarge kernel 2.6.8-1 + iptables 1.2.11-8 +
openswan 2.2.0-4 

I can ping from desktop1 to desktop2 , but if I try to see a http page
at desktop1 from desktop 2 I see a connection time out.

desktop1-- iptables/openswan1--internet--iptables/openswan2--desktop2

ping 192.168.1.7 ( desktop 2)
tcpdump from iptables2 wan
IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x78987d47,seq=0x22)
IP 192.168.0.11 > 192.168.1.7: icmp 64: echo request seq 1
IP 200.168.52.239 > 200.207.125.76: ESP(spi=0x1e76f500,seq=0x29)
IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x78987d47,seq=0x23)
ok works


lynx 192.168.1.7 (desktop2)
tcpdump from iptables2 wan
IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x78987d47,seq=0x2c)
IP 192.168.0.11.33654 > 192.168.1.7.80: S 3132491911:3132491911(0) win
5840 <mss 1460,sackOK,timestamp 33947617 0,nop,wscale 0>
IP 200.168.52.239 > 200.207.125.76: ESP(spi=0x1e76f500,seq=0x39)
IP 200.168.52.239 > 200.207.125.76: ESP(spi=0x1e76f500,seq=0x3a)
IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x78987d47,seq=0x2d)
IP 192.168.0.11.33655 > 192.168.1.7.80: S 3148629414:3148629414(0) win
5840 <mss 1460,sackOK,timestamp 33950275 0,nop,wscale 0>
IP 200.168.52.239 > 200.207.125.76: ESP(spi=0x1e76f500,seq=0x3b)
IP 200.207.125.76 > 200.168.52.239: ESP(spi=0x78987d47,seq=0x2e)
IP 192.168.0.11.33655 > 192.168.1.7.80: S 3148629414:3148629414(0) win
5840 <mss 1460,sackOK,timestamp 33953275 0,nop,wscale 0>

important rules iptables/ipsec1
iptables -A INPUT   -p 50 -j ACCEPT
iptables -A FORWARD -p 50 -j ACCEPT
iptables -A INPUT   -p 51 -j ACCEPT
iptables -A FORWARD -p 51 -j ACCEPT
iptables -A INPUT   -p udp --sport 500 --dport 500 -j ACCEPT
iptables -A INPUT   -p udp --sport 4500 --dport 4500 -j ACCEPT
#iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss
1440
iptables -A FORWARD -s 192.168.0.0/24 -d 192.168.1.0/24 -j ACCEPT
iptables -A FORWARD -s 192.168.1.0/24 -d 192.168.0.0/24 -j ACCEPT
iptables -t nat -A POSTROUTING  -o $WAN1 -d ! 192.168.1.0/24 -j SNAT
--to-source $IPWAN1

I ve already tried using TCPMSS, but not solved.

Could anyone give me a clue ? is it a iptables problem or ipsec problem?

thanks in advanced

Paulo Ricardo Bruck



