From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Get source IP of packet through PREROUTING CHAIN
Date: Tue, 11 Aug 2009 14:36:11 +0200
Message-ID: <4A8165BB.7060702@freemail.hu>
References: <21df6cb70908102139i1f0f21besc94740ed507615da@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <21df6cb70908102139i1f0f21besc94740ed507615da@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Elison Niven <elison.niven@gmail.com>
Cc: netfilter@vger.kernel.org, elison.niven@matrixtelesol.com

Hi Elison,

The conntrack subsystem knows about every connection.
So maybe you need to check that.

Elison Niven =EDrta:
> Hi List,
>
> I have two interfaces eth0 and eth1 on my machine.
>
> My machine has eth0 =3D 192.168.1.100 and eth1 =3D 172.16.1.100
>
> The scenario is that I will be receiving packets at port 10000 on eth=
0
> of my machine. I do not know from which IP the packets are being
> received (Can be any machine - I do not need to apply a source addres=
s
> matching rule).
>  =20
You may not know the source IP, but your machine will, because it sees=20
the packets coming from eth0's network.
> I need to forward these packets to another machine B that I do so wit=
h
> this rule:
>
> iptables -t nat -I PREROUTING -i eth0 -p udp \
>        --dport 10000 -j DNAT --to-destination 172.16.1.200
>
> Note that I have not added any -s option to the rule for source
> address matching.
>
> This also works properly. Now I need to _know_ the source IP and
> source Port of the packets that are being received at port 10000 on
> eth0. (For example to send some data back to the _same_machine_ that
> is sending packets at port 10000)
>  =20
Again. If the conntrack (in your machine) knows the source IP/port=20
numbers then it will automagically replace them on the backroute.
It may be also a problem if your response packets are not SNAT-ed. (In=20
the case the sender machines sending the packets directly to your machi=
ne.)
> How do I achieve this?
>
> Best Regards,
> Elison
>  =20
Swifty
