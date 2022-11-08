From: Gordon Fisher <gordfisherman@gmail.com>
Subject: Re: nftables and IPv6 prefix delegation (regression vs ip6tables)
Date: Tue, 8 Nov 2022 11:03:03 -0800
Message-ID: <636AA7E7.6090404@gmail.com>
References: <tk16fd$hd2$1@ciao.gmane.io>
 <20221103231245.GD29268@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFXFV4hvxhkzibyJhi4I5PEmRmcN+bjpW480krBAj5I=;
        b=mXIdvP2UFD5mCOuJ9rIoDa5abSKj6wBaaOXo0GGJTSq7+I2tb9MDRqYeTJXvmSemUB
         3/drQkHzbr/tILvwn0dMA73uL1sssf0+Rin7+t9C7twVWlIDUbDSrNuedx5tRo/yt5jJ
         60MGSrollbeblWc0XPOnrI9tBUJgV7vYkewa8HWiacoUQFQOl84jn/Ka75jJqr9f0gK/
         pvbJZSf6FtqMgFk2ZAwm59bmJONq0lVLURsDhCTbSA32bVO0zyhvvYF1vO/Mg9u/UQdO
         txk/yCJP9nBiAXdEmEHIP3Oiay7+5xqwgrhk+1AFiIcnTTmxsyJql6k7aR2WWDBS68F4
         jHHA==
In-Reply-To: <20221103231245.GD29268@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 11/3/2022 16:12 PM, Florian Westphal wrote:
> Ian Pilcher <arequipeno@gmail.com> wrote:
>> My plan to migrate from iptables to nftables seems to have hit a major
>> snag.  nftables seems to lack the ability to use prefix-independent
>> masks when matching IPv6 addresses.
>>
>> For example, my ISP delegates a /56 prefix, which I can divide into as
>> many as 256 separate /64 subnets.  So a routable IPv6 address in my
>> network can be broken down like this.
>>
>>    pppp:pppp:pppp:ppNN:hhhh:hhhh:hhhh:hhhh
>>
>> Where the p's represent the delegated prefix, the N's represent an
>> internal "network ID", and the h's represent the host address.  The
>> prefix is relatively stable, but it can change occasionally, so hard-
>> coding it into firewall rules is not really an option.
>>
>> Assume that I want to match a particular host (pppp:pppp:pppp:ppc8::1)
>> in a rule.  With ip6tables, I can match this address with this
>> expression:
>>
>>    0:0:0:c8::1/::ff:ffff:ffff:ffff:ffff
> ip6tables-translate suggests:
>
> nft add rule ip6 filter INPUT 'ip6 saddr & ::ff:ffff:ffff:ffff:ffff == ::c8:0:0:0:1'
Out of curiosity, why does ``0:0:0:c8::1`` get translated into 
``::c8:0:0:0:1`` ? Both seem to be correct when you consider the address 
expands to``0:0:0:c8:0:0:0:1`` (or 
``0000:0000:0000:00c8:0000:0000:0000:0001`` in full form.) It seems to 
come down to a program choosing to use the ``::`` 
consecutive-zero-hextet-condenser by looking from one end or the other, 
but is more considered more correct than the other (that could upset 
some programs that use ipv6 addresses?)

-- 
gfish

