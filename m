From: Olivier GRALL <olivier.grall@neotip.com>
Subject: Re: DNAT/SNAT doubt
Date: Wed, 07 Dec 2005 10:13:26 +0100
Message-ID: <4396A7B6.6040003@neotip.com>
References: <20051104181551.GA27330@casa.e-den.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051104181551.GA27330@casa.e-den.it>
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
To: Sandro Dentella <sandro@e-den.it>
Cc: iptables <netfilter@lists.netfilter.org>

Hi,

Don't you forget to allow ip_forward on your Linux box ?

echo 1 > /proc/sys/net/ipv4/ip_forward
or in /etc/sysctl.conf

Regards,

Olivier GRALL

Sandro Dentella a =E9crit :

>Hi all,
>
>  a nameserver managed by one of my customers died unexpectedly, they as=
ked
>  me to redirect all traffic to another DNS in a totally different
>  network. Should it work? (it didn't in my case...)
>
>Chain PREROUTING (policy ACCEPT 656 packets, 33024 bytes)
> pkts bytes target     prot opt in     out     source               dest=
ination
> 1410 93104 DNAT       udp  --  *      *       0.0.0.0/0            0.0.=
0.0/0          udp dpt:53 to:XXX
>
>Chain POSTROUTING (policy ACCEPT 628 packets, 31631 bytes)
> pkts bytes target     prot opt in     out     source               dest=
ination
>    0     0 SNAT       udp  --  *      *       0.0.0.0/0            XXX =
   udp dpt:53 to:YYY
>
>  you can see that no packets entered the POSTROUTING chain even thought=
 in
>  my opinion all packets ther entered the PREROUTING rule should enter t=
he
>  POSTROUTING one. Am I wrong?
>
>  TYA
>  sandro
>  *:-)
>
>
> =20
>


