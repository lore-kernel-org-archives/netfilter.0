From: "James Miller" <jimm@simutronics.com>
Subject: Only one VPN connection
Date: Wed, 23 Jul 2003 09:38:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NDBBKABJBJCIJNAELLKEMEODJCAA.jimm@simutronics.com>
Reply-To: <jimm@simutronics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: users@lists.freeswan.org
Cc: netfilter@lists.netfilter.org

Hello everyone.

I'm cross posting this message because I'm not sure if my problem is a
Freeswan, IPTables, or both ;).  I can establish only one VPN connection to
our internal network.  If someone else connects, I can no-longer see our
network, if I run ipsec.exe on my workstation (from home) I can reconnect
and the other person gets booted off.  My firewall is acting as the Freeswan
VPN server, I'm running Linux 2.4.21, Super-freeswan-1.99.7.3 and grsecurity
(it doesn't matter if I have grsec enabled or disabled, I get the same
results).  I'm sure it's something stupid that I'm missing.. and I hope that
some additional pairs of eyes can help me determine what I'm doing wrong.


Here's my IPTables rules:

# eth1 is external IP of FW/VPN server
$IPTABLES -N eth1_In_RULE_0
$IPTABLES -A INPUT -i eth1 -p udp -d $FW_VPN_EXT_IP --destination-port
500 -m state --state NEW -j eth1_In_RULE_0
$IPTABLES -A INPUT -i eth1 -p 50 -d $FW_VPN_EXT_IP -m state --state NEW -j
eth1_In_RULE_0
$IPTABLES -A INPUT -i eth1 -p 51 -d $FW_VPN_EXT_IP -m state --state NEW -j
eth1_In_RULE_0
$IPTABLES -A eth1_In_RULE_0 -j LOG --log-level info --log-prefix "IPSec_IN "
$IPTABLES -A eth1_In_RULE_0 -j ACCEPT

$IPTABLES -N eth1_Out_RULE_0
$IPTABLES -A OUTPUT -o eth1 -p udp -d $FW_VPN_EXT_IP --destination-port
500 -m state NEW -j eth1_IN_RULE_0
$IPTABLES -A OUTPUT -o eth1 -p 50 -d $FW_VPN_EXT_IP -m state --state NEW -j
eth1_Out_RULE_0
$IPTABLES -A OUTPUT -o eth1 -p 51 -d $FW_VPN_EXT_IP -m state --state NEW -j
eth1_Out_RULE_0
$IPTABLES -A eth1_Out_RULE_0 -j LOG --log-level info --log-prefix "IPSec_OUT
"
$IPTABLES -A eth1_Out_RULE_0 -j ACCEPT


# eth0 is the internal (trusted) Iface of the FW
$IPTABLES -N RULE_IPSec_FORWARD
$IPTABLES -A FORWARD -i eth0 -o ipsec+ -j RULE_IPSec_FORWARD
$IPTABLES -A FORWARD -i ipsec+ -o eth0 -j RULE_IPSec_FORWARD
$IPTABLES -A RULE_IPSec_FORWARD -j LOG --log-level info --log-prefix
"IPSec_int_Iface_FORWARD "
$IPTABLES -A RULE_IPSec_FORWARD -j ACCEPT

---------------------
WinXP ipsec.conf -- No NAT on client side
conn roadwarrior
	left=%any
	right=207.xxx.xxx.xxx (external IP of FW/VPN server)
	rightca="commented-out"
	network=auto
	auto=start
	pfs=yes

conn roadwarrior-net
	left=%any
	right=207.xxx.xxx.xxx (external IP of FW/VPN server)
	rightsubnet=xxx.xx.xxx.0/255.255.255.0 (internal real IP network)
	rightca="commented-out"
	network=auto
	auto=start
	pfs=yes

------------------------------------
/etc/ipsec.conf on server
config setup
	interfaces=%defaultroute
	klipsdebug=none
	plutodebug=none
	plutoload=%search
	plutostart=%search
	uniqueids=yes

conn %default
	keyingtries=1
	compress=yes
	disablearrivalcheck=no
	authby=rsasig
	leftrsasigkey=%cert
	rightrsasigkey=%cert

conn roadwarrior-net
	leftsubnet=xxx.xx.xxx.0/255.255.255.0 (internal real IP network)
	also=roadwarrior

conn roadwarrior
	right=%any
	left=%defaultroute
	leftcert=Server.CertFilename.pem
	auto=add
	pfs=yes



Thank you very much for your help!
-->jim



