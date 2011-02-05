From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: How can I test my tc script?
Date: Sat, 5 Feb 2011 15:58:29 +0100
Message-ID: <20110205155829.3a5ebc7b@catus>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	<20110203120131.38cd818d@catus>
	<4D4C0B8F.10005@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D4C0B8F.10005@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Cc: wilson@optimumwireless.com, netfilter@vger.kernel.org

> Hi,

Hi

>I, are you sure about the big difference?
>I agree with you about tc u32 filters are better than iptables +
>marking, but like now I have about 100mbit 1k+ users with
>mangle+classify and tc+htb+egress and I have a load at about 0.2.
>My cpu are xeon 2.6 quad.

Do you have individual iptables rule doing marking for each user (1k+
rules in mangle)?

Best regards,
Marek Kierdelewicz
