From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Sub: nat issue in netfilter
Date: Wed, 25 Jun 2014 16:37:54 +0200
Message-ID: <53AADEC2.70701@plouf.fr.eu.org>
References: <CAJQ3KZWTUWAZ4VHq-tt86FY=cZnC1qhUBn5AqccaqQaE98BVhw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJQ3KZWTUWAZ4VHq-tt86FY=cZnC1qhUBn5AqccaqQaE98BVhw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Kamal Kumar <malkarikamalkumar@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Kamal Kumar a =E9crit :
>                      I have an issue regarding nat in netfilter. When
> I configure the following rule "iptables -t nat -A POSTROUTING -s
> 0.0.0.0/0 -d 0.0.0.0/0  -i eth0 -o eth1 -j SNAT --to A.B.C.D"

This command will fail with an error. The -i option is invalid in the
POSTROUTING chain.

> and run
> some ip traffic from eth0 to eth1 found packets from eth1 with
> translated source ip A.B.C.D, its fine but when I flush the nat
> entries with traffic running from eth0 to eth1, I found packets on
> eth1 with translated source ip A.B.C.D . Is this a problem if it is

It is the expected default behaviour. The traffic creates new entries i=
n
the conntrack table.

> then how to overcome it (when I flush the entries I should not see
> packets from eth1 with translated source ip ).

What exact behaviour do you want ? No translation or no packets ?
=46or what kind of traffic (TCP, UDP...) ?
May I ask what is your goal by doing this ?
