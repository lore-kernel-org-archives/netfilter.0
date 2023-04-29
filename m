From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Possible to check if ip daddr belongs to an interface in the
 prerouting chain?
Date: Sat, 29 Apr 2023 09:26:06 +0100
Message-ID: <20230429092606.b243cfb662aefccebae2d0e2@plushkava.net>
References: <D797AC4D-8B12-4F80-8C82-1591C3658D0B@gmail.com>
        <37bf019b-6c6e-4e97-a121-91a38270d845@at.encryp.ch>
        <9C3F0DD4-E1F2-4B21-AAF4-5779F0D9655E@gmail.com>
        <0f7066ff-d885-4726-80e8-31df1465a274@at.encryp.ch>
        <4F769A3B-272B-44A2-81A0-4B9AF437FA80@gmail.com>
        <388bf505-89e7-a4c8-29c9-af7b784a3dd1@at.encryp.ch>
        <A7DA2776-4665-48DD-979D-41B4DCB31D7E@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm1; t=1682756769; x=1682843169; bh=R9y8adimM3Jx02HvO9+6WWsrj
        1zYSp2CiE8Zw35vJ8k=; b=Kg8wXUhIMe2I9Jh2aggglS+EQmvby8F3ZSsNVrar7
        e4auO3DQfMDtYceOkX1lcAjGhtU04OF8gL1qEpS7IKqAokD8zrl759TeQdttVHTZ
        icQKuTkjZ+r4PVFmlIKQ1rlJKo6o0RyL8D7JuHWy9ov7Vq1kAoCfAzKJhVHN7DMg
        /HPLbKFhBqjsNLyFrOHuoRgu6fE2Pq5s6FVfNVNh9izWaJS3OYMnO9M9yhlj+jpm
        X93piuMkKVDlcP2zCIocSZbb120Vd/eiRW0h5WYvXynZe03uyCmUO4kgVZ1bNEUy
        6hWedFLdu9GQPUIsC+49IuTkgjYTVohDKTvW4xyVnab2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1682756769; x=1682843169; bh=R9y8adimM3Jx02HvO9+6WWsrj1zYSp2CiE8
        Zw35vJ8k=; b=eszhGGIR2OGed7ELcLfUXw8ppVzTuW31zRYUDfjI6dnNihHS0bd
        wWG4RbPK2VOh7bjgRI/tgYQbDr7p+MHxRQNb9JSmy/GF8nRUhNqK7MADVb/2dF4k
        zhM2eKGD3f/ie/w87i+okni51tEWloyHSzwyEwHyRKS2x8lFJr/jWTYC15La3m2l
        fW4rEgak/B3UeqQMELNV6+UxlFM1tukCTtKklW+l/zNhHYTmztuyP9QAbCb5ehmS
        fCid8ha+qIgh69uIredWe5BE7WeHItFmXtBSielIkikvBmDVB6l+xUaZM8HNAyAz
        yb02zsMxEvB2aN1G4MkYSgBdKX6qyg/vb3A==
In-Reply-To: <A7DA2776-4665-48DD-979D-41B4DCB31D7E@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Glen Huang <heyhgl@gmail.com>
Cc: Serg <seentr@at.encryp.ch>, netfilter@vger.kernel.org

On Sat, 29 Apr 2023 13:44:18 +0800
Glen Huang <heyhgl@gmail.com> wrote:

> > Basically, what it does is lookup at "local" routing table
> 
> I checked my “local” routing table, and my wan IP was there. But somehow, given the following rule, packets with wan IP as the destination still got tproxied:
> 
> chain foo {
>   type filter hook prerouting priority mangle; policy accept;
>   fib daddr . iif type { local, broadcast, multicast } return
>   meta nfproto ipv4 meta l4proto { tcp, udp } tproxy ip to 127.0.0.1:123 meta mark set 1
> }
> 
> I also tried "type == { … }", didn’t help.
> 
> The official wiki mentioned:
> # only accept packets to addresses configured in the *same* interface, eg
> nft add rule x prerouting fib daddr . iif type local accept
> 
> and the man gave this example:
> # drop packets to address not configured on *incoming* interface
> filter prerouting fib daddr . iif type != { local, broadcast, multicast } drop
> 
> Which seems to suggest “local” only matches packets whose destination interface must be the same one they originate from? In the lan -> wan case, that’s not the case so I guess it doesn’t match?

Any unicast address for which the destination would be the host itself is considered to be "local". For instance, the following sample ip(8) output informs us that 192.168.1.1 is a local address.

$ ip route get 192.168.1.1
local 192.168.1.1 dev lo src 192.168.1.1 uid 1000
    cache <local>

Rather, it is the concatenation of "daddr" and "iif" that renders that particular fib check so strict. Consider the difference between the following two rules.

fib daddr type != local drop comment "weak host model"
fib daddr . iif type != local drop comment "strong host model"

Let's assume that those rules are to be interpreted within the scope of an input hook. The first rule would reject packets other than those destined to local addresses, irrespective of the interfaces to which the addresses are assigned. The second rule would be stricter still, as it would reject packets other than those destined to local addresses that are also assigned to the interface at which any given packet arrives.

-- 
Kerin Millar
