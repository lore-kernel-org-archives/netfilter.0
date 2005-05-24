From: Guenter.Sprakties@team4.de
Subject: static 1:1 natting
Date: Tue, 24 May 2005 14:57:26 +0200
Message-ID: <OFDD2BF39F.8DDEB32C-ONC125700B.00461711-C125700B.00472A18@team4.de>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello,

I didn't get some simple 1:1 static natting (no masq!) to work.

Scenario is like this: Wintel computer with actual sarge 2.6.8-2 and=20
iptables,

three network interfaces
net one: 172.31.24.0/21
net two: 192.168.2.0/24
net three:212.120.70.32/27

net one is the internal, net two the dmz. net three the internet.

We like to do some double natting of our dmz machines:

The (internal) IP of one dmz computer may be 192.168.2.20
The IP from the intranet should be 172.31.27.20
The IP from the internet should be 212.118.72.20

Simple 1:1 static natting, but route dependend. Easily done by iproute2.
No more longer possible because the kernel was changed and nat by ip=20
route/rule isn't possible anymore.

We got several manuals like NAT HOWTO or iptables from LeRoy D. Cressy or=20
double nat HOWTO.
Most of them deal with port forwarding or masquerading. Nice, but this did =

not help.=20
=20
In our test environment, this example for nat from internal didn't work=20
out:

| # NAT
| #
| iptables -t nat -A POSTROUTING -s 192.168.2.20 -o eth0 -j SNAT --to
| 172.31.27.20
| iptables -t nat -A PREROUTING -i eth1 -d 172.31.27.20 -j DNAT --to
| 192.168.2.20

ICMP is allowed (ACCEPT) for alle the INPUT, OUTPUT and FORWARD chain.=20
Without using the rules, a ping between the network chains internal - dmz=20
is possible and can bee seen (all ICMP packet are logged9 by tail -F=20
/var/log/messages, pinging 192.168.2.20 by the use of the natted IP=20
172.31.27.20 give no seen packet in the messages file.

Any idea how to get simple but double nat? Can you give some example?=20

Greetings,

Dr. G=FCnter Sprakties
---
Dr. G=FCnter Sprakties

Burgring 1
52156 Monschau
Germany

Tel.: +49 (2472) 2823
mailto:guenter.sprakties@team4.de
