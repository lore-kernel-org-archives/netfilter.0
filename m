From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: kernel helper modules parameters
Date: Wed, 08 Feb 2012 14:19:25 +0000
Message-ID: <4F32846D.2060408@googlemail.com>
References: <4F31B772.2040102@googlemail.com> <4F31E7D3.5060203@googlemail.com> <alpine.LNX.2.01.1202080454140.12624@frira.zrqbmnf.qr> <4F31F30A.3020902@googlemail.com> <alpine.LNX.2.01.1202080621310.25781@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=message-id:disposition-notification-to:date:from:user-agent
         :mime-version:to:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=8n3U1nxsDmah7muYyAE1Wk/BwCyEnu3mBVLPLaKr4gI=;
        b=Xbvkqz4GSCIInjM3/tipznYSQOXir4RXoJtWKl+wGhBBvEaweG08snBTiuUbheI+im
         86Y4v9RLM1IKO2TRtuKz7jOXo+PW1872hK9ZNpSJf446s0u8Fg3mHZiSda8FvDJHYZo4
         esyHE0b0R3NqI0iQ3Dd8kUrzV3o0RQGPUiqiQ=
In-Reply-To: <alpine.LNX.2.01.1202080621310.25781@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

 

>> Are you really *that* thick?
>>     
>
> Yes, apparently my other self was sleep-walking and missed the -j CT.
>   
It is never a good idea to work long hours!

> ENOENT is traditionally returned by x_tables when a
> chain/target/match could not be found and hence ENOENT has been
> largely tied to the very translation ("No chain/target/match by that
> name") that you see. Looking at xt_set.c reveals that xt_set, too,
> can return -ENOENT from its checkentry function, which x_tables just
> passed up to userspace. Hence there is no way to distinguish between
> the two. However, xt_set also emits a message into dmesg via
> pr_warning when it does return ENOENT.
>
> The ip_set_nfnl_get_byindex function returning ENOENT would in turn
> indicate that there was no set by the given index, which I gather
> must have been translated from the set name in userspace already.
> It is possible that this set is removed between the time the lookup was 
> done and that the rule reached the kernel. And that is unlikely.
>   
You need to bear in mind that my understanding of the internal netfilter 
intricacies is still a bit limited, so you have to translate the above 
for the "regular" folk like myself.

> Given that
>
> # ipset n test hash:ip,port family inet timeout 0 hashsize 128
> # iptables -A OUTPUT -t raw -m set --match-set test dst,dst
>
> succeeds, and adding -j CT does not (and I know I do have xt_CT),
> dmesg is once again handy:
>
> [29710.653372] xt_CT: You must specify a L4 protocol, and not use inversions on
> it.
>
> (And yes, xt_CT also returns ENOENT. Guess we need to change
> the error message that the iptables frontend prints.)
>   
I forgot to look at dmesg/syslog - indeed, I do have the same message (a 
couple of times). What I can't understand is why do I have to specify a 
protocol when ipset can match on IP address & port/protocol at the same 
time (that is the sole purpose of hash:ip,port isn't it?)? The "L4 
protocol" is already specified when the set members are registered in 
that set, so I don't see any need to include the protocol part in the 
iptables statement.

One other thing, which may cause further complications - the ftp helper 
is supposed to work on tcp protocol only, so in theory, I should not be 
allowed to register anything other than that protocol. I suspect if I 
try to register udp (or any other protocol which differs from tcp) I 
will succeed. So, I think, this may need to be corrected as well.

