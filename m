From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: unable to install libnftnl Error : "XT_EXTENSION_MAXNAMELEN
 undeclared here"
Date: Thu, 27 Nov 2014 18:08:55 +0530
Message-ID: <CAA5aLPjWiopxcPCNF=_87zbFSd4BT-C4yvVDShRe6WOodGOapA@mail.gmail.com>
References: <CAA5aLPgXUgF4JsTh6YR-0Mw9+NSW8bmMAp2wJLGf85QdsVKErQ@mail.gmail.com>
	<20141127103549.GA3271@salvia>
	<CAA5aLPih82HGtTugrE9ekiMcj-xkwH4KhV7t5FB=f0PpOU9bow@mail.gmail.com>
	<20141127120156.GA22329@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=9kwx5mziN6+NpA7LPpWbWxE0PCfynFS7lPm6p+I6+Qs=;
        b=okt8I+DwfzRQXuKIw74FeCiS1PKO5FFxCue2WIrPI+lbJywjbqQLwdC5kuNQS4SiQ2
         y2UxXBOU2L3Pb9NWmMy8tzgnGo75Sii8ANMTPGCQGfMtuH5+wdB7R+JjDjLoUFh8O0OH
         CiLeopGNGV8XS6YII0MkLxRVB/PSNeE+H254suVnGNWYYHQT2tXmt0DzNRjQI8IL9HOY
         OQRtAhNGXHcjnbxzNicJtA4rb51nI8FWlUdoD9fOs/gFzR2b+0B/cjD5Lv7WzmgZFJ3c
         IlQxSkTfn49bSn2fKrbb7XDcR2EA63Um/HadRv4aTeu+gU5yfE+oS1ps1FpO9PNj4MRa
         n29A==
In-Reply-To: <20141127120156.GA22329@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

In ipset 6.22, anton has added support of skbinfo extension
in order to use this feature, corresponding iptables should use something like
""
-j SET --map-set mark_values dst --map-mark

""

For this, I need to install latest snapshot iptables and for that I
require libnftnl


On Thu, Nov 27, 2014 at 5:31 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> On Thu, Nov 27, 2014 at 04:53:16PM +0530, Akshat Kakkar wrote:
>> Thanks for the info.
>>
>> I downloaded latest snapshot. It installed atleast on 2.6.36.
>>
>> I want it to test skbinfo feature of ipset (released in 6.22), so I
>> was installing iptables which required libnftnl
>
> I think you're mixing up things.
>
> You seem to be refering to ipset, while installing nftables libraries.
