From: "Willem-Jan Meijer" <meyer3@chello.nl>
Subject: Firewall troubles
Date: Thu, 5 Jun 2003 15:43:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c32b68$6bc631d0$0500a8c0@m28721.findquick.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0001_01C32B79.2F4F01D0"
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
To: Netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0001_01C32B79.2F4F01D0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

I'm running debian 3.0r1 stable with all security and usual updates. I =
was
running a=20
firewall wich is send with this e-mail as attachment.=20

It was running fine, but recently my hdd died and recovery was to =
expensive
and not=20
necessary because I had a backup. I installed debian again, did all =
updates
and I wanted=20
to load the firewall, but when I load this one, my remote login hangs, I
can't ping=20
my server anymore and my network isn't working anymore, but the script =
has
runned fine=20
before. What is the problem? At this moment ipmasq is also installed to =
keep
my network=20
running, this is conflicting, I know but I don't know anything else.

Can someone point me in the right direction? I'm using linux/debian from
november 2002,=20
so my knowledge is very small.

HTH,

Willem-Jan Meijer
Netherlands

Windows: Where do you want to go today?
MacOS:   Where do you want to be tomorrow?
Linux:   Are you coming or what?

------=_NextPart_000_0001_01C32B79.2F4F01D0
Content-Type: text/plain;
	name="fw-meijer.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="fw-meijer.txt"

echo -n "IPTables Firewall."
IPTABLES=3D"/sbin/iptables"

#FLUSH
echo -n "Flush all tables."
$IPTABLES --flush
echo -n "."
$IPTABLES --table nat --flush
echo -n "."
$IPTABLES --delete-chain
echo -n "."
$IPTABLES --table nat --delete-chain
echo ". done"

echo -n " Setting up masquerading rules."
# Set up IPFORWARDing and Masquerading
$IPTABLES --table nat --append POSTROUTING --out-interface eth1 -j =
MASQUERADE
echo -n "."
$IPTABLES --append FORWARD --in-interface eth1 -j ACCEPT
echo ". done"

echo -n "Setting rules for loopback device."
# Allow loopback access.
$IPTABLES -A INPUT -i lo -p all -j ACCEPT
echo -n "."
$IPTABLES -A OUTPUT -o lo -p all -j ACCEPT
echo -n "."

echo -n "Setting rules for eth0 device."
# accept established connections
$IPTABLES -A INPUT -i eht0 -m state --state ESTABLISHED,RELATED -j =
ACCEPT
echo -n "."
#$IPTABLES -A INPUT -p tcp --tcp-option ! 2 -j REJECT --reject-with =
tcp-reset
#echo -n "."
$IPTABLES -A INPUT -p tcp -i eth0 --dport 21 -j ACCEPT
echo -n "."
$IPTABLES -A INPUT -p udp -i eth0 --dport 21 -j ACCEPT
echo -n "."
$IPTABLES -A INPUT -p tcp -i eth0 --dport 22 -j ACCEPT
echo -n "."
$IPTABLES -A INPUT -p udp -i eth0 --dport 22 -j ACCEPT
echo -n "."
$IPTABLES -A INPUT -p tcp -i eth0 --dport 25 -j ACCEPT
echo -n "."
$IPTABLES -A INPUT -p udp -i eth0 --dport 25 -j ACCEPT
echo -n "."
$IPTABLES -A INPUT -p tcp -i eth0 --dport 80 -j ACCEPT
echo -n "."
$IPTABLES -A INPUT -p udp -i eth0 --dport 80 -j ACCEPT
echo -n "."
$IPTABLES -A INPUT -p tcp -i eth0 --dport 110 -j ACCEPT
echo -n "."
$IPTABLES -A INPUT -p udp -i eth0 --dport 110 -j ACCEPT
echo -n "."
$IPTABLES -A INPUT -p tcp -i eth0 --dport 65500:65535 -j ACCEPT
echo -n "."
$IPTABLES -A INPUT -p udp -i eth0 --dport 65500:65535 -j ACCEPT
echo -n "."
$IPTABLES -A INPUT -p icmp -i eth0 -j ACCEPT
echo ". done"

echo -n " Setting rules for eth1 device."
# Accept all incoming connections
$IPTABLES -A INPUT -i eth1 -p all -j ACCEPT
echo ". done"

echo -n " Drop all other connection attempts."
$IPTABLES -P INPUT DROP
echo ". done"
------=_NextPart_000_0001_01C32B79.2F4F01D0--



