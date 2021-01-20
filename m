From: "" <kfm@plushkava.net>
Subject: Re: Migrate ipsets to nftables
Date: Wed, 20 Jan 2021 21:26:44 +0000
Message-ID: <87122b3e-c40c-1df5-360c-4298cdff509d@plushkava.net>
References: <520e46a0d20803c22d515aca5e8df7045ca09497.camel@lusan.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=o
        nWmkjiXGYZddTdpnxRwQNj2g3RLiiD85szy/PGEvbs=; b=HQ16NH/h0es+ZKgOc
        +z7e6ZHLcxYMweCqt+XJ700Df+okNsYWKCcQ4Mlp4WOuDzCdGVPwHnYiCc/TUR3n
        HbcM7VQhmYe/UhrrkPbm6Y6ew8A6G22FXfAEbAl33N23kfhFf+wMdoUj+HoOFogs
        U6/Sl+cKunxYlRnXK/T6Oe5PYg/CpwAKK9XsP8cNX6WnFqW0NsWCzLvmGPuQfiHM
        lsTnI+BCaDV6bBo62rsY5H3BPmv6bvEoAGCXwhZy/Mu6JmRQduNMaQ85ljDcyYmb
        kgpEvX+oCN+/G+LwiEGJJy3+/YE44WfgIQDSBVGkmYJJZRTPw4GxYM6quaDXlr8W
        UusEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=onWmkjiXGYZddTdpnxRwQNj2g3RLiiD85szy/PGEv
        bs=; b=f6JxOxBjKBxE3amcDXhy2Kek17+LJrNE542xRqDQ+Dvxcp4vw5EuBnVol
        HVrNEO6RWC8O4tfoNXkxwUV+gA4ocC6jFF6NXOBFJbBtAOk7jxgnHB0/5G1XRE/O
        iCA4VexJGjciI0RFBGvhHLQ88lI1ObkPqx7eH9l53t0O/bs0V4qMFwoH3aBWv4ZW
        p0pQV6Aix8aHBJOBHK4FJQxKjNke4xKdB1BhR7b3u88NoIDUm7XBX3chLGJDIVoz
        nEQbcP/6KO4tN9MYNs6X3a84QCPM6pU1t9DfBBMgf6crp2WtTCaHkA8hurtI/s4B
        X0GeicqqW9aJgXu/tzlL3m4aYSlqg==
In-Reply-To: <520e46a0d20803c22d515aca5e8df7045ca09497.camel@lusan.id.au>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: nikolai@lusan.id.au, netfilter@vger.kernel.org

Hi Nikolai,

On 20/01/2021 10:41, Nikolai Lusan wrote:
> Hi all,
> 
> I am in the process of migrating from iptables+ipsets to nftables. Is
> there an easy way to migrate exisiting ipsets to nftables sets.
> 
 >

Assuming that you are alluding to the prospect of having a utility that 
can act as a stand-in for ipset(8) then, to the best of my knowledge, 
the answer is no. At least, not yet.

That said, if you were to go into more detail regarding the aspects of 
migration that you are having difficulty with in the absence of tooling, 
it should be possible to provide some guidance.

I have been meaning to eventually contribute relevant information to the 
wiki - an intention stymied partly by working through some related bugs 
and partly through simply not getting around to it.

-- 
Kerin Millar
