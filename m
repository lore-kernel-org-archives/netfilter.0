From: Alexander Meinhardt <alexander.meinhardt@gmail.com>
Subject: Re: nftables: response of nft is rising
Date: Sun, 23 Apr 2017 21:12:41 +0200
Message-ID: <CAB_+ZOs_ADFPfWZN1QZEur8_yeU7d+e9qoHADUtrNt+T65=9Yw@mail.gmail.com>
References: <CAB_+ZOv_5-Zq94ZczEMn4ThnXn6G4+QS0HQPqO1WapsqN6n4uA@mail.gmail.com>
 <02882758-b8f8-417b-8244-356426c55c5d@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=r1/wWp+iqRLSvMdeMK6tALNKT8fgZ0ygTQYM2EUbPVw=;
        b=oqeC8eLiAMlb9GXEJxiSWr9wLscm+cD27tI8HeAGmcQRe3H9yIU4qP7xiAeYtHg9bU
         tQ5ZjJG0N5Xo9o7GPoQiuttUPKYZz955csMVLtYJJqQvKexve+HcTpsbutwcZIw5JqA7
         gHSRpNGcij6PzTIBhFAHGrNoyawUBKl63K3QN8xeQeTJ4u0gQJwenAE/RcG9wLmshmZR
         oMiXzSebSPbEJ7s47Wrmb6kQ1Jgv7BXUI90dtMgouRkne/zW2hcvSbte7qfnF/Kr027S
         5oKT+CAe7nzseduIk87JLjc13rtu9nprRfPhdcFXDKzCzXCfFkih4ODymlylls6brvr3
         Z+/Q==
In-Reply-To: <02882758-b8f8-417b-8244-356426c55c5d@pobox.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert White <rwhite@pobox.com>
Cc: netfilter@vger.kernel.org

On Sun, Apr 23, 2017 at 4:36 PM, Robert White <rwhite@pobox.com> wrote:
> Is this day-one size or end-of-test size? e.g. are you saying you see
> the sets with 706 entires to start, or that you start empty and
> accumulated 506 entries? (or is it some other scenario

The ruleset ist starting with empty sets.
Each set is filled dynamically by fail2ban and myself by investigating logfiles.
If elements are added by fail2ban, they get removed after a specific
bantime (mostly 30 days)
If i add myself some elements, they are blocked permanent.

> Aside from being potentially interesting, why do you care?
>
> This isn't a snarky question, are you seeing some other performance
> issues, like with actual packet clearing rates, or are you just noticing
> that the ruleset dump is taking longer?

Because the response-time of the "nft"-command is rising, the time
will come (perhaps after 20 days+-),
when it takes more than 60 seconds. fail2ban gets a timeout when
adding elements than.
Attackers wouldn't be blocked anymore.

Beside this, i couldn't clear/save/flush anything in nftables anymore.
The whole backend is blocked of freezed, but intact.

> I'm pretty sure you are experiencing the normal effects of the context
> switches required to get the set members out of the kernel one element
> at a time. I don't see a bulk unload operation in the module operations
> structure so the enumeration time for extracting large sets might take a
> lot of time. Enumerating a set is way different that checking for
> membership.

Possbile, but i never recognized this heavy increasing time with kernel-4.4.6.
So i thought about a memory leak or something like that?

> So if you dump the ruleset and then reload what you just dumped, does it
> take the same, more, or less time to dump the ruleset a second time?

As i wrote above, when i dump the ruleset by restarting nftables
(/etc/init.d/nftables restart), it first save the ruleset,
clear the ruleset and reload the ruleset. The response-time is than reset.
That means, loading the ruleset with approx 800 elements (over all
sets) doesn't take any effect of the response-time of nft?

It's a kind of memory leak or so?

--
Regards
Alex
