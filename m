From: George Amanakis <gamanakis@gmail.com>
Subject: Re: tc filter connmark
Date: Thu, 14 Aug 2014 08:54:46 +0200
Message-ID: <53EC5D36.5010105@gmail.com>
References: <53EB7DA3.8020505@gmail.com> <1407942856.9948.15.camel@andy-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=3Pbf54zpgMHJoPoWqPz3Fe9WHly7yoNOhTicoaV2tb4=;
        b=gIkNtilSAwXVZZ5xsDa5fvuvp9TAoI/Ck5TZOawGsHqE7e1W2MvsSiKVYkbY9jS3Q3
         s5PD2DjeuW8r/76RRKVJoMhio8CnsNjCWLk3wku6FxCJCrfUrQbBwbIXHg5gt2NN+msp
         QJY9ChCPfRQHfR2+x411eiTJkojRYhd9heUEp05qIKFW9eT/DKUJo74pv76YrZ8Gw1xl
         DRbhuqQ7Iie5dS+GCiuJaF2FPmv19Ri1YU7TwkTvcExfSpXDQKSojpbgZ1irz9oMXTUl
         7oTmmljM45IN5e10GP2cXuEhnyqHByLOKFHUmRTlEUnvIxLiySeMaigV+nGO6SStFE86
         0ayA==
In-Reply-To: <1407942856.9948.15.camel@andy-laptop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

Yes but in this case how could someone handle SNAT on INGRESS by using IFB?

On 13.08.2014 17:14, Andrew Beverley wrote:
> On Wed, 2014-08-13 at 17:00 +0200, George Amanakis wrote:
>> Dear All,
>>
>> I would be glad if you could help me out. I am running the following
>> script:
>>
>> -------------- cut - here -----------------
>>
>> iptables -t mangle -N QOS
>> iptables -t mangle -A FORWARD -o eth0 -j QOS
>> iptables -t mangle -A OUTPUT -o eth0 -j QOS
>> iptables -t mangle -A QOS -j MARK --set-mark 3
>>
>> iptables -t mangle -A PREROUTING -m mark --mark 3 -j ACCEPT ### (counter)
>>
>> tc qdisc add dev eth0 root handle 1: htb
>> tc filter add dev eth0 parent 1: protocol ip prio 1 u32 \
>>       match u32 0 0 classid :1 \
>> action xt -j CONNMARK --save-mark
>>
>> tc qdisc add dev eth0 ingress handle ffff:
>> tc filter add dev eth0 parent ffff: protocol ip prio 1 u32 \
>>       match u32 0 0 classid :1 \
>> action xt -j CONNMARK --restore-mark
>>
>> -------------- cut - here -----------------
>>
>> Now if I insert (-I) in "PREROUTING" a "CONNMARK --restore-mark", my
>> counter shows that egress filter "tc filter ... parent 1: ... CONNMARK
>> --save-mark"marked them correctly.
>>
>> However, if I remove the "CONNMARK --restore-mark" from "PREROUTING" my
>> counter shows no traffic. This means that the ingress filter "tc filter
>> ... parent ffff: ... CONNMARK --restore-mark" is not working.
> If I've understood correctly, you're trying to restore a netfilter MARK
> during ingress? If so, I'm not sure this will be possible, as any
> ingress processing is done before the traffic hits the netfilter stack,
> so it will have no knowledge of connection tracking:
>
> http://inai.de/images/nf-packet-flow.svg
>
> Happy to be corrected if I'm wrong!
>
> Andy
>
>

