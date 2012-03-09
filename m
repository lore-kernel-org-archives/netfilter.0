From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: quota display in iptables -L
Date: Fri, 09 Mar 2012 15:07:50 +0100
Message-ID: <4F5A0EB6.9000604@freemail.hu>
References: <CAL2t0L4JR-kPUogudF+vWaypYjQmCPureZE6yM4PjYEVV+XhTg@mail.gmail.com> <CAL2t0L4r5ANvRyM=7Spnx68=wMcQCTR7qDH94V4-TRbXCKA-Gg@mail.gmail.com> <CAL2t0L4AjXx8QR22Q5cdh6ndPpmmrr58x-t6HG7kHZ6UadtOBg@mail.gmail.com> <CAL2t0L5bnu9pX_h01HtvEaurdhDa_QHdc6OeVfy3e4hoKe893g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAL2t0L5bnu9pX_h01HtvEaurdhDa_QHdc6OeVfy3e4hoKe893g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: James Anderson <japanwikidonate@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

31997506400-31997506128=3D272
You are under the quota!

Maybe you had just bigger packets than 272 bytes...


Swifty



2012-03-09 01:19 keltez=E9ssel, James Anderson =EDrta:
> Hello everyone.
>
> I have been trying to get iptables to stop traffic to the internet
> after I have exceeded 29.8 GB and just allow traffic to the local
> subnet after that. I did the conversion on google and apparently
> 29.8GB is 31997506400 bytes. However tonight when I got home and did
> iptables -L -v, I saw this:
>
> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
>   pkts bytes target     prot opt in     out     source
> destination
>     28M    32G   ACCEPT     all  --  any    any     anywhere
> !192.168.2.0/24      quota: 31997506400 bytes
> 2459K 3621M  ACCEPT     all  --  any    any     anywhere
> 192.168.2.0/24
>    5770 1151K   REJECT     all  --  any    any     anywhere
> anywhere            reject-with icmp-port-unreachable
>
> At first I thought the quota didn't work, but then I did iptables-sav=
e -c
>
> *filter
> :INPUT ACCEPT [23078834:14787771556]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> [28216466:31997506128] -A OUTPUT ! -d 192.168.2.0/24 -m quota --quota
> 31997506400 -j ACCEPT
> [2475569:3622559686] -A OUTPUT -d 192.168.2.0/24 -j ACCEPT
> [24154:2350411] -A OUTPUT -j REJECT --reject-with icmp-port-unreachab=
le
> COMMIT
>
> which shows that it stopped at 29.7999998 GB.
> Could someone perhaps explain the discrepancy?
> Does iptables keep counting bytes even after the quota is full?
>
> many thanks in advance,
>
> James
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
