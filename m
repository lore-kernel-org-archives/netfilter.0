From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [ANNOUNCE] Xtables-addons 1.13 released
Date: Tue, 24 Mar 2009 08:32:55 +0100 (CET)
Message-ID: <alpine.LSU.2.00.0903240829590.19903@fbirervta.pbzchgretzou.qr>
References: <alpine.LSU.2.00.0903231816540.25130@fbirervta.pbzchgretzou.qr>  <20090323134327.35e9a8dc@liberty.rlwhome.lan> <412e6f7f0903232227rd1fe891xaf90b0bc1bc67748@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <412e6f7f0903232227rd1fe891xaf90b0bc1bc67748@mail.gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Changli Gao <xiaosuo@gmail.com>
Cc: Robby Workman <rw@rlworkman.net>, netfilter@vger.kernel.org, Netfilter Developer Mailing List <netfilter-devel@vger.kernel.org>


On Tuesday 2009-03-24 06:27, Changli Gao wrote:

>When reviewing the code, I found there maybe a bug in libxt_fuzzy.c.
>If an user want to delete this match module, he will got an error
>reporting, and faile. As the fileds after maximum_rate in
>xt_fuzzy_mtinfo will be altered in kernel space, we should assign the
>userspacesize with the value offsetof(struct xt_fuzzy_mtinfo,
>packets_total) instead.

Thanks for the report. This has now been fixed.

