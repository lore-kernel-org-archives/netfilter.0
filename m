From: Julien <dyna@tri-oxyde.org>
Subject: routing mail on a different gateway
Date: Fri, 23 Jul 2004 10:25:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4100CB67.5060507@tri-oxyde.org>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@lists.netfilter.org

Good Morning,

I have a linux box with two dsl modems on it (connection is done via=20
pppoe), I'm trying to route default traffic on the primary connection=20
(ppp0) and mail traffic on another one (ppp1).

This traffic should be able to come from the localhost or the lan via NAT=
.

I run Slackware 9.1 (Kernel 2.4.22), recompiled with necessary options=20
for using iproute2.

According to the advanced routing howto, I did the following :

iptables =E2=88=92A PREROUTING =E2=88=92i eth0 =E2=88=92t mangle =E2=88=92=
p tcp =E2=88=92=E2=88=92dport 25 =E2=88=92j MARK=20
=E2=88=92=E2=88=92set=E2=88=92mark 1
iptables =E2=88=92A PREROUTING =E2=88=92i lo =E2=88=92t mangle =E2=88=92p=
 tcp =E2=88=92=E2=88=92dport 25 =E2=88=92j MARK=20
=E2=88=92=E2=88=92set=E2=88=92mark 1

I'm not sure whether "lo" is needed.

echo 201 mail.out >> /etc/iproute2/rt_tables
ip rule add fwmark 1 table mail.out

/sbin/ip route add default via [Second's ISP Gateway] dev ppp1 table=20
mail.out

I get no error message, and ip rule ls and ip route show params where=20
recorded.

But if I do telnet somemail.server.com 25, I get a timeout and no data=20
is sent via ppp1 (seen using ifconfig ppp1 or tcpdump -i ppp1).

I can't figure what can be wrong nor where I should start looking for.
I also looked in the ip-cref doc and found nothing that could help me.

Feel free to ask me on any point I would have forgotten.

Do you have an idea in order to solve this problem ?

Thanks, in advance !

Julien.


