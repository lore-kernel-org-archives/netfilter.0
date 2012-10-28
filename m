From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: New/Updated L7 netfilter  option - nDPI
Date: Sun, 28 Oct 2012 18:39:20 +0200
Message-ID: <508D5FB8.1080000@ngtech.co.il>
References: <5088717B.6080300@wildgooses.com> <1351412418.2740.5.camel@andylaptop> <508D5EA6.8040004@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <508D5EA6.8040004@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ed W <lists@wildgooses.com>
Cc: Andrew Beverley <andy@andybev.com>, netfilter@vger.kernel.org

On 10/28/2012 6:34 PM, Ed W wrote:
> Actually, just to augment my last answer.
>
> The biggest thing I pick out as "interesting" in nDPI is that it has a
> go at inspecting SSL traffic and odd sub protocols of http (eg Skype,
> Windows Update).  Given that we are rapidly seeing everything start to
> look like an HTTP protocol and then there is SSL on top, it's tricky to
> classify stuff like Skype or Facebook traffic.  nDPI can do this
> (although would benefit from more work in this area). So if your SSL
> certificate says mail.google.com, then you can guess the "protocol" in
> use...
>
> So if you want a one trick reason to try nDPI, right now you can use it
> to block/prioritise/time-restrict Skype... (or Windows Update, etc)
>
> I have a load of users on expensive satellite connections and I need to
> help protect them from themselves so being able to prevent Windows
> Update from banging 10MB down a $30/MB connection is very helpful.  I
> also use your squid patches to do sticky per user conntrack labelling of
> traffic and hence enabling users to choose a traffic profile (so they
> can choose to do the above if they really want to...)
>
> Cheers
>
> Ed W
Or just use WGET to download the internet into you LAN ;)

-- 
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
