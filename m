From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: How can I test my tc script?
Date: Mon, 07 Feb 2011 09:20:11 +0100
Message-ID: <4D4FAB3B.2020801@unipex.it>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>	<20110203120131.38cd818d@catus>	<4D4C0B8F.10005@unipex.it> <20110205155829.3a5ebc7b@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110205155829.3a5ebc7b@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: wilson@optimumwireless.com, netfilter@vger.kernel.org

Marek Kierdelewicz wrote:
>> Hi,
>
> Hi
>
>> I, are you sure about the big difference? I agree with you about tc
>> u32 filters are better than iptables + marking, but like now I have
>> about 100mbit 1k+ users with mangle+classify and tc+htb+egress and
>> I have a load at about 0.2. My cpu are xeon 2.6 quad.
>
> Do you have individual iptables rule doing marking for each user
> (1k+ rules in mangle)?
>

Yes. One rule for mark and one for return. One for classify and one for
return. The first ones inside prerouting and the latter in forward.

srv:~# iptables -nvL -t mangle|wc -l
7193

Like now, I have load: 0.04  ;)

> Best regards, Marek Kierdelewicz

Ciao,
Michele
