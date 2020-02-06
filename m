From: "" <kfm@plushkava.net>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] does redirect accept daddr?
Date: Thu, 6 Feb 2020 15:37:00 +0000
Message-ID: <c039bd75-e337-1fb9-520b-c684a646bce5@plushkava.net>
References: <d7f31893-feaa-e138-ad80-95a37d275e7b@gmx.net>
 <235762f1-4d73-1b5d-6e5d-eaf59cb8e916@plushkava.net>
 <6f2040c1-f7cb-589d-fefd-743af3988703@gmx.net>
 <325b66b7-ae3a-dd64-c1d6-a65f7c929562@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:from:to:references:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=k
        wZtjzlgH01YIJiSvrrNBbk8kPF1uXor84+aXIjIEf8=; b=hf7sYzXmCL6FarYfo
        HeVx+fYGce+Uzs58PNisHgk8Em/VbIZallGN6qYKvSEjvTnY+p14hR0GgFyudtWo
        lQ9fM5oRA+bW/TnscH26uZlEANlosRiaB4ZZCcl0wdbPdVi/xFUhYbB0olnwQYc1
        tB4qMww60qEz9zZeHWRJWVMU2croyin6AyLcf8nhhP735c0m9XDLrV3x7VuSSDXV
        Ly7UBPLo3VhW6CL+02yAwS41AyslANKZzmGqx/6agJbsqBXH3wt+3V+7e5tX2ndm
        bARnodJiFwH2Auq/XM+9Pq7HvEoWqwzcCEq9isXoBb9caL+zMQNxLgnyg248P80L
        Wr6uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=kwZtjzlgH01YIJiSvrrNBbk8kPF1uXor84+aXIjIE
        f8=; b=vOXH/RrzN49wHnvpON0wS0F+R3tS0GfTV0IaW2yyJqGWuH89/T4696F/4
        JliItMxkxcRTHqfVg3Q5pWbz1axZNfodfISc1do6gj25k7PkSpppRVZX4AY322hk
        oHeHTgXBqlzy0bNYyIjznNSwIvkHxt0+8aVOHz+besUDpLPT5LGvfArVggWLLfFk
        ASYV2d8ZUhn+LwqYj8SvAqaMYgxbabSceAePYF9VMy/ZzZy9YHCOo3WTVGKs12IK
        kqWVR54oOO5cfIg/0ldxlHlYXFmJZnFeW/NbG0gDpyg4bvI6Y5klMS1eebfwe/gv
        d2g11QzqwDimcythQg7F+VsFTaIDg==
In-Reply-To: <325b66b7-ae3a-dd64-c1d6-a65f7c929562@plushkava.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 06/02/2020 15:23, kfm@plushkava.net wrote:
> 
> It is applicable. The use of dnat (or redirect) amounts to a mostly 
> transparent form of interception at Layer 4.

Self-correction: Layer 3 and/or 4, depending on the rule in question.

-- 
Kerin Millar
