From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Programmatically adding Map element into the map/set using
 libnftnl
Date: Wed, 30 Nov 2016 21:14:34 +0100
Message-ID: <20161130201434.GA24593@salvia>
References: <CAE0moyeVaSi5gmTZgsm4r8on0oWg7zU1eBRaj75TKY9YA58Jew@mail.gmail.com>
 <20161130193453.GA12643@salvia>
 <CAE0moycYr9ew0+2A38Z5jr=rUMEQ+JYKk1b0MX7sBQXyrmW5iA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAE0moycYr9ew0+2A38Z5jr=rUMEQ+JYKk1b0MX7sBQXyrmW5iA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Khawar Shehzad <shehzad.khawar@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, Nov 30, 2016 at 07:46:05PM +0000, Khawar Shehzad wrote:
> Thanks. I want to add an element to existing ipv6 map programmatically
> in C using libnftnl. From the above example commit, the code specifies
> how to add a map (which I assessed by working on the
> nft-set-elem-add.c example previously, thanks for the datatypes.c hint
> too). I tried
> 
>         nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, "fe80::2", 16);
>         nftnl_set_elem_set(e, NFTNL_SET_ELEM_DATA, "fe80::3", 16);
> 
> AND
> 
>         nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, &(sa1.sin6_addr),
> sizeof(sa1.sin6_addr));
>         nftnl_set_elem_set(e, NFTNL_SET_ELEM_DATA, &(sa2.sin6_addr),
> sizeof(sa2.sin6_addr));
> 
> but both didn't work. It showed same error i.e. "error: Invalid argument".

Oh, those examples are broken. Batch header and trailing are missing,
I'm going to fix this.
