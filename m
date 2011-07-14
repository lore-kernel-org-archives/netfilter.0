From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: netflow
Date: Thu, 14 Jul 2011 17:04:22 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107141703350.6827@frira.zrqbmnf.qr>
References: <CAMTjHrwextXkBdz_g3zS6CB6j+Xmr4nfvLs3==q5eRzMLYvBOw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHrwextXkBdz_g3zS6CB6j+Xmr4nfvLs3==q5eRzMLYvBOw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Usu=C3=A1rio_do_Sistema?= <maiconlp@ig.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Thursday 2011-07-14 16:19, Usu=C3=A1rio do Sistema wrote:

>Hello,
>
>I'm researching about netflow on linux. I wish that an linux machine
>forwards it flows to a colletor netflow inside my network.
>
>my doubt is how to generate this netflow on linux. I've added the
>ipt_netflow-1.6.tgz module and I created some rules as bellow in
>iptables:
>
>iptables -A OUTPUT -j NETFLOW
>iptables -A OUTPUT -j NETFLOW
>
>I'm forwarding the flows to my netflow collector with modprobe
>ipt_NETFLOW destination=3D10.10.10.1:2055
>
>so...my question is there is other different way to generate netflows
>on linux machine than add rules in the iptables and add ipt_netflow
>module ??

You could use -j TEE to send the original packets to a dedicated loggin=
g=20
host, and then do netflow (or any other logtype) analysis there.
