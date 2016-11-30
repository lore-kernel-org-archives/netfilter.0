From: Khawar Shehzad <shehzad.khawar@gmail.com>
Subject: Re: Programmatically adding Map element into the map/set using libnftnl
Date: Wed, 30 Nov 2016 22:17:27 +0000
Message-ID: <CAE0moyeLhx0K_L_XSaehmSH5qGsezWiST_E9qWw0wUHn4hHezg@mail.gmail.com>
References: <CAE0moyeVaSi5gmTZgsm4r8on0oWg7zU1eBRaj75TKY9YA58Jew@mail.gmail.com>
 <20161130193453.GA12643@salvia> <CAE0moycYr9ew0+2A38Z5jr=rUMEQ+JYKk1b0MX7sBQXyrmW5iA@mail.gmail.com>
 <20161130201434.GA24593@salvia> <20161130212725.GA2576@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=EiFD6LXZ/YnPnhYVcyxOvulFOv9+q3GgT28NnAwMWOs=;
        b=JrQjAgAWI/XaVPnBY+nFnJS9xF4RK1OrpLIfKPgkq29N20TApiP1qLBOlILOqQPy8y
         2ICIrIfetiJAuf4/e3+KIctXcbELRZr8qga8aOx2NYfsGcfnljSC5jbbz0Twczc66tUF
         Uh/2dllAQJVWPrWrMalkcVvY7hUbluVC+AsCV63cwy2l2X00rYdJcm4uWMDdkKeftzRO
         XnmGvTbMLwR6XHRkAY9h7DbmIe0hJ8JvTbGJ2tO0pC53oViPmLvAWitmFEawkg3gW3Ch
         9WJfjw1e4O0H/9e5lXF0+PcFgkyHZNCDcWnTe1pfz8rgAy2+FGVfjSj08yzaNuxMwi6c
         /x3A==
In-Reply-To: <20161130212725.GA2576@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thanks Pablo, that helped a lot.


On Wed, Nov 30, 2016 at 9:27 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> On Wed, Nov 30, 2016 at 09:14:34PM +0100, Pablo Neira Ayuso wrote:
>> On Wed, Nov 30, 2016 at 07:46:05PM +0000, Khawar Shehzad wrote:
>> > Thanks. I want to add an element to existing ipv6 map programmatically
>> > in C using libnftnl. From the above example commit, the code specifies
>> > how to add a map (which I assessed by working on the
>> > nft-set-elem-add.c example previously, thanks for the datatypes.c hint
>> > too). I tried
>> >
>> >         nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, "fe80::2", 16);
>> >         nftnl_set_elem_set(e, NFTNL_SET_ELEM_DATA, "fe80::3", 16);
>> >
>> > AND
>> >
>> >         nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, &(sa1.sin6_addr),
>> > sizeof(sa1.sin6_addr));
>> >         nftnl_set_elem_set(e, NFTNL_SET_ELEM_DATA, &(sa2.sin6_addr),
>> > sizeof(sa2.sin6_addr));
>> >
>> > but both didn't work. It showed same error i.e. "error: Invalid argument".
>>
>> Oh, those examples are broken. Batch header and trailing are missing,
>> I'm going to fix this.
>
> Just fixed examples to add set element:
>
> http://git.netfilter.org/libnftnl/commit/?id=6a32dbd4cd56c8fede6044a447469fbd0e35c10a
> http://git.netfilter.org/libnftnl/commit/?id=cc1b5986f5379c17c97ff9fb7064aceddf0b87ed
