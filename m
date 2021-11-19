From: John Marrett <johnf@zioncluster.ca>
Subject: Re: Issues with SIP NAT for SDP/RTP Addresses
Date: Fri, 19 Nov 2021 15:01:32 -0500
Message-ID: <CAAafysH1UOb+DiZ377WKZwfkcHPk6XjLF=T6YfU2+GHzaTavpw@mail.gmail.com>
References: <CAAafysFnkqNbhxc-FNibxUD4bfZkVC+DfCKJoG7dp4rUqo+F7g@mail.gmail.com>
 <CAAafysH=un8BVBM8aJ+JgeRLDJJXugb3FmLbYjQ-ZLOLSKg2dg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zioncluster-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=P9WJENNUso/ZPBGVSZ8J+CZrEE1e5OhZj5b/Zy49MKw=;
        b=bkfoaGc39Cu++jyDJRXJn6tzsGnEZFejFP/gpbfOfpzkn2zP8KUKqA39WvGb6OTgtK
         uOkt788gb1lGrMEGUnw3rUdCTKA7kS9JiXWX0GWQPpEHgVz0Kxzimfxxy51tOjeu7gJ1
         cp+or04V3LeMPFOaMfxuXPmVNLcRcIcpWyTaz+o408BLgbRGNxkpyQFnH6qlhiK6yd51
         2ppisSVjYIaLrpdQ9x7WP8UT5UzjINq0KUGgbMgWaWzrkekTnXeef9OjC30ZS6oLXPbR
         1Ar2OY4Xk0WY2FZSu7w9Yt9Fevkor5TeFKVYnDVkPnwDw5jUZi4FcsnW4rSk95NWRy0Y
         AQBA==
In-Reply-To: <CAAafysH=un8BVBM8aJ+JgeRLDJJXugb3FmLbYjQ-ZLOLSKg2dg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> I have made some more progress since I made this post last week. I set
> sip_direct_media to 0 (which indicates NAT should be performed for
> media streams which don't come directly from endpoints) and
> sip_external_media to 1 (I'm not clear on the purpose of this setting;
> reading the description of the git commit
> https://github.com/torvalds/linux/commit/a3419ce3 it appears to
> prevent NAT for traffic that transits the router and egresses on the
> same interface, this shouldn't be needed in my environment). With this
> configuration some of the IPs in the SDP traffic were NATed correctly.

With this configuration in place and after removing the additional
"media NAT" entries I had created I have my RTP sessions correctly
NATed. We discovered that a NGFW in another part of the network was
blocking some of the RTP traffic which caused some of our missing
media stream issues.

I'm not certain if sip_external_media should be required, this setting
appears to prevent NAT in a way that shouldn't be required in my
environment, however it didn't work in initial testing. This setting
may not be necessary.

We did encounter some issues with undirectional RTP streams for music
on hold but have seen this with other SIP hardware in the past. I may
document this issue in more detail in the future.

Is there a place I could record information about these settings and
my (limited) understanding of them, to help other people in the
future? It seems like they might be mentioned on this page
https://people.netfilter.org/chentschel/docs/sip-conntrack-nat.html
but that doesn't appear to be part of the regular netfilter
documentation.

-JohnF
