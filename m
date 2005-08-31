From: "Michael Ellerbeck" <mellerbeck@NationalFrozenFoods.com>
Subject: Filter Question: Only allow telnet, DNS, DHCP in
Date: Wed, 31 Aug 2005 08:57:04 -0700
Message-ID: <EFBC01AFAA255D4FBABF7756DE4AFD2355A9@seattle-mail1.nffc.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Running Devil Linux so iptables is version 1.2.11
=20
Trying to setup rules that will only allow connections in on telnet,
DNS, and DHCP Also the telnet rule should only allow connections that
are destined for 10.0.0.1
=20
So setting all initials chains to drop
{$IPTABLES} -P INPUT DROP
{$IPTABLES} -P OUTPUT DROP
{$IPTABLES} -P FORWARD DROP
=20
$IPTABLES -A INPUT -p tcp -i eth1 -d 10.0.0.1 --dport 23 -m state
--state NEW,ESTABLISHED -j ACCEPT
=20
Is it OK to do this on the INPUT? This box is also a router, will the
iptables happen before any routing happens. I guess my question is one
of order. When a packet comes in will it be handled by the iptables
INPUT first?
=20
How can I safely allow outgoing packets?
=20
To allow DNS and DHCP in can I do something like
=20
$IPTABLES -A INPUT -p tcp -i eth1 --dport 53 -m state --state
NEW,ESTABLISHED -j ACCEPT #DNS $IPTABLES -A INPUT -p tcp -i eth1 --dport
67 -m state --state NEW,ESTABLISHED -j ACCEPT #DHCP $IPTABLES -A INPUT
-p tcp -i eth1 --dport 68 -m state --state NEW,ESTABLISHED -j ACCEPT
#DHCP
=20
How can I allow these ports out?
=20
Thank you for your help!
=20
-Michael
=20
