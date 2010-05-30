From: Curby <curby@cur.by>
Subject: Re: Advanced Logging
Date: Sun, 30 May 2010 09:22:16 -0700
Message-ID: <AANLkTinj0IN4bRz73LMn-AFWVnjozhBlg9e17G7-EXWp@mail.gmail.com>
References: <AANLkTimgYvZZ80VgAU4kpLyqKwOMo6u81QCDhX_lD72p@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimgYvZZ80VgAU4kpLyqKwOMo6u81QCDhX_lD72p@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Sun, May 30, 2010 at 7:28 AM, ratheesh k <ratheesh.ksz@gmail.com> wr=
ote:
> any application which will analyze logs and =A0give a brief informati=
on
> to user about the attacks =A0?

I've also been wondering about the existence of such tools, but I
haven't done any research yet.  In particular I'm hoping to explore
parallel coordinate plots, which can be used to map out source and
dest IPs and ports and show traffic patterns.  You could see one IP
port-scanning different dest ports, or many different IPs SYN flooding
a particular dest host.

http://en.wikipedia.org/wiki/Parallel_coordinates

As a generalization of Ratheesh's question, does anyone have
recommendations or personal favorites for iptables log visualizations
for an at-a-glance overview of traffic patterns?

Thanks!

--Mike
