From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Newby problem with conntrack-tools installation
Date: Mon, 3 Jan 2011 15:30:44 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101031526490.21589@obet.zrqbmnf.qr>
References: <AANLkTi=u+wD3C3U3DDa2L5b23_jH_kpF_t1WDwdwyM+0@mail.gmail.com> <AANLkTi=kyDH2G7YiwDFdb6VQ4StSBVOZfeU19ZUUb3Kt@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=kyDH2G7YiwDFdb6VQ4StSBVOZfeU19ZUUb3Kt@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Jonathan Petersson <jpetersson@garnser.se>
Cc: Peter Kraus <juleswinnfieldpf@googlemail.com>, netfilter@vger.kernel.org

On Monday 2011-01-03 14:30, Jonathan Petersson wrote:

>Have you started the conntrackd-daemon?

That's not the point.

>On Mon, Jan 3, 2011 at 1:33 PM, Peter Kraus
><juleswinnfieldpf@googlemail.com> wrote:
>> Hi,
>>
>> I have ubuntu, kernel 2.6.35, "apt-get install conntrack" and lsmod =
shows:
>>
>> cedrix@tussi:~/test_1$ lsmod =C2=A0|grep net
>> nfnetlink =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3691 =C2=A0=
0
>> cedrix@tussi:~/test_1$ lsmod =C2=A0|grep conn
>> nf_conntrack_ipv4 =C2=A0 =C2=A0 =C2=A010783 =C2=A03 iptable_nat,nf_n=
at
>> nf_conntrack =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 63258 =C2=A04
>> ipt_MASQUERADE,iptable_nat,nf_nat,nf_conntrack_ipv4
>> nf_defrag_ipv4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01117 =C2=A01 nf_con=
ntrack_ipv4
>>
>> When I run: "sudo conntrack -E" and I do a "telnet <myserver> 80" (t=
o
>> generate traffic) it should show the generated events, but it does
>> not.

nf_conntrack_netlink needs to be loaded; for some reason that
is not automatically done with the -E parameter (but -L does).

