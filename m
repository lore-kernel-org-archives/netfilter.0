From: Julien <dyna@tri-oxyde.org>
Subject: Re: routing mail on a different gateway
Date: Fri, 23 Jul 2004 12:09:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4100E3EF.9050707@tri-oxyde.org>
References: <4100CB67.5060507@tri-oxyde.org> <004801c47093$c781ea20$e68923d4@shark.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004801c47093$c781ea20$e68923d4@shark.ro>
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

Daniel Colicov wrote:

>Good Morning,
>
>I have a linux box with two dsl modems on it (connection is done via
>pppoe), I'm trying to route default traffic on the primary connection
>(ppp0) and mail traffic on another one (ppp1).
>
>This traffic should be able to come from the localhost or the lan via
>NAT.
>
>I run Slackware 9.1 (Kernel 2.4.22), recompiled with necessary options
>for using iproute2.
>
>According to the advanced routing howto, I did the following :
>
>iptables =E2=88=92A PREROUTING =E2=88=92i eth0 =E2=88=92t mangle =E2=88=92=
p tcp =E2=88=92=E2=88=92dport 25 =E2=88=92j MARK
>=E2=88=92=E2=88=92set=E2=88=92mark 1
>iptables =E2=88=92A PREROUTING =E2=88=92i lo =E2=88=92t mangle =E2=88=92=
p tcp =E2=88=92=E2=88=92dport 25 =E2=88=92j MARK
>=E2=88=92=E2=88=92set=E2=88=92mark 1
>
>I'm not sure whether "lo" is needed.
>
>echo 201 mail.out >> /etc/iproute2/rt_tables
>ip rule add fwmark 1 table mail.out
>
>/sbin/ip route add default via [Second's ISP Gateway] dev ppp1 table
>mail.out
>
>I get no error message, and ip rule ls and ip route show params where
>recorded.
>
>But if I do telnet somemail.server.com 25, I get a timeout and no data
>is sent via ppp1 (seen using ifconfig ppp1 or tcpdump -i ppp1).
>
>I can't figure what can be wrong nor where I should start looking for.
>I also looked in the ip-cref doc and found nothing that could help me.
>
>Feel free to ask me on any point I would have forgotten.
>
>Do you have an idea in order to solve this problem ?
>
>Thanks, in advance !
>
>hello,
>2 days ago i had the same problem...do you use SNAT option to nat the
>users behind the server? if you do, try iptables -t nat -I
>POSTROUTING -p tcp -s 10.0.255.0/24 --dport 25 -j MASQUERADE and in
>forward put a -I FORWARD -s 10.0.255.0/24 -j ACCEPT...I used SNAT with
>iproute and marking packets and didn't work(it's a little difficult) so
>i choose to use MASQUERADE instead. replace the LAN ips with
>yours....then iptables -t mangle -I PREROUTING -s 10.0.255.0/24 -j
>MARK --set-mark 2
>then :
>echo 50 mail.out >> /etc/iproute2/rt_table
> ip rule add fwmark 2 prio 50 table mail.out
>ip route add default via 10.0.254.1 dev eth2 table mail.out   (dev eth2
>is the ethernet with the second provider, eth1 with 1st isp and eth0
>with LAN)
>ip route flush cache...use tcpdump to see the packets.
>so should be work...
>
>good luck
> =20
>
Thanks for your answer. Actually I use MASQUERADE, I just made a new=20
post relating what I see now, you can take a look at it if you want, if=20
you have an idea ;-)

Julien.


