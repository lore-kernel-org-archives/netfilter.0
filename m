From: "C. L. Martinez" <carlopmart@gmail.com>
Subject: Re: Problems with a forward rule
Date: Mon, 14 May 2012 09:06:20 +0200
Message-ID: <CAEjQA5+kYHgcm3FGkz_AEhTa6ASv8w5sWQQxAOkszeDM3=ukZQ@mail.gmail.com>
References: <CAEjQA5JVsMUizFWODGe+OT88owqbPU0=ZjtRugq6Eg8z1U3A=w@mail.gmail.com>
	<alpine.LNX.2.01.1205121746300.5922@frira.vanv.qr>
	<4FAECDBA.9030302@saasplaza.com>
	<CAEjQA5LAwmxTwAGWJH5A5Bs57h8=BSXWwiWegYmVKSM7ZtvtmA@mail.gmail.com>
	<4FB0A732.4070909@saasplaza.com>
	<CAEjQA5JZ55ku3DZuQ_Oe+Ne-85Lr_zMse7VudYAryO5aH8-JLQ@mail.gmail.com>
	<4FB0AE39.6040805@saasplaza.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=XjCk31Eu9Jhr7cpkHvULsVKsb0izv6wRptYR++5AfRc=;
        b=jTWKRsWN6lJ5miA5klnyoRMRJ6TlFEPfTeYHMk5UH0Kd40h6XVTS9wBuevVtODTjyf
         zOsdp+ImSUHi1g4YZJ3Tz8wyjTTlu+oVBeoZuqSQ79AfuGLdcPo8O2OZJdQXY528MNFo
         Tgne2gIP7zToInDeduwK9+DlsLc00cRi7oEuwfTs6VeoNbt68FGUy2biPjgn3CBhtr7E
         Eots7Tw9CZZboeX3fWzacDinIG51jzDRT7JXbklF177/nz9EbZZt+jABo46xuzG+QXV8
         Vn11+4/C1qTNj9A92v82TzHTdvDyRdRhOU3WD8sRDKxLpQ2tzXkcWE9JumDyIXmxRNsu
         Vn+w==
In-Reply-To: <4FB0AE39.6040805@saasplaza.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom van Leeuwen <tom.van.leeuwen@saasplaza.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Mon, May 14, 2012 at 9:03 AM, Tom van Leeuwen
<tom.van.leeuwen@saasplaza.com> wrote:
> So, when you do a ping from your host 172.24.50.3 to 1.1.1.x you will
> probably see the counter increase for your rule (with restricted
> destination).
> Do "iptables -vnL FORWARD" to check.
>
> That rule is not the problem.
>
> What traffic are you sending that times out?
> source ip, source port, destination ip, dest port, protocol?
>
> Your forward and postrouting rules look fine and should work
>
> Regards,
> Tom

My principal problems are with http, https and ssh. For example with a
https connection:

Chain FORWARD (policy DROP 48 packets, 2432 bytes)
 pkts bytes target     prot opt in     out     source
destination
 4628 1901K ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0           state RELATED,ESTABLISHED
   12   746 ACCEPT     all  --  *      *       172.24.50.3
10.196.0.0/16       state NEW
   42  2184 ACCEPT     tcp  --  *      *       172.24.50.3
195.76.69.66        tcp multiport dports 80,443 state NEW
    1    52 ACCEPT     tcp  --  *      *       172.24.50.3
195.76.69.69        tcp dpt:443 state NEW
   48  2432 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0           LOG flags 0 level 4 prefix `IPT FORWARD packet
died: '

First packets goes well, but after few seconds all goes to "IPT
FORWARD .." chain ...
