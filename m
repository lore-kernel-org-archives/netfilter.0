From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: unable to install libnftnl Error : "XT_EXTENSION_MAXNAMELEN
 undeclared here"
Date: Thu, 27 Nov 2014 16:53:16 +0530
Message-ID: <CAA5aLPih82HGtTugrE9ekiMcj-xkwH4KhV7t5FB=f0PpOU9bow@mail.gmail.com>
References: <CAA5aLPgXUgF4JsTh6YR-0Mw9+NSW8bmMAp2wJLGf85QdsVKErQ@mail.gmail.com>
	<20141127103549.GA3271@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=m8Ov/YTFcQou6OdcMVh2OqVTou1ewKLXHlR+8WRy0IY=;
        b=GPNOSP5p95FhYRAKILxXlLR2skM9E37kRntTZ0D+0Jrr3dVMUrMAcwJDuYY0DgjXfN
         nPDE7D6MtP5+y4s97QhwjUjGT7/4uQasthCeZlAM1d7rxHtM0t+YjOoV5C4se4pIMAT+
         llQDMH+Pld0YUUMKDSabMyiUBQILngXeOhJ0cJtsmFRgwyMOwReQc3aufeMHxNsaOV1S
         mCAZpsYwK74Qt+E9Z+zWPe7nwikblidp+w+NRCQNs6147tUCm17AsnvuKqB3uv4OsA24
         A1I1oV3xsGd/ExGnhxL7vMN6wG8mW766bynyMUD0vhb28KlYtXmUVlUJOihNMzpk5AgY
         /poQ==
In-Reply-To: <20141127103549.GA3271@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thanks for the info.

I downloaded latest snapshot. It installed atleast on 2.6.36.

I want it to test skbinfo feature of ipset (released in 6.22), so I
was installing iptables which required libnftnl

Let see if it works!

Thanks once again.

On Thu, Nov 27, 2014 at 4:05 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> On Thu, Nov 27, 2014 at 03:47:50PM +0530, Akshat Kakkar wrote:
>> My kernel is 2.6.36
>
> nftables requires >= 3.13.
>
>> I am trying to install libnftnl-1.0.2
>> I executed following commands
>>
>> tar xvf libnftnl-1.0.2.tar.bz2
>> cd libnftnl-1.0.2
>> ./configure
>>
>>
>> Till this point everything is OK.
>> When I execute command ""make""
>> I get following error
>>
>> make  all-recursive
>> make[1]: Entering directory `/usr/local/libnftnl-1.0.2'
>> Making all in src
>> make[2]: Entering directory `/usr/local/libnftnl-1.0.2/src'
>>   CC     expr/match.lo
>> expr/match.c:31: error: 'XT_EXTENSION_MAXNAMELEN' undeclared here (not
>> in a function)
>
> That is an old bug that is already resolved in the git snapshot.
