From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ip6tables command aborts with user defined chain
Date: Wed, 18 Jan 2012 21:57:25 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201182154140.19886@frira.zrqbmnf.qr>
References: <CA+f1OFpUv+MKK=Ai0DEMAqKG0Rqt_OWLtLjMZpynOwcXdnGrvQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+f1OFpUv+MKK=Ai0DEMAqKG0Rqt_OWLtLjMZpynOwcXdnGrvQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adishesh M <adisheshsm@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2012-01-18 19:16, Adishesh M wrote:

>Hi,
>
>Below sequence of commands will give ip6tables command abort
>
>it is bug in the ip6table command or i am providing wrong input?
>
>
>/sbin/ip6tables  -N SERVER_fdb1_b54a_b4d8_2171_a0_
>/sbin/ip6tables  -A INPUT -d fdb1:b54a:b4d8:2171:a0:a533:4268:d1d0 -j
>SERVER_fdb1_b54a_b4d8_2171_a0_

There were a handful of issues relating to exceeding the maximum chain 
name length that, as far as they are known, have already
been resolved since iptables-1.4.10.

>00bb2000-00bb9000 r-xp 00000000 fd:00 916669     /lib/libxtables.so.4.0.0
