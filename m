From: Adel Belhouane <bugs.a.b@free.fr>
Subject: Re: Is it possible to access ip fragments with libnetfilter_queue?
Date: Tue, 28 Apr 2015 21:04:37 +0200
Message-ID: <553FD9C5.8030805@free.fr>
References: <CAEVBFLi1CZaKyXNMROtmyYScNOo9wYnQOCQrBbDqsxieAGce9g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAEVBFLi1CZaKyXNMROtmyYScNOo9wYnQOCQrBbDqsxieAGce9g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Michael Fomichev <fomichev.michael@gmail.com>, netfilter@vger.kernel.org

Le 28/04/2015 09:39, Michael Fomichev a =C3=A9crit :
> Hello,
>
> I am using libnetfilter_queue in C to capture packets. I am setting a=
n
> iptable rule to queue the incoming packets that would later be
> processed by the userspace implementation like this: iptables -A INPU=
T
> -j NFQUEUE --queue-num 0. I used nfqnl_test.c example as a framework
> to implement the capture. Everything works as expected. However, I
> noticed that it is impossible to inspect the queue on the level of ip
> fragments. That is, if a packet is coming in fragments it is first
> reassembled before being put into the queue. But I would like to work
> with fragments. So is there a way to enforce that kind of behavior?
> What I want to have is a queue where I could observe raw incoming
> packets (both fragmented and unfragmented) so I would be able to act
> on them accordingly.

[...]

 > "fragmentation granularity" which I am looking for. I also tried
 > adjusting iptable rules (e.g. iptables -t raw -D PREROUTING -i eth0 =
-j
 > NFQUEUE --queue-num 0), but the result is still the same. I can only

Defragmentation has the lowest priority in include/uapi/linux/netfilter=
_ipv4.h:
NF_IP_PRI_CONNTRACK_DEFRAG =3D -400
This is even before the RAW priority (-300), so iptables can't work bef=
ore=20
defragmentation, unless of course nf_defrag_ipv4 isn't loaded, that is =
you=20
don't use connection tracking at all, which I'd doubt.

Try with nft/nftables, because you can choose the hook priority with nf=
t. The=20
nft rules shouldn't interfere with iptables rules, both can be loaded a=
nd be=20
working together. I chose priority -450 because -450 < -400 , so it wil=
l run=20
before nf_defrag_ipv4 and I called it predefrag.

# nft -i
nft> add table filter
nft> add chain filter predefrag { type filter hook prerouting priority =
-450; }
nft> add filter predefrag meta iif eth0 counter queue num 0 bypass

When I run nfqnl_test, if I switch from ping -s 1472 to ping -s 1473 (e=
thernet=20
size from 1500 to 1501) from an other box, I go from 1 packet with=20
payload_len=3D1500 to two packets (payload_len 1500 and 21).
With priority -300 I get only one packet with payload_len 1501. Appears=
 to be=20
working!

Normally (in all the examples...) the priority should be -300. I don't =
know if=20
there's any side effect when using -450.

Relevant documentation:
http://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains
http://wiki.nftables.org/wiki-nftables/index.php/Queueing_to_userspace

>
> Any help is really appreciated
>
> Best regards,
>
> Michael

Best regards,
Adel

