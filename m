From: "Zhen Zhou" <zhouzhenzj@gmail.com>
Subject: Re: is it possible to nat to the routed IP?
Date: Sun, 17 Dec 2006 18:08:12 +0800
Message-ID: <ad41208c0612170208h70c43da2ldb684d1ccbf76767@mail.gmail.com>
References: <000f01c720e8$f75b5d50$0202fea9@tanjian>
	<4583D232.1040402@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4583D232.1040402@plouf.fr.eu.org>
Content-Disposition: inline
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

On 12/16/06, Pascal Hambourg <pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> Rob Sterenborg a =E9crit :
> >>>
> >>>$ipt -t nat -A PREROUTING -d 210.153.22.y -p tcp --dport 80 \   -j
> >>>DNAT --to 192.168.2.208
> >
> >Zhen Zhou wrote:
> >>
> >>Now another issue is pop up:
> >>
> >>210.153.22.x is Internet gateway IP, 210.153.22.y is a public ip for
> >>publish 192.168.3.208. ofcs, from Internet traffic to 192.168.3.208,
> >>is go through 210.153.22.y. But in the another hand all the traffic
> >>from 192.168.3.208 to outside, it will go to 210.153.22.x, could it
> >>be a possible go via 210.153.22.y under some protocols? How to
> >>configure?
>
> Insert this kind of rule before the generic SNAT rule :
>
> $ipt -t nat -A POSTROUTING -o <interface> -s 192.168.2.208 -p <proto> \
>    [--dport <port>] -j SNAT --to 210.153.22.y
>
> [...]
> > A http connection is made to the server at destination port 80/tcp.
> > [...] So, return packets are coming from source port 80/tcp.
> > I think this is what you want:
> >
> > $ipt -t nat -A POSTROUTING -s 192.168.2.208 -p tcp --sport 80 \
> >   -j SNAT 210.153.22.y
>
> This rule is useless to handle HTTP return packets. Return packets are
> in the ESTABLISHED state and don't traverse the 'nat' chains.
>
> > Packets from 192.168.2.208:80 are SNAT-ed to 210.153.22.y
>
> Yes, but not because of this SNAT rule but because of the DNAT rule
> above and because stateful DNAT does implicit SNAT on return packets.
>

Thanks for your help, but the issue is still there, so I post what I
add iptables rules in the system then we could analyze where is the
issue:

iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state NEW -d 192.168.3.208 -p tcp
--dport 80 -j ACCEPT
iptables -t nat -A PREROUTING -d 210.153.22.y -p tcp --dport 80 -j
DNAT --to 192.168.3.208
iptables -t nat -A POSTROUTING -o 210.153.22.y -s 192.168.3.208 -p tcp
--sport 80 -j SNAT --to 210.153.22.y

I assign:
ip addr add 210.153.22.y dev eth1 label eth1:1

in the another hand, I want to track the network link when I access
web to some sites, nothing show me via:
netstat -ant | grep 192.168.3.208
nothing .....

Maybe eth1:1 couldn't show on this way? is it?

Maybe that is the issue, but I couldn't find any idea how to deal, any tips=
, TIA

Zhou

