From: Jonathan Petersson <jpetersson@garnser.se>
Subject: Re: Newby problem with conntrack-tools installation
Date: Mon, 3 Jan 2011 14:30:54 +0100
Message-ID: <AANLkTi=kyDH2G7YiwDFdb6VQ4StSBVOZfeU19ZUUb3Kt@mail.gmail.com>
References: <AANLkTi=u+wD3C3U3DDa2L5b23_jH_kpF_t1WDwdwyM+0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=u+wD3C3U3DDa2L5b23_jH_kpF_t1WDwdwyM+0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Peter Kraus <juleswinnfieldpf@googlemail.com>
Cc: netfilter@vger.kernel.org

Have you started the conntrackd-daemon?

On Mon, Jan 3, 2011 at 1:33 PM, Peter Kraus
<juleswinnfieldpf@googlemail.com> wrote:
> Hi,
>
> I have ubuntu, kernel 2.6.35, "apt-get install conntrack" and lsmod s=
hows:
>
> cedrix@tussi:~/test_1$ lsmod =A0|grep net
> nfnetlink =A0 =A0 =A0 =A0 =A0 =A0 =A0 3691 =A00
> cedrix@tussi:~/test_1$ lsmod =A0|grep conn
> nf_conntrack_ipv4 =A0 =A0 =A010783 =A03 iptable_nat,nf_nat
> nf_conntrack =A0 =A0 =A0 =A0 =A0 63258 =A04
> ipt_MASQUERADE,iptable_nat,nf_nat,nf_conntrack_ipv4
> nf_defrag_ipv4 =A0 =A0 =A0 =A0 =A01117 =A01 nf_conntrack_ipv4
>
> When I run: "sudo conntrack -E" and I do a "telnet <myserver> 80" (to
> generate traffic) it should show the generated events, but it does
> not.
>
> Question: Is there any netfilter-lib missing or what do I wrong?
>
> Thanks for any help!
>
> Jules
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
