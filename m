From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: How can I test my tc script?
Date: Sun, 6 Feb 2011 17:44:46 +0100
Message-ID: <20110206174446.6abdcf58@catus>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	<1296761916.7587.29.camel@andybev>
	<1296873898.3644.4.camel@debian-laptop.OptimumWireless>
	<1296886030.4568.6.camel@debian-laptop.OptimumWireless>
	<1296908825.1695.8.camel@andybev>
	<1296958497.3695.18.camel@debian-laptop.OptimumWireless>
	<1297008953.1613.24.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1297008953.1613.24.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: wilson@optimumwireless.com, netfilter@vger.kernel.org

>> I have 120 users now but, that number should be increasing. Which
>> method do you recommend?
>I think that you should forget the per-user stuff as per my other email
>and classify traffic. Just my personal opinion - I'd be interested to
>hear what others think.

Well. It all depends on the bussiness constrains. Per-user shaping is
sometimes necessary while it's definitely more complex and
resource-consuming. My personal opinion - with >100 users shaping rules
should be script-generated instead of written by hand.

Best regards,
Marek Kierdelewicz
