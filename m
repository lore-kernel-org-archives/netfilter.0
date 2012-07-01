From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.13 released
Date: Sun, 01 Jul 2012 17:52:33 +0100
Message-ID: <4FF08051.3090204@googlemail.com>
References: <alpine.DEB.2.00.1206292201340.29738@blackhole.kfki.hu> <4FF02A93.8080603@googlemail.com> <alpine.DEB.2.00.1207011405160.2289@blackhole.kfki.hu> <4FF04038.4080306@googlemail.com> <alpine.DEB.2.00.1207011434010.2486@blackhole.kfki.hu> <4FF04647.7060807@googlemail.com> <alpine.DEB.2.00.1207011446260.2486@blackhole.kfki.hu> <4FF04DDA.3020609@googlemail.com> <alpine.DEB.2.00.1207011646110.2749@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=bIpq78cjZaj32bVX7AaUFC9ncSAui/KPabBsi43m0PU=;
        b=FdRpPHqvTEqffJhcShk3DYmPCOyzkKhf4hiqDUhgSPHbUfBs+SSwKTtis/YYadGSCi
         /ZdhR3mmlc+ePOZXCDQqQoFopE8K7jvLeoDj1FTBfwiWyIUiRlrKHtFNucRCwYcx7GP/
         mfVjQ8NCDnYAgtxgeiv0RxPniU7zlv7qqSR4rO94n8SqQiESpNAF+kg6CZ0Pprvsmxxu
         P9HLFNGqcYw6xe4i8Lf+sg2XygI436e0aVz4m+TWuEvui4TzieXna3QotdUXg4a8avva
         26EhIbDC6Q6saKokRnP6GSP5PfUIxK9yB5YVfTzxXqd5OwaVGii18qQ4MwrBFmd9G43A
         8x9A==
In-Reply-To: <alpine.DEB.2.00.1207011646110.2749@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org, Patrick McHardy <kaber@trash.net>


> I have to weight the "great deal of inconsistency and inconvenience" 
> caused to you against breaking firewall setups out there. I really 
> appreciate your comments, but in this case you should adapt.
>   
You are in no position to tell me what I should be doing. As for the 
"breaking firewall setups" bit - see my previous comments.

Also, there is a flip-side to that particular coin - by keeping buggy 
netfilter/kernel code, I'd argue that this is more likely to "break 
firewall setups" as you put it - by keeping this, wrongful, setup and 
the whole notion that for incoming IP addresses, subnets, ports and 
everything else one should use "dst" designation, but for incoming 
interfaces I should use "src" instead. I mean, really, get a grip of 
yourself!

> Do you think all admins constantly read all changelogs, mailing lists 
> about all the software they use to catch backward incompatible changes? 
>   
They do, if they're worth their salt.

> You are aware of the "inconveniece", and you could adapt yourself to it 
> anytime.
Why should I, as a network admin, have to adapt to this buggy code just 
because you just can't see what's in front of your face?

>  I'm responsible for every user, for those who never read these 
> mailing lists as well.
>   
So, is ignorance an excuse nowadays? I never expected to read that from 
a Netfilter developer, but there is a first time for everything I suppose.

> Feel free to involve anyone.
It is the only way I see forward as, evidently, "debating" this with you 
is completely and utterly pointless - you are like a broken record, 
repeating the same over and over and over again like an automaton.

> You argue that the meaning of src/dst for the interface part is 
> counter-intuitieve and therefore must be reversed - regardless of the 
> backward compatibility issue and the possible breaking of existing setups.
>   
Where did I state, or even hinted that it is "counter-intuitive"? That's 
right, I didn't. Because it is not "counter-intuitive", it is, at best, 
wrong and inconsistent, at worse - buggy and downright misleading! Can 
you read, Jozsef?

