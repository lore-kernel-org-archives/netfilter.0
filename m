From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: How can I test my tc script?
Date: Sat, 5 Feb 2011 20:32:25 +0100
Message-ID: <20110205203225.578cb7d1@catus>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	<20110203120131.38cd818d@catus>
	<1296827153.3644.7.camel@debian-laptop.OptimumWireless>
	<1296838192.3644.20.camel@debian-laptop.OptimumWireless>
	<1296849455.3644.25.camel@debian-laptop.OptimumWireless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1296849455.3644.25.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson@optimumwireless.com
Cc: netfilter@vger.kernel.org

>Hi, is me once again.

Hi,

>I tried this for a test box and the download speed worked correctly:
>...

I see you already nailed it ;-).

>So, are these ruleset more convenient than the one I currently have?

Simple u32 won't scale any better then ipt marking + tc fw filter. Real
performance gain is in use of hashing filters.

Best regards,
Marek Kierdelewicz
