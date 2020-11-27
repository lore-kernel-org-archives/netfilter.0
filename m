From: Daniel Lakeland <dlakelan@street-artists.org>
Subject: Re: nftables "meta priority set" not working
Date: Fri, 27 Nov 2020 15:39:11 -0800
Message-ID: <319c3747-00b6-6f25-53dc-ecfa6063fe59@street-artists.org>
References: <d3a63d2e-fe28-07f6-305f-3154e5c2094f@street-artists.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=street-artists.org; h=
        subject:from:to:references:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=
        street-artists.org; bh=GsKxy5sUU8hSAMRbwZpLGr02PF8=; b=LKP2/BJZD
        mLtzG6pUXHv3mwHM0OTQPfgAWNyyrXLwudc5sSqRlaE8f5hyH77/CZxnfowySr37
        j+S9uwGjLIwO1FHR6F1jfKOLhMEKSAsyfsLviue7n7nKhdehw+WGNl6UCYpX6VeQ
        J6xWxhD/8rkhByYE2lziiYax32kK2GOnWc=
In-Reply-To: <d3a63d2e-fe28-07f6-305f-3154e5c2094f@street-artists.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 11/26/20 6:51 PM, Daniel Lakeland wrote:
> Strangely I can't seem to make a rule that sets the tc class work, 
> unless it's setting the class of the root qdisc?
> ....
>
> What is going wrong?
>

Well, from testing, if I were to guess what's really going on it's that 
"meta priority set" sets the packet's "priority" field using the 
**minor** number only, and doesn't really do anything with the major number.

The kernel then always just hands the packet to the top level qdisc, and 
it tries to interpret the minor number given in the priority field... 
but if that minor number doesn't exist, then it either drops the packet 
or uses its default depending on the qdisc.

To make this work, it's extremely useful to **not** reuse minor numbers 
when creating sub-qdiscs and add some tc filters at the root for example:

tc filter add dev eno1 parent 1: protocol all basic match "meta(priority 
eq 33)" flowid 2:33

I also found that of course my nftables doesn't have any arp tables or 
do anything with packets not ipv4 or ipv6 so when I'm using a qfq qdisc 
which has no default it was useful to have:

tc filter add dev eno1 parent 1: protocol all basic match "not 
(meta(priority eq 1) or meta(priority eq 2) or meta(priority eq 3))" 
flowid 1:4

or some such thing, which basically catches packets that don't have any 
priority and sends them to a default. As soon as I did this my ipv4 
started working again (ARP packets were being dropped).

Hope this helps some people, and please let me know if I've got it 
wrong. this is all deduced from empirical testing.


