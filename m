From: "Baake, Matthias" <m.baake@porta.de>
Subject: AW: Rule syntax
Date: Tue, 1 Mar 2005 14:37:34 +0100
Message-ID: <201E6F5AC48C274996A5AD8304FAEF8699E6@p001ex03.porta.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Edwards <chris@wfcs.co.uk>
Cc: netfilter@lists.netfilter.org

the rule should look like this.

/sbin/iptables -t nat -A PREROUTING -p tcp --sport 15871 -j DNAT -d =
xxx.xxx.xxx.193

afaik you cannot use the -o switch in the nat prerouting chain.
i assume you want to change the destination address. but which=20
packet from which interface/ip address should be changed? the=20
best way is you read the nat howto from the netfilter page.

http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO.txt

it is always better to know what are doing with your packets.

greets

matthias baake

-----Urspr=FCngliche Nachricht-----
Von: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]Im Auftrag von Chris
Edwards
Gesendet: Dienstag, 1. M=E4rz 2005 12:39
An: netfilter@lists.netfilter.org
Betreff: Rule syntax


Hi,

Need a bit of help with a rule. I've got a redhat box running a=20
squid/websense installation. It's dualled interfaced on different =
network,=20
and due to an update websense has done, is only contactable on the=20
interface which can't see the default gateway. TO cut a long story short =

it aint working unless i can convince the reply packets to leave out the =

same interface. Putting a route in works for some but not all users, =
what=20
i really need is to be able to redirect all the request as they try to =
go=20
out eth1 to the gateway on eth0.

I've been trying this command:-

/sbin/iptables -t nat -A PREROUTING -o eth1 -p tcp --sport 15871 -j=20
REDIRECT -d xxx.xxx.xxx.193
or
/sbin/iptables -t nat -A OUTPUT -o eth1 -p tcp -s xxx.xxx.xxx.xxx -j=20
REDIRECT -d xxx.xxx.xxx.193

I'm really new to iptables, only having done what the squid installation =

required, can anyone help with how to write a rule that does what i =
need?

Chris
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
If the only tool you have is a hammer, every problem looks like a nail.


