From: Wei Huang <daviseago@gmail.com>
Subject: Re: Which one is chosen on multiple default gateway set?
Date: Thu, 23 Aug 2012 15:30:21 +0800
Message-ID: <CAJPS4yZ-dO7Jau6R1V=jBh9xHWjfA-PaiURGzjtGo8TwmDcjSA@mail.gmail.com>
References: <CAJPS4yY7sqqsOfhiouqjmfuW3Kof-ZzHEBs9E1+QoYYce01U4Q@mail.gmail.com>
	<20120822.233808.1184757734447108096.davem@davemloft.net>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=oVONfWWwjxycjXwWbhKrVmB0SVi7dnxm6lQd2CVU3zo=;
        b=WQq9mpHqmDP++UwN4XqQRB7nLKg1/c5Viu8l3os2prOi5kkJOCiIQOoX/9+VoN34/e
         ZA/rkyTMqixhUI5ytEGWLPnY+uuNejbyZqEEQNxDk958U1KhiDvh0grawRhO1qntJ8u8
         lW1CjJn4MxEGftrPuSDIIf5zfWV0B/Ym8I2vVu89b+HrNv++eHW4EOpBtrAiw1NFw43O
         yNhloHNPQnhJ2TZjmR9X81HQ7wQ/3YkM4K4X6JCpKYSFSvmYyPaJ/efMcMzpbjVdekYV
         VOF8mT5Vk8tT2M3MVFslNGZAuMwgU6rpd4gVVikbTimlUQAVHz4DH+XbMvPfe+F5GZQi
         8ixQ==
In-Reply-To: <20120822.233808.1184757734447108096.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, netfilter@vger.kernel.org

On Thu, Aug 23, 2012 at 2:38 PM, David Miller <davem@davemloft.net> wrote:
> The problem is that when a nexthop becomes unresponsive we need
> to wait for an event to timeout the routing cache entry.
>
> In 3.6.0-rc1 and later, this inconsistent behavior will happen less
> often, because the routing cache has been removed so we will do the
> full default route resolution on every route lookup.  The only problem
> at that point is socket cached routes, those will still need to wait
> for a timeout before the next default gateway will be tried.

Thanks a lot, David!

I'm using 2.6.16. Could you tell me where the code is, that detects
nexthop unresponsive, sends an event, and timeout the cache? Or are
there procs or sysctl to adjust the timer values?

Another thing I found is that the route looking-up seems to update the
routing cache entry. Is that true? In my example in the first mail,
after a while, the default gateway should have been switched to the
second one. If I ping 8.8.8.8 then, the second active gateway should
be used. But instead, if I look for the route first with "ip r get
8.8.8.8", the first inactive gateway will be the result, and it will
be used if I ping now.
Will the route looking-up even influence the behavior? Will there be a
work around way for this?

Thanks,
Wei
