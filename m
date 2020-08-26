From: "" <kfm@plushkava.net>
Subject: Re: Explanation of 2 Rules
Date: Wed, 26 Aug 2020 07:49:59 +0100
Message-ID: <c9f61216-e333-6551-e98e-8a5ce015f248@plushkava.net>
References: <416b36ac-c17f-0ccd-3d28-cf8e4f3372ae@mail>
 <96ccc7de-4de4-e01f-2270-a1238b4cff1a@mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=q
        /SEEqDlM1ddrxTfxg2CRi+09oy4r0VExcYxpxOAAVY=; b=KYUr2E54zF+OZE3fF
        ulKVkeXIb3pDmNVP0VJME2JwgOwMl1B+Y6mHalH17tmvFOcUlmdpqCA/YCE10kHa
        7TiukZW5E+pFMCMjlz2WoPqUwPa/i1UR375gmAQTac7Le5A2eS0WmJ9efRaGmAG/
        9B+KR0xUkiiE6CjpXlqqnn+HyYI0H13r7IWPab+XpOIFewp4DRGB7IXhzPQutvdb
        FKuhIUowBoeb6IE/6W3cLKetMbsoIKL6FstzIVZ4na9U2riIlMCvOMQlNJOPXj6u
        g3FKS8VYbh556p10MuZw8tefuxUUD3guBK19cboOz8auQYIrrRAYVJfncxAaYg3H
        g0jJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=q/SEEqDlM1ddrxTfxg2CRi+09oy4r0VExcYxpxOAA
        VY=; b=kUDM7/XMBgzO8B9uU6bZFPidmPkq8NQb2RipcvT0y+ifVYGE0XLSaXKO+
        ef7/A6bHgmBAE+I4UUGAPkf/dF9O+PJTrwAS8j5Esukn3guuaVOTrx10ju7nnnld
        nKBMHmFsGrKbqY4dT3gVKGX4F7m2yjgCXR0r5TbnFmdNingH0okN7FEMEgVvnbM1
        wXUDkL5r+mRoHnvDUjmdvdMDzRA8cJ6rYtaq6mUmq3/IoO4kPL+FDVVyYIYbxhbi
        9ICKwbF1jnHOd9eO/8okG9C57KEv86V6rQ55VvTgivNJVIgKHIM95W1Fj0zpQwvk
        9i0LxlUbPRqTnBX2jkf1iTYC79vUg==
In-Reply-To: <96ccc7de-4de4-e01f-2270-a1238b4cff1a@mail>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Luening <toml@thlu.de>, netfilter@vger.kernel.org

On 24/08/2020 10:39, Thomas Luening wrote:
> Hi David,
> 
> Am 22.08.20 um 21:12 schrieb david@hajes.org:
>  > why don't you simplify and just DROP INVALID?
>  >
>  > INVALID drops any possible incorrect combination. You don't need to 
> write anymore as in iptables
> 
> thank you for your answer, but that makes it a little more complicated 
> for me now. Now my question has 2 aspects.
> 
> The first one is still the syntax question. Detached from the logic 
> (invalid) I would still like to know if I interpreted the syntax of the 
> statement correctly.

Your interpretation appears correct to me.

> 
> The second (new) aspect is the ct-state "invalid". To help, I looked at 
> 4 presentations by F. Westphal, 1 by P. Ayuso, 1 by R. Spenneberg, plus 
> man-pages and lots of web sites. In fact, I can't find any better 
> explanation of what marks a package as invalid than in linuxtopia:
> 
> https://www.linuxtopia.org/Linux_Firewall_iptables/x1347.html
> "The INVALID state means that the packet can't be identified or that it 
> does not have any state. This may be due to several reasons, such as the 
> system running out of memory or ICMP error messages that do not respond 
> to any known connections. Generally, it is a good idea to DROP 
> everything in this state."
> 
> Well, why is an xmas packet invalid, if it can be identified and has a 
> status (even several, depending on the view/query).

I am by no means a Netfilter hacker but I think that I can shed some 
light on this. I didn't see David's post but you should know that the 
TCP connection tracking code contains a TCP state transition table [1], 
as well as a table of valid flag combinations [2]. The first is harder 
to digest, so here are a few examples of how a decision can be made 
based on its contents. Consider the lines that read as follows:

/*           sNO, sSS, sSR, sES, sFW, sCW, sLA, sTW, sCL, sS2   */
/*synack*/ { sIV, sIV, sSR, sIV, sIV, sIV, sIV, sIV, sIV, sSR },

Now imagine that nf_conntrack observes a SYN-ACK packet completely out 
of the blue. It has no relationship with any existing flow. As far as 
the state machine is concerned, the present conntrack state to be 
ascribed to the packet is NONE (sNO). The first element of the tuple has 
a value of sIV (INVALID), dictating that it is not possible to 
transition to any other legitimate state. Instead, the packet must be 
considered as invalid.

Now consider the second element. If the SYN-ACK packet can be associated 
with an existing conntrack table entry that is presently in a state of 
SYN_SENT (sSS), then, again, the packet may not incur a transition to 
some other legitimate state. Instead, it must be considered as invalid. 
Why? Because it is not legal for the peer to send SYN-ACK immediately 
after SYN.

And so it goes on. All of this is supplemented by a general check which 
prevents packets with obviously incorrect flag combinations from being 
accepted (before the state transition table is consulted).

> 
> BTW, I've been using "invalid" for a long time, but at the moment I 
> can't find out if "state invalid" actually marks xmas packages.
> 
> Best Regards, Tom

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/netfilter/nf_conntrack_proto_tcp.c?h=v5.8#n110

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/netfilter/nf_conntrack_proto_tcp.c?h=v5.8#n700

-- 
Kerin Millar
