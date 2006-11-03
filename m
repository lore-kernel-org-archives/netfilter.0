From: "lubasi" <lubasi@zamnet.zm>
Subject: REF: Blocking Yahoo
Date: Fri, 3 Nov 2006 08:54:43 +0200
Message-ID: <380-22006115365443640@zamnet.zm>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

Dear All,

I'm new to this list and netfilter as a whole=2E

I have setup rules on my iptables and when i block yahoo, only those
using gaim IM client using yahoo are blocked but the native yahoo IM
client is passing through my firewall=2E Whats wrong with my chains
below=2E Thank you in advance=2E

My chains

#Allow local loopback connections
/sbin/iptables -A INPUT -i lo -j ACCEPT
# Drop
/sbin/iptables -A INPUT   -m state --state INVALID -j DROP
/sbin/iptables -A OUTPUT  -m state --state INVALID -j DROP
/sbin/iptables -A FORWARD -m state --state INVALID -j DROP

# Allow all established and related
/sbin/iptables -A INPUT   -m state --state ESTABLISHED,RELATED -j
ACCEPT
/sbin/iptables -A OUTPUT  -m state --state ESTABLISHED,RELATED -j
ACCEPT
/sbin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j
ACCEPT

# Allow connection to my ISP's DNS Server
/sbin/iptables -A OUTPUT  -d [isp dns 1] -m state --state NEW -p udp
--dport 53 -o eth0 -j ACCEPT
/sbin/iptables -A OUTPUT  -d [isp dns 2] -m state --state NEW -p udp
--dport 53 -o eth0 -j ACCEPT
/sbin/iptables -A FORWARD -d [isp dns 1] -m state --state NEW -p udp
--dport 53 -i eth1 -o eth0 -j ACCEPT
/sbin/iptables -A FORWARD -d [isp dns 2] -m state --state NEW -p udp
--dport 53 -i eth1 -o eth0 -j ACCEPT

#Allow Mail POP3 and SMTP Connections
/sbin/iptables -A OUTPUT  -d [isp smtp server] -m state --state NEW
-p tcp -m multiport --dport smtp,pop3 -o eth0 -j ACCEPT
/sbin/iptables -A OUTPUT  -d [isp pop mail server] -m state --state
NEW -p tcp -m multiport --dport smtp,pop3 -o eth0 -j ACCEPT

/sbin/iptables -A FORWARD -d [isp smtp server] -m state --state NEW
-p tcp -m multiport --dport smtp,pop3 -o eth0 -j ACCEPT
/sbin/iptables -A FORWARD -d [isp pop server] -m state --state NEW -p
tcp -m multiport --dport smtp,pop3 -o eth0 -j ACCEPT

#Log all other attempts out going connections
/sbin/iptables -A OUTPUT -o [ExternalNET] -j LOG
/sbin/iptables -A FORWARD -j LOG

#Nating
/sbin/iptables -t nat -A POSTROUTING -o [ExternalNET] -j SNAT --to
[ExternalNET IP ADDRESS]

# Route all www traffic to port 3128 for http acceleration
/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j
REDIRECT --to-port 3128

#Block Yahoo Messnger
/sbin/iptables -I FORWARD -s MYNETWORK/24 -d 216=2E155=2E193=2E0/22 -j DRO=
P


Kind regards

Teddy L=2E
------------------------------------------------------
Teddy L=2E Nyambe
Open Source Zambia
www=2Eopensource=2Eorg=2Ezm

+260 97 760473

* Know that today is yesterday's future Be the change you want to see
in the world
* To Err is Human, but to really mess things up, you need a PC


