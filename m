From: "Stephan Viljoen" <stephan@panintra.com>
Subject: MSM Mesanger through a iptables firewall.
Date: Thu, 4 Jul 2002 16:06:37 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <003e01c22364$03356d50$f218dcc1@Tink>
References: <200FAA488DE0D41194F10010B597610D2BA20C@JUPITER> <1025744168.3d239d282366f@www.solucoesip.net> <20020704080226.A4820@trot>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi there , some of my clients is having problems to send files to each other
with MSN. The problem
seems to be that I'm running 2 firewalls behind each other.

PC 1 can't send a file to PC 2 but PC 2 can send a file to PC 1. PC 3 and PC
1 can send files
to each other.  Now all the pcs can serve the web , ftp , chat , blah blah
blah. I'm not blocking any ports what
so ever , so it's just masq. and normal packet forwarding.

Here's all the information.

Help will be apreciated.

PC 1 :
IP : 10.0.0.10 , Gateway : 10.0.0.1

Firewall 1:
eth0 : 193.220.24.230 : uplink  , Gateway : 193.220.24.193
eth1 : 10.0.0.1/16

echo "   enabling forwarding.."
echo "1" > /proc/sys/net/ipv4/ip_forward
$IPTABLES -F
$IPTABLES -X
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -t nat -A POSTROUTING -s 10.0.0.1/16 -o eth0 -j MASQUERADE
$IPTABLES -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATED -j
ACCEPT
$IPTABLES -A FORWARD -i eth1 -o eth0 -j ACCEPT

Firewall 2:
eth0 : 193.220.24.8
eth1 : 193.220.24.193
eth2 : 192.168.1.1

$IPTABLES -F
$IPTABLES -X
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATED -j
ACCEPT
$IPTABLES -A FORWARD -i eth1 -o eth0 -j ACCEPT

$IPTABLES -t nat -A POSTROUTING -s 192.168.1.1/24 -o $EXTIF -j MASQUERADE
$IPTABLES -A FORWARD -i eth0 -o eth2 -m state --state ESTABLISHED,RELATED -j
ACCEPT
$IPTABLES -A FORWARD -i eth2 -o eth0 -j ACCEPT

PC 2 :
IP : 193.220.24.242 , Gateway : 193.220.24.193

PC3 :
IP : 192.168.1.10 , Gateway : 192.168.1.1




