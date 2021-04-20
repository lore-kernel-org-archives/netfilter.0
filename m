From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables port forward on DHCP interface to static IP
Date: Mon, 19 Apr 2021 21:21:09 -0400
Message-ID: <dec7a0eb-b09b-3605-ab21-2bfc435c2859@fhmtech.com>
References: <CABvnMci0-E23tAVE3MVgToSdbNuECqtMOe2wWimMmqZ9HZ9dHg@mail.gmail.com>
 <973b2d85-567a-e9aa-1b64-749a1fb116a5@fhmtech.com>
 <CABvnMchqLVxNWqqd36-0s+ug-aPi3kQe7UT6NnVedAHL=2MOyA@mail.gmail.com>
 <0111b128-5639-7694-3e9a-67452408f71e@fhmtech.com>
 <20210419215145.GA4841@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=Baavs/WfJyefRumrT+OOSVMXQYw1gfoAjvtUyM2hjWQ=;
        b=egMIKH0KTw9LstT0nKp3jiNCuOdb95NwbnsVYhEEUCOuOfg+GLqIUQwt9Ixps6lEFLz0XFwFm3/xTl71yup6uMdipIlfEghGR6zYsj9f8ycSD0+mv636aruLHxo2ix+u7B2I3LI/8AA3+1UeCOk5+KNlZnFDJoZYZGj+E+yG5S4=;
In-Reply-To: <20210419215145.GA4841@breakpoint.cc>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: =?UTF-8?Q?Pekka_J=c3=a4rvinen?= <pekka.jarvinen@gmail.com>, netfilter@vger.kernel.org

Hi Florian,

On 2021/04/19 17:51, Florian Westphal wrote:
> Frank Myhr <fmyhr@fhmtech.com> wrote:
>> Nitpick: just in my personal opinion, better not to use table name that is a
>> nftables keyword ("filter"). I know the wiki does it lots of places. And
>> it's not technically wrong. But:
> 
> "filter" is not a reserved keyword.

Yes, I almost didn't say anything... maybe like vi vs. emacs it's better 
to keep my opinion to myself. Actually when looking at a whole ruleset I 
don't much care one way or another. My problem comes when using the 
command line; when I see something like:

nft add rule inet filter prerouting iifname wan0 tcp dport 12345 count

... there's a pretty good chance I'll mistake that for a filter chain. 
(Whereas in the OP ruleset it's a nat chain.) Even checking the ruleset 
I might miss the nat/filter chain distinction unless I'm careful. For 
me, naming things as above is error-prone and forces a mental load I 
could allocate more productively elsewhere.

Since (from a user's perspective) the only purpose of tables is to group 
objects with same family, I've taken to calling them something like 
"t_inet". And throwing all inet objects in there so that sets & maps can 
be shared most widely among them.


>> You're filtering in a nat chain, generally not a good idea. My understanding
>> is that, since nat is based on connection tracking, this chain will see only
>> the FIRST packet of each connection.
> 
> Correct.

Thanks for confirming. :-)

Best Wishes,
Frank
