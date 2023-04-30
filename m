From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Possible to check if ip daddr belongs to an interface in the
 prerouting chain?
Date: Sun, 30 Apr 2023 20:09:34 +0100
Message-ID: <20230430200934.91ef05c51eb2e053a51a00d4@plushkava.net>
References: <D797AC4D-8B12-4F80-8C82-1591C3658D0B@gmail.com>
        <37bf019b-6c6e-4e97-a121-91a38270d845@at.encryp.ch>
        <9C3F0DD4-E1F2-4B21-AAF4-5779F0D9655E@gmail.com>
        <0f7066ff-d885-4726-80e8-31df1465a274@at.encryp.ch>
        <4F769A3B-272B-44A2-81A0-4B9AF437FA80@gmail.com>
        <388bf505-89e7-a4c8-29c9-af7b784a3dd1@at.encryp.ch>
        <A7DA2776-4665-48DD-979D-41B4DCB31D7E@gmail.com>
        <20230429092606.b243cfb662aefccebae2d0e2@plushkava.net>
        <459668A7-0536-41CE-990C-2B3E535A5595@gmail.com>
        <20230429095714.c7bb680249a95c1ace3707e2@plushkava.net>
        <259EB616-F421-469C-89E1-12496603999F@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm1; t=1682881776; x=1682968176; bh=//TaOdW1CThT5rmy8wjtzXZNZ
        OcP3b5pHTRYh9X7yTo=; b=1G3Dxf9xeB7zXghn6Ir/QKpKO1ivzzAL9JiywOLAB
        rXLi7E0YjG3eYAYy/n70l0v9UL6F0+tg1hXUkh6Ah3ETX1wKzW4lhrkcyEhmF1U0
        15Cf/G8C6lrRGxjpU+J+TctKz2qVZIGFMpbFLxDktM7nYZ8x9mJRuxwQz3KxGM6b
        EcpoSwN1/8wA7aP6VBd9K9BdTKWdMcMnBWKPZP18tMJXdO1l6+abTHvb+8tlFZ1D
        g6oXj4pmZSZHfWtmr2XQfQ6Jis3u4P0sefHzQ6cpqCKZZ8wlq3jzRHrf5Kq7QGMC
        CKgOQtsLVPQX8dKV5pP6x/9lMbgtDYP9u8ZPA90YfQzHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1682881776; x=1682968176; bh=//TaOdW1CThT5rmy8wjtzXZNZOcP3b5pHTR
        Yh9X7yTo=; b=NQiEZKfgOhkki0AezB8WJ+PtEZlS/HXIowMt0yUnYaZNTWN0lEr
        OmzvlR6P8Kfs7JJS0MJ/BDZKiQBITIOnCWIrT793zNWSV2aR6NytHOFX4lLSChOq
        CdgdxDYW3YbLGcckfYgYQWi/nFxYT0lG6HbBBPrWARnQZdmQEcE0AZmDnuJdsF3Q
        3ASbSjUMo6cPxFYTrlXCMsyaDLOJkI7KzsIFvzWUlRYblM/yYq9FFlnP9G15DzCN
        1I3q+WxfywfgeoC61RInItTwUS+1kJDKXwaE3gPdmwKpXTLwptq8FJmKwQfcqQcr
        dsKml3MeHPexzd3HS8PUeHsNAYC0PmMedIA==
In-Reply-To: <259EB616-F421-469C-89E1-12496603999F@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Glen Huang <heyhgl@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, 30 Apr 2023 19:54:22 +0800
Glen Huang <heyhgl@gmail.com> wrote:

> Hey Kerin,
> 
> Do you mind if I ask a follow up question?
> 
> I gave the two rules you listed some more thoughts, and I still puzzle over a small detail:
> 
> It seems the tuple can change the meaning of the type value? For example, "fib daddr type local”, matches packets destine to any local interfaces, so “local” means local to the host, whereas "daddr . iif type local” matches packets destine to the interface they arrive, so “local” means local to the iif. I thought the type value’s meaning was absolute?

You are quite right. Given that this kind of check always 'returns' a fib_addrtype, the stricter form of the check does entail munging its value. Taking "daddr . iif" as an example, in the case that the destination address is a unicast address that does not belong to the specified interface, the value will be 1 (unicast) instead of 2 (local), even though it technically is a local address.

> 
> I also checked man ip route, and it described local route type as 
> 
> > the destinations are assigned to this host. The packets are looped back and delivered locally.
> 
> So it seems "daddr . iif” now changes it to "the destinations are assigned to the incoming interface”. Are there other values that can have different meanings for different tuples?

FIB expressions performing reverse path checks spring to mind. Below are four (equivalent) rules that perform strict reverse path filtering. The value of "oif" can be compared to either 0 (missing) or 1 (exists).

  fib saddr . iif oif 0          drop comment "strict uRPF filtering"
  fib saddr . iif oif == 0       drop comment "strict uRPF filtering"
  fib saddr . iif oif missing    drop comment "strict uRPF filtering"
  fib saddr . iif oif == missing drop comment "strict uRPF filtering"

If "iif" is removed from the tuple then the value can be 0 (missing) or any value greater than 0, in which case it can be taken to be an interface index. The following four rules implement loose reverse path filtering in much the same fashion as setting rp_filter = 2 does [1].

  fib saddr oif 0          drop comment "loose uRPF filtering"
  fib saddr oif == 0       drop comment "loose uRPF filtering"
  fib saddr oif missing    drop comment "loose uRPF filtering"
  fib saddr oif == missing drop comment "loose uRPF filtering"

Now, let's say that I have an interface named "eth0" and that it currently has an iface_index of 4.

  $ cat /sys/class/net/eth0/ifindex
  4

In that case, both of the following rules would drop packets other than those for which the route to the source address would entail the traversal of eth0.

  fib saddr oif != 4 drop
  fib saddr oif != "eth0" drop

The only difference is that, for the second rule, nft must resolve the ifname to an iface_index in the course of translating and applying the rule. Incidentally, such rules need to be defined within the scope of a prerouting hook; acting otherwise may result in cryptic errors.

[1] https://www.kernel.org/doc/html/latest/networking/ip-sysctl.html

-- 
Kerin Millar
