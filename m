From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Martians question
Date: Fri, 22 Sep 2006 16:59:02 +0200
Message-ID: <4513FA36.2060600@plouf.fr.eu.org>
References: <45132DDE.6090101@rhyme.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45132DDE.6090101@rhyme.com.au>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Philip Warner a =E9crit :
> I've seen a lot about martian sources being from a 'wrong' subnet, and
> in that context can not see why I am getting lots of martian messages i=
n
> my logs:

Martian source detection is not related to Netfilter/iptables.

> Sep 21 22:29:49 ares kernel: martian source 203.8.195.10 from 203.8.195=
.20, on dev eth1
> Sep 21 22:29:49 ares kernel: ll header: ff:ff:ff:ff:ff:ff:00:50:ba:39:1=
0:22:08:06

If I'm not mistaken, this packet looks like a broadcast ARP query from=20
IP 203.8.195.20 and MAC 00:50:ba:39:10:22 aimed at 203.8.195.10. Hence,=20
for some reason, the packet came back to the interface from which it was=20
sent.

Just an idea : did you check that both ends of the ethernet wire have=20
the same duplex setting ?

> where eth1 is configured as:
>=20
> eth1      Link encap:Ethernet  HWaddr 00:50:BA:39:10:22
>           inet addr:203.8.195.20  Bcast:203.8.195.255  Mask:255.255.255=
.0
>           inet6 addr: fe80::250:baff:fe39:1022/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           collisions:0 txqueuelen:1000

So it seems that your "martian" packet was sent by your box itself.

[...]
> eth2      Link encap:Ethernet  HWaddr 00:01:80:5C:8B:35
>           inet addr:203.8.195.121  Bcast:203.8.195.121  Mask:255.255.25=
5.255
>=20
> (this interface should really be dropped,

Yes it should, because its IP setup is broken : local and broadcast=20
addresses are identical. That's what happens with ifconfig which does=20
not behave well with /31 and /32 masks.

> and when I drop eth2, I still get martians...so I assume it's not relev=
ant.

If eth2 is not connected to the same ethernet network as eth1, I agree.

