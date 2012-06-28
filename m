From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: AW: general question about DNAT-rule
Date: Thu, 28 Jun 2012 20:42:20 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1206282041310.19167@frira.zrqbmnf.qr>
References: <515168F006F2D643952F8FFD24F2E073015AD663A6@sonne2.gw.bringe.net> <zarafa.4fec9938.2a62.2ad8418a26a48827@zarafa.cubewerk.int>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <zarafa.4fec9938.2a62.2ad8418a26a48827@zarafa.cubewerk.int>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Bauer <stefan.bauer@cubewerk.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thursday 2012-06-28 19:49, Stefan Bauer wrote:

>A DNAT and SNAT-rule is required on a device to forward packages to
>another device because answer packages will not flow through the
>first device as it is not in the middle like a router?

NAT is all about address rewriting (and the adverse affects that come
with it). Forwarding is independent of that and is controlled
by `ip route`.

