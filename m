From: "Daniel Nogradi" <nogradi@gmail.com>
Subject: Re: updated iptables doesn't work with old rules
Date: Wed, 22 Feb 2006 14:39:42 +0100
Message-ID: <5f56302b0602220539t2ec885acwda00f0f2eb521854@mail.gmail.com>
References: <5f56302b0602220158k76b68705p88dd35b4c2782caa@mail.gmail.com>
	<54666.193.173.147.3.1140606085.squirrel@webmail.sterenborg.info>
	<5f56302b0602220325p1c66f156y47e8ad569ee7fffb@mail.gmail.com>
	<56310.193.173.147.3.1140611713.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <56310.193.173.147.3.1140611713.squirrel@webmail.sterenborg.info>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> And both NIC's have a /24 subnet ? If so, you should change that, eg. eth=
0:
> 192.168.10.0/24 and eth1: 192.168.11.0/24 (in which case machine B should
> also
> be in 192.168.11.0/24).
> Right now I think you (may) have a routing problem.
>
> Something like :
>
> Kernel IP routing table
> Destination     Gateway         Genmask         Iface
> 192.168.10.0    192.168.10.1    255.255.255.0   eth0
> 192.168.11.0    192.168.11.1    255.255.255.0   eth1
> 0.0.0.0         192.168.10.1    0.0.0.0         eth0
>
> echo 0 > /proc/sys/net/ipv4/ip_forward
> $ipt -P FORWARD DROP
> $ipt -F FORWARD
> $ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> $ipt -A FORWARD -m state --state NEW -i eth1 -o eth0 \
>   -s 192.168.11.0/24 -j ACCEPT
> $ipt -t nat -F POSTROUTING
> $ipt -t nat -A POSTROUTING -o eth0 -j SNAT --to 192.168.10.101
> echo 1 > /proc/sys/net/ipv4/ip_forward


Thanks a lot, I'll try this in the evening.




On 2/22/06, Ben Lentz <BLentz@channing-bete.com> wrote:
> To answer this question, can you get on the Internet from
> machine A? ping sourceforge.net?
>

Yes, from 'machine A' it is possible to connect to the internet. And
it is possible to ssh from 'machine B' to 'machine A' and then access
the internet. The only problem is (I think) with packet
forwarding/masquareding, since 'macine A' doesn't want to let the
packets from 'machine B' through.

