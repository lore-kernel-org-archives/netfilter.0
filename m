From: Julien <dyna@tri-oxyde.org>
Subject: routing mail traffic through a second interface
Date: Sun, 25 Jul 2004 21:05:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41040489.3030201@tri-oxyde.org>
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

Hi,

I have been trying for a few days now to route mail traffic on a=20
different connection than rest of traffic using iproute2, I already did=20
some posts regarding this problem, and thanks to help of guys here and=20
in the lartc mailing list I succedeed to have a little improvement.

Here are the box infos :

Slackware 9.1 (Linux 2.4.22)
Two dsl connections via pppoe

I only care about locally generated mail traffic but I didn't succeed=20
making it as the mta level.

I did :
iptables =E2=88=92A OUTPUT =E2=88=92i eth0 =E2=88=92t mangle =E2=88=92p t=
cp =E2=88=92=E2=88=92dport 25 =E2=88=92j MARK =E2=88=92=E2=88=92set=E2=88=
=92mark 1
echo 201 mail.out >> /etc/iproute2/rt_tables
ip rule add fwmark 1 table mail.out
ip route add default via [Second's ISP Gateway] dev ppp1 table mail.out

In order to make packets go out with correct source ip address :
iptables -t nat --append POSTROUTING -p tcp --dport 25 --jump SNAT=20
--to-source [Second's ISP external IP]

The current situation :
I can see with tcpdump packets going out, and back but if I do telnet=20
someisp.com 25 I see nothing in the terminal.

I really don't know what can be wrong and found no answer neither in the=20
mailing list archive, in the lartc howto or in the advanced routing howto=
.

Here is the tcpdump log when doing telnet 213.41.143.209 25 :

13:12:36.296170 81.48.224.208.51061 > 213.41.143.209.smtp: S=20
3495988204:3495988204(0) win 5808 <mss 1452,sackOK,timestamp 7706419=20
0,nop,wscale 0> (DF) [tos 0x10]
13:12:36.437196 213.41.143.209.smtp > 81.48.224.208.51061: S=20
687160518:687160518(0) ack 3495988205 win 16800 <mss=20
1412,nop,nop,sackOK,nop,wscale 0,nop,nop,timestamp 536203422 7706419> (DF=
)
13:12:38.703028 213.41.143.209.smtp > 81.48.224.208.51060: S=20
1256669228:1256669228(0) ack 3496982511 win 16800 <mss=20
1412,nop,nop,sackOK,nop,wscale 0,nop,nop,timestamp 536203426 7706045> (DF=
)
13:12:39.292786 81.48.224.208.51061 > 213.41.143.209.smtp: S=20
3495988204:3495988204(0) win 5808 <mss 1452,sackOK,timestamp 7706719=20
0,nop,wscale 0> (DF) [tos 0x10]
13:12:39.428299 213.41.143.209.smtp > 81.48.224.208.51061: S=20
687160518:687160518(0) ack 3495988205 win 16800 <mss=20
1412,nop,nop,sackOK,nop,wscale 0,nop,nop,timestamp 536203428 7706719> (DF=
)
13:12:40.398787 213.41.143.209.smtp > 81.48.224.208.51059: S=20
957484233:957484233(0) ack 3482227097 win 16800 <mss=20
1412,nop,nop,sackOK,nop,wscale 0,nop,nop,timestamp 536203430 7705616> (DF=
)

Thanks for your help !

Julien


