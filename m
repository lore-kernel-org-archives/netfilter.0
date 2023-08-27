From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Extending an IPv4 filter to IPv6
Date: Sun, 27 Aug 2023 19:20:45 +0200
Message-ID: <279a392a-31e0-cfcb-3d28-d0bca7c239ea@tana.it>
References: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
 <ZOKIl6qWCdLCTPPT@calendula> <29680eb6-1004-f1af-38bb-f9da49712d58@tana.it>
 <ZOO2q6mJZQZR+QM7@calendula> <b736646f-016d-3775-fa06-2babf1612dc1@tana.it>
 <ZOsKgctjEQWSARet@slk15.local.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=tana.it;
        s=epsilon; t=1693156846;
        bh=XE5oUcgilNZkkAAQYYyGJeyujb0Xw8XIkMjE0e6k22M=;
        h=Author:Date:Subject:To:References:From:In-Reply-To;
        b=Xum5aTmPmADhUK2C4oFMVTZEvgIgZePO2Vr7+IzEroDMzCsxULPbe/IHsOjW1CZor
         TMjwf/8ATzEn0kr8MDwBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1693156846; bh=XE5oUcgilNZkkAAQYYyGJeyujb0Xw8XIkMjE0e6k22M=;
        h=Date:Subject:To:References:From:In-Reply-To;
        b=Bdp92MxeERKoB2aG/GKEGX/wnYxI6tMARd2EFaPHz15XgFXVNh+Y0Pt8gv15It3iB
         0azHtOhFjbZ0qvNS/BnrPhVXJafBtRUIKeq+n+go7PEVqHWNMpPLEJEA0xkCvdW8wv
         Gc+dAYK3rv+0NF6h32Z905RUQBCvG7luMsw24VYWlWDvN+CaHz4JDTZn3MX3s
Subject: Re: Extending an IPv4 filter to IPv6
Content-Language: en-US, it-IT
In-Reply-To: <ZOsKgctjEQWSARet@slk15.local.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On Sun 27/Aug/2023 10:34:09 +0200 Duncan Roe wrote:
>> It seems a buffer can contain several packets.  Is that related with the
>> queue maxlen?
>>
> man 7 netlink will tell you that netlink messages may be batched.


Thanks for the pointer, I hadn't noticed it.


> This is straightforward to observe in a libnetfilter_log program under gdb. >
> However libnetfilter_queue programs never get batched netlink messages. So the
> callback isn't strictly necessary but it would mean extra code to special-case
> libnetfilter_queue (among all the other netfilter libraries) so it's been left
> there.
> 
> If you rely on this behaviour it might be prudent to check that bytes read ==
> *(struct nlmsghdr *)buf.nlmsg_len.
>
>>> You can obtain the packet payload length via:
>>>
>>>           len = mnl_attr_get_payload_len(attr[NFQA_PAYLOAD]);
>>
>> And this should be the length specified with NFQNL_COPY_PACKET (or less), correct?
>>
> You can check for packet truncation by checking `len` above against what you
> actually received.


I'll try.  However, I'd never know if my test conditions equal what can happen 
at runtime.  As I only look at addresses, it's fine to truncate packets at that 
length.

I just want to minimize memory footprint, but without hampering performance.


Thanks
Ale
-- 




