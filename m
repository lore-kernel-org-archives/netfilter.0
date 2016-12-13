From: Tom Hacohen <tom@stosb.com>
Subject: Re: nftables: masquerade sets wrong source address
Date: Tue, 13 Dec 2016 14:53:35 +0000
Message-ID: <CAEvi_o-EDiz2bS9TPh0T-sTwomduA=sN1v-GrhLTjDs_Wpwduw@mail.gmail.com>
References: <CAEvi_o9_SJNGH-RWq6Kt+UiXVY4ozaMy3yJ2rPdV0Rbk1QrRZw@mail.gmail.com>
 <20161213143227.GU8339@harrier.slackbuilds.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stosb.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=rL4N3+fNHslJC5n3anGMavYiB+03sIt/O6xmd7ozpGI=;
        b=tZXe1y+r+EoW1r1rCFV1ftqmB+fqj/wpGYe8IO/aR4d/+hngJQGqnCujP0SDpR/lDo
         SviugZe7OkUCzne10UIo7yf4o96o9UvKZAEKhVslC8+eevNMfPZ5nkEg/l9QpPjP+xcu
         97xmMSTWSQp76wG4P9HsExeKgJqeQUxQvCLJU=
In-Reply-To: <20161213143227.GU8339@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Tue, Dec 13, 2016 at 2:32 PM, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Tue, Dec 13, 2016 at 01:28:41PM +0000, Tom Hacohen wrote:
>> Removing the masquerade line, or changing it to: "oifname wlp1s0
>> masquerade" fixes it, but this is just a workaround that will fail
>> in more complex situations.
>
> ISTM you'd always want to limit a MASQ/SNAT rule by outgoing
> interface.  I don't get why that was "ugly" (as you said in IRC) or
> likely to fail ... well, certainly if using that ruleset where the
> default gateway was on some other interface, but so what?  Adjust
> your rule to suit the situation.
>
> In more complex situations, such as multiple Internet connections
> with policy routing, masquerade is not appropriate.  You'd have to
> use SNAT.
>
> If you're doing NAT among RFC 1918 networks, YDIW.  Fix the routing.

Perhaps "ugly" wasn't the best choice of words, also, as you said, maybe
more complex situations will require other more complex configurations
so this simple case wouldn't matter anyway.

However, let's leave that aside for a moment and consider the test
case I provided in my original email. If masquerade is turned on for "lo"
it will set the wrong address. Is that not an issue? Or at least an
indication something else may be broken there?

At the very least, I found this behaviour surprising.

--
Tom

> --
>   http://rob0.nodns4.us/
>   Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
