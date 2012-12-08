From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Mark traffic on one machine, match on another machine?
Date: Sat, 8 Dec 2012 21:58:21 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1212082146170.18194@nerf07.vanv.qr>
References: <50B59C76.5050706@nottheoilrig.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50B59C76.5050706@nottheoilrig.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Bates <uo4zau@nottheoilrig.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2012-11-28 06:09, Jack Bates wrote:

> Is there a way to mark traffic on one machine (proxy server) and match the mark
> on another machine (router)?

The Flowlabel field in IPv6 would lend itself to that..

