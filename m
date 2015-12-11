From: Satish Patel <satish.txt@gmail.com>
Subject: Re: block ip fragmented packet
Date: Fri, 11 Dec 2015 13:40:40 -0500
Message-ID: <CAPgF-foi4cgaM6UU9FGp=eV42cLQ0khzV45sE9+n4m8mtuyROw@mail.gmail.com>
References: <CAPgF-frhssFMAxB0M=qA1Y1jCxjScO7+3JE7=i9FaXu37HCLOw@mail.gmail.com>
	<CAEzD07+oCs_W6P760okms=g38HEM_YuGNFx_-YodYDX328D6qA@mail.gmail.com>
	<566A85EE.4030502@plouf.fr.eu.org>
	<ADD0C2D1-9082-4F33-AFBE-637A3778B5B8@gmail.com>
	<20151211172208.GA1580@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=23RrXohZ46/TpnqKROr3DMiE9zPoCLl1EZHSOFApH4w=;
        b=TMrdgVwTFjAX9pLPZDEAOOOgrXIYiJSiEIuM8ZQXYuipXWZJr5m57RXXHfyTtJM2hm
         aRi0RlTnWKrjtEqWQTxUIiXoCga2aUlw4PG2YmMhB9snteD3as5Pd3AsvWJkylpEr2Te
         SCVupM4Zxm4GURtOxr6bNxl5cTvXKPMfZYgLVC365BqNJCSJvUnl5v2s4Rmfxe7ltwp2
         lAMBpqfQS7561iJtBYsYbcfgkcny2WeViutzf4Jw915meKi8IGqfkwtCOvmYlkI8vPqf
         TNtK4lE+6l6sofjpGRncvS5qeXjsk520+Jwp9wdP9EBNrgjeXQZRseGaoCnH8RUbsoC9
         bGEw==
In-Reply-To: <20151211172208.GA1580@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Pascal Hambourg <pascal@plouf.fr.eu.org>, Anton Danilov <littlesmilingcloud@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

>> In nftables you can add a chain *before* priority -400 that should see
fragmented packets.

what is nftables?  How do i set priority? could you please explain?

On Fri, Dec 11, 2015 at 12:22 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> On Fri, Dec 11, 2015 at 07:53:12AM -0500, Satish Patel wrote:
>> I'm testing this rule from remote machine and sending fragmented packet using hping3 utility.
>>
>> -f  iptables option is not going to work if conntrack there.
>>
>> I don't know why it's so hard for iptable to block something like this.
>
> You got nf_defrag_ipv4 loaded (it comes with conntrack), therefore,
> fragments are reassembled before entering conntrack, then fragmented
> back from the output path.
>
> In nftables you can add a chain *before* priority -400 that should see
> fragmented packets.
