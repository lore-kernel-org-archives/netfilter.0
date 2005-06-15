From: Mohamed Nassih <nassih50@yahoo.com>
Subject: Firewall problem
Date: Tue, 14 Jun 2005 20:14:24 -0700 (PDT)
Message-ID: <20050615031424.30876.qmail@web30602.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Hi,
=20
 I have this firewall script, the problem is that I can not connect to the =
webserver (123.45.67.2) from the local network (192.168.1.0).
=20
Please help.
=20
echo 1 > /proc/sys/net /ipv4/ip_forward
IPTABLES -F INPUT=20
IPTABLES -F OUTPUT=20
IPTABLES -F FORWARD
IPTABLES -P INPUT DROP=20
IPTABLES -P OUTPUT DROP=20
IPTABLES -P FORWARD DROP=20
Iptables =96A INPUT  -i lo =96j ACCEPT
Iptables =96A OUTPUT  -o lo =96j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth1 -p tcp -d 123.45.67.2 --destination-port 80=20
=96m state --state NEW,ESTABLISHED  -j ACCEPT
iptables -A FORWARD =96p tcp -i eth0 =96-source-port 80 =96m state --state =

ESTABLISHED -j ACCEPT


	=09
---------------------------------
Discover Yahoo!
 Get on-the-go sports scores, stock quotes, news & more. Check it out!
