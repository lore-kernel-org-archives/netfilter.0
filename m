From: Khawar Shehzad <shehzad.khawar@gmail.com>
Subject: Re: Programmatically adding Map element into the map/set using libnftnl
Date: Wed, 30 Nov 2016 19:46:05 +0000
Message-ID: <CAE0moycYr9ew0+2A38Z5jr=rUMEQ+JYKk1b0MX7sBQXyrmW5iA@mail.gmail.com>
References: <CAE0moyeVaSi5gmTZgsm4r8on0oWg7zU1eBRaj75TKY9YA58Jew@mail.gmail.com>
 <20161130193453.GA12643@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=t+Fo1PiLJ5L3R03+Zq7onSZAcjKo/GtA9Xp2UODn3M8=;
        b=rig331zxyg3PHkt3S1wTngHlds0cjFOq4YnNsqKJzs2vT/WahRzSYQifjpP4OmfyNa
         DXTrLKmQwfoV563BQ6a4dA+E476ssn10xskN8yhuSdrsOW79o9qpxb+keq/mk2NwmtS2
         VQiKHfuVfBpDZC/Y5jv95g9l9Jzr4sDbibGsL62KQzKPGe/xMqdbBI0oYefQGOV56B9N
         mvIwJzYVy2xTWfGGSegtbFWP7sq1LO4gucYrxuGH2PcDrmmRjrVxxoBd/1WECukLEp4w
         Nq1LhT1QsWeMOtSmb/Axw0bWxVXkDMDl4FUj7hRsNEPH40r6DEKUEbteWRTp9ZFfvJto
         v4Jw==
In-Reply-To: <20161130193453.GA12643@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thanks. I want to add an element to existing ipv6 map programmatically
in C using libnftnl. From the above example commit, the code specifies
how to add a map (which I assessed by working on the
nft-set-elem-add.c example previously, thanks for the datatypes.c hint
too). I tried

        nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, "fe80::2", 16);
        nftnl_set_elem_set(e, NFTNL_SET_ELEM_DATA, "fe80::3", 16);

AND

        nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, &(sa1.sin6_addr),
sizeof(sa1.sin6_addr));
        nftnl_set_elem_set(e, NFTNL_SET_ELEM_DATA, &(sa2.sin6_addr),
sizeof(sa2.sin6_addr));

but both didn't work. It showed same error i.e. "error: Invalid argument".

Cheers,
Khawar

On Wed, Nov 30, 2016 at 7:34 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> On Wed, Nov 30, 2016 at 07:16:28PM +0000, Khawar Shehzad wrote:
>> Hi,
>> I hope everybody is fine.
>>
>> I want to do following programmatically in C using libnftnl.
>>
>>
>> _______________________________________________
>> "nft add element ip6 my_table my_map {fe80::2 : fe80::3 }"
>> _______________________________________________
>>
>> My example code is below, and it gives "error: Invalid argument"
>> error. My question is simple how can I add an IPv6 map into a set/map.
>> My map type is "type ipv6_addr : ipv6_addr".
>
> Just added an example for you at:
>
> http://git.netfilter.org/libnftnl/commit/?id=2d894a97c28e6c7c7f064d16bec0167d000e901c
