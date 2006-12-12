From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Newbie request
Date: Tue, 12 Dec 2006 11:47:45 +0100
Message-ID: <457E88D1.8020100@plouf.fr.eu.org>
References: <457E5B99.7050005@gmail.com>
	<1153.193.173.119.247.1165912318.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1153.193.173.119.247.1165912318.squirrel@webmail.sterenborg.info>
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

Rob Sterenborg a =E9crit :
> On Tue, December 12, 2006 08:34, Nandan Bhat wrote:
>>
>>I need some machines on 192.168.1.0/24 network to be able to get/send
>>mail using 192.168.0.10 . Mail is limited to these networks and does no=
t go to
>>the outside world.
>>
>>My question is: Do I need a SNAT rule or should I try something with
>>nat+FORWARD?
>=20
> No. You can just route from 192.168.0.0/24 to 192.168.1.0/24 and back w=
ithout
> using NAT.

But then you need that host 192.168.0.10 has a route back to=20
192.168.1.0/24, either directly via eth1 IP address (so it'd better be=20
fixed), or indirectly via the default gateway which must have a route to=20
192.168.1.0/24 via eth1 IP address. Else you must do SNAT or MASQUERADE=20
for 192.168.1.0/24 on eth1 :

iptables -t nat -A POSTROUTING -o eth1 -s 192.168.1.0/24 -j MASQUERADE

> $ipt -A FORWARD -m state --state NEW -s 192.168.0.0/24 \
>   -d 192.168.1.0/24 -m mport -p tcp --dports 25,110 -j ACCEPT
> $ipt -A FORWARD -m state --state NEW -s 192.168.1.0/24 \
>   -d 192.168.0.0/24 -m mport -p tcp --dports 25,110 -j ACCEPT
>=20
> The last 2 rules can also be split into 4 rules if you don't have the m=
port
> module :

Or just use the more standard 'multiport' match instead.

