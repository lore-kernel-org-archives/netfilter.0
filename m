From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables  + ROUTE
Date: Thu, 09 Nov 2006 11:11:33 +0100
Message-ID: <4552FED5.8070701@plouf.fr.eu.org>
References: <20061109054042.267180@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061109054042.267180@gmx.net>
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

Mato Vidovic a =E9crit :
>=20
> I have a need to perform TOS based traffic routing.=20
> That means I have two interfaces (say eth0 and eth1) to backbone
> and I need to route the real-time critical=20
> IP traffic over eth1 and the remaining IP traffic over eth0.=20
> After a lot of experimenting I came to the conclusion that something
> like the following would do:=20
>=20
> # iptables -t mangle -A POSTROUTING -m tos --tos  16 -j ROUTE --oif eth=
1=20
> # iptables -t mangle -A POSTROUTING -m tos --tos !16 -j ROUTE --oif eth=
0=20

Why not just use the TOS selection feature in advanced routing=20
(involving routing rules and alternate routing tables) ?
Something like :

ip rule add tos 16 lookup tos16 priority 100
ip route add default dev eth1 table tos16

> Unfortunately the Linux box says:=20
> "No chain/target/match by that name"=20
>
> The kernel I use is 2.6.18, iptables version is the last debian
> stable version 1.2.11.=20
>=20
> Any idea what is wrong here (am I missing something in the
> configuration, or a library, or am I completely wrong maybe...)?

As Edvin Seferovic wrote, the kernel part of the ROUTE target is not=20
included in the mainstream kernel yet. You can add it to your kernel=20
source tree with the patch-o-matic-ng a build a ROUTE-capable kernel.

