From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: kernel helper modules parameters
Date: Wed, 08 Feb 2012 16:20:57 +0000
Message-ID: <4F32A0E9.4090900@googlemail.com>
References: <4F31B772.2040102@googlemail.com> <4F31E7D3.5060203@googlemail.com> <alpine.LNX.2.01.1202080454140.12624@frira.zrqbmnf.qr> <4F31F30A.3020902@googlemail.com> <alpine.LNX.2.01.1202080621310.25781@frira.zrqbmnf.qr> <4F32846D.2060408@googlemail.com> <alpine.LNX.2.01.1202081521290.1820@frira.zrqbmnf.qr> <4F3291B3.1030107@googlemail.com> <alpine.LNX.2.01.1202081631580.21312@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=message-id:disposition-notification-to:date:from:user-agent
         :mime-version:to:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=FvsNE0xyRBjQXAkGeC8keB18dv7F0n2bDx21ATD2P74=;
        b=bLnm/tH2ILHwEupmfhJx8nzHJ5Y1Sb2V7zjH9JHGBf/nDNZeTMthxZu+Lm5k6CAoPk
         UUO7zddaFm2prMC4mVsjNx4V0vkx+unkaxU0yaleflKRdUlUP0vKl/ve/hdsN9/hxARa
         C9c60Au4V9AlC7jwuj6u15yBZIp7gTnxJ7ius=
In-Reply-To: <alpine.LNX.2.01.1202081631580.21312@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter user mailing list <netfilter@vger.kernel.org>


> Is this wording compatible enough with non-developers? :)
>   
Well, actually, I *am* a developer! As I already pointed out, it is just 
that I am not that knowledgeable of the inner workings of netfilter (yet!).

> +	    { NULL, ENOENT, "An object was not found. Check that the chain, "
>   
"Object not found" perhaps?

> +	                    "target/match extension, and/or per-extension "
> +	                    "named object exists. Look at `dmesg` for "
> +	                    "reports about the latter." },
>   
In some circumstances (well, at least in my case anyway) the same 
message is also shown in the syslog, so you might want to add this as 
well - just in case you have somebody screaming in your ear why that 
wasn't included/provisioned or why is it that they "can't see anything 
in dmesg".

> With CT, this now looks moot to me like it does to you, since packets 
> can now be assigned via the awesome iptables logic, and the 
> nf_conntrack_tuple inside struct nf_conntrack_helper basically goes 
> unused.
>   
Yep, I agree - force-inclusion of the protocol seems unnecessary, 
particularly when you take into account that in the future there could 
be more helpers implementing variety of protocols (not just tcp/udp) 
and, as it stands, I have to create a separate statement for each - 
doesn't really make sense when ipset can handle this quite easily.

> Let's hear what Pablo (cc'd) has to say.
>   
I am all ears!

> 1. Using the "FORWARD" chain in filter as well as specifying "RELATED" 
> and helper name matches;
> 2. Using the PREROUTING/OUTPUT chain in raw by specifying the CT 
> target with a helper name match (this is what I used in my examples up 
> to now).
>
> Are the two methods above interchangeable (i.e. use one or the other, 
> but not both) or should I configure both (in which case I haven't 
> tried my ipset trick using the first scenario!)? In that file there is 
> no indication whether I should use one or the other (or both!).
>
> If I have to use the first method above as well, why is the "FORWARD" 
> chain used (at least in the examples given in that article)? If I want 
> to set up a helper on outgoing packets then using the OUTPUT chain in 
> filter seems to be the best solution.
>
> I also take it either of the above methods is the preferred option 
> instead of using modprobe (and force the loading of that helper 
> module). Am I correct in thinking that?
Any opinion on this?
