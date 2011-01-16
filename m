From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables --string-replace
Date: Mon, 17 Jan 2011 00:51:15 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101170048550.23304@obet.zrqbmnf.qr>
References: <AANLkTinzEVbR7L8PU_qhJj4MVXKsAOTKxQfA15ZHUWGT@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTinzEVbR7L8PU_qhJj4MVXKsAOTKxQfA15ZHUWGT@mail.gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben K <benkloester@gmail.com>
Cc: netfilter@vger.kernel.org, Netfilter Developer Mailing List <netfilter-devel@vger.kernel.org>

[fullquote due to added cc]
On Sunday 2011-01-16 23:43, Ben K wrote:

>I'd like to be able to mangle strings passing through my home router
>running Openwrt in order to modify/anonymize user-agent strings. I
>believe a patch further extending the iptables string extension by
>providing string replace functionality was submitted by Michael Rash
>back in 2004 (archived at
>http://www.spinics.net/lists/netfilter/msg23791.html). This would be
>ideal as I could then mangle user-agent headers without eg needing to
>run an http proxy.

That is not trivially possible because the UA identifier may be split 
across multiple packets, which does not exactly facilitate its 
replacement.
The only sensible choice is to use some userspace tools, and proxies 
usually do that job well.


>Does anyone know if the --string-replace functionality ever made it
>into iptables? If not, what are my chances of the patch from 2004
>playing nice with the current Git head revision?
>
>Thanks very much,
>Ben
>
>(BTW what's with the mailing list rejecting HTML emails?! Are we
>living in 2001?)

We are developers, not salesmen.
