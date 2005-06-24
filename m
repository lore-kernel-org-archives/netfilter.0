From: Guenter.Sprakties@team4.de
Subject: static 1:1 nat did not work
Date: Fri, 24 Jun 2005 08:26:42 +0200
Message-ID: <OFBCF8CF54.D20A4809-ONC125700E.003D446D-C125702A.00236718@team4.de>
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

'cause I didn't get iptables nat to work, I switch back to an old 2.4=20
kernel and iproute2.

Three network segments, one intranet 172... , one dmz 192. .... one=20
extranet 212.a.b....=20

iproute2 setting is simple:

        # Fast-NAT f=FCr DMZ-Intranet
        ip rule add from 192.168.2.20 nat 172.31.27.20 to 172.31.24.0/24=20
table dmz prio 100
        ip route add nat 172.31.27.20 via 192.168.2.20 table local
         # Fast-NAT f=FCr DMZ-Internet (hier Extranet :-))
        ip rule add from 192.168.2.20 nat 212.a.7b.c table dmz prio 200
        ip route add nat 212.a.b.c via 192.168.2.20 table local
        # Defaultroute einrichten
        ip route add default via 212.117.70.33
        ip route flush cache

ping from 172... to 172.31.27.20 is ok, in iptables we see
=20
       ping  src 172. ... 10   -> 192.168.2.20
       pong src 192.168.2.20 -> 172. ... 10

Now we activated a apache on our test-dmz system and tried to GET the site =

from intern.
Surprisire, it didn't work. From the one side, we saw all tcp-packet in=20
the iptables log, but in the webserver log nothing happens and we got the=20
message in our browser 'server not found'. With the not natted ip of=20
192.168.2.20, everything is fine. For testing, we didn't start iptables at =

all an dused ip=5Fforward alone, again, we did not get the server while=20
there was definitive no  rule against routing. And, like i said at the=20
strart, ICMP work fine.

Any idea? Or wrong group b'cause an apache problem?

Greetings,

Dr. G=FCnter Sprakties
---
