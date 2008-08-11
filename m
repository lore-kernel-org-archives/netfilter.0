From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Target IP monitoring...
Date: Mon, 11 Aug 2008 15:55:44 -0400 (EDT)
Message-ID: <alpine.LNX.1.10.0808111554010.26664@fbirervta.pbzchgretzou.qr>
References: <48A08A37.3050104@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48A08A37.3050104@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Monday 2008-08-11 14:51, Grant Taylor wrote:

> I'm going to be working on a project that will need to monitor what destination
> IPs traffic is sent to.  I was wondering if I could not use the ULOG in side of
> the nat table to do this.  I am really only wanting the target (and possibly
> the source) IP of each connection.  I do not want any of the IP payload or any
> of the packets, just the target IP.
>
> I was hoping to exploit the fact that the nat table only sees the first packet
> in a connection to help reduce the likelihood that I would see the same target
> IP multiple times.

Eww no, don't do that. Though Netfilter is written like that,
there is no hard guarantee that only first packets are seen.
(Like, we forget to take our medication and all packets go
through the then-semi-stateless nat table ;-)
Better use -m conntrack --ctstate NEW -j ULOG.
