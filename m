From: iptables@isabeldeespana.org
Subject: problem with iptables with forward drop  policy.
Date: Tue, 23 Sep 2003 19:22:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030923182247.18490.qmail@servidor1.isabeldeespana.org>
Reply-To: iptables@isabeldeespana.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I manage a network with three diferent range of IP=B4s 192.168.1.0 ,=20
192.168.2.0 and 192.168.3.0.=20

I have a router-firewall which connect theese internals networks.=20

iptables rules on the router-firewall machine are...=20


$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F=20


$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -j LOG=20


$IPTABLES -A FORWARD -s 192.168.1.19 -j ACCEPT=20

=20

=20

Of corse, $IPTABLES is a var which point to iptables.=20

Supose that router has 192.168.1.1, 192.168.2.1 and 192.168.3.1 IP=B4s.=20

 From host 192.168.1.19 which is a window machine I ping to machine=20
192.168.3.15 which is a linux machine. the result is Ok.=20

If I ping from 192.168.1.19 to 192.168.3.35 which is a window machine I=20
can=B4t get a response.=20

Nevertheless, If I change the policy of forward (which is DROP by default, =

see the above script) to ACCEPT:=20

iptables -P FORWARD ACCEPT=20

and I try pinging from 192.168.1.19 to 192.168.3.35 ( both of them are=20
windows machine), So I get a succes response from 192.168.3.35.=20

I can ping from router to every IP on every network with forward policy set=
=20
as DROP by default.=20

Could you help me with the problem?=20


Thanks in advance.=20


