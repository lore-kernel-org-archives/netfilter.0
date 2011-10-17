From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: route sorting
Date: Mon, 17 Oct 2011 16:37:59 +0100
Message-ID: <4E9C4BD7.7000403@googlemail.com>
References: <4E9C1E1C.4060309@googlemail.com> <4E9C2BA6.6030507@mejor.pl> <4E9C449D.2060907@tolaris.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=message-id:disposition-notification-to:date:from:user-agent
         :mime-version:to:cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=XYINxEY5Rk30BgcNvYbICvt2IqRM/bLeKC/wx1rsUkY=;
        b=LzLCHtIa3fLLoosEq+Dj4PoY/9DK/l5Oku6Iml6CsDBIQbZkKkwRVWDKWCknWqGb9h
         EMehI1VThWnlEjqXiMPr44jLs9/3iYY0i5sLOfFQk8DCDhOa4Mfe43yHNmBujPBxMhew
         v0HIHNfwSZQ1GBCUvxIBJnmocul1lq4X4QOZU=
In-Reply-To: <4E9C449D.2060907@tolaris.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Tyler J. Wagner" <tyler@tolaris.com>
Cc: =?UTF-8?B?TWFyY2luIE1pcm9zxYJhdw==?= <marcin@mejor.pl>, netfilter@vger.kernel.org


>> Hello,
>> i can't help you with "sorting problem" but i can see the real problem is
>> "i want to know which path will be used for given address ip". I suggest to
>> use iproute2, e.g.: ip r g <address_ip>
>> This is output:
>> # ip r g 4.5.6.7
>> 4.5.6.7 via 88.198.102.193 dev eth0  src 88.198.102.195
>>     
>
> To clarify, that's "ip route get <ip>". You can use shortcuts, but for
> examples for beginners that may not be wise.
>   
Yeah, I figured that one out. I use iproute2 to build my routing table, 
but never thought of using it to trace route paths as the "old" route 
was more convenient - to me anyway.

> Another reason to use iproute2 ("ip") is that "route" is deprecated, and
> cannot display all of the things iproute2 now reveals. Such as multiple
> routes, metrics, or sources (such as from zebra/quagga). Finally, "ip rule"
> helps you to see policy routes like source-based routing. "route" cannot do
> any of that.
>   
Yeah, that helped - thank you both! I think I also found a little 
discrepancy while executing "ip rule list <number>" (wrong syntax, 
obviously) - it shows me "'ip rule show' does not take any arguments." 
error message. Should that be ""ip rule list" does not take any 
arguments." instead?

I am still curious though why the sorting order in the old "route" has 
changed from one kernel version to the next?

