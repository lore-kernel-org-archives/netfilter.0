From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables carefully open the related-flow: ct state related ct
 helper "ftp-21" ...
Date: Tue, 9 Mar 2021 12:29:27 -0500
Message-ID: <38c1ab81-7034-2d63-08ce-4ae78f24f852@fhmtech.com>
References: <ae754fef-dbae-6a71-b7d5-b730bc21c363@hafenthal.de>
 <052d6523-bf4b-fadf-b95d-15bd63457cef@fhmtech.com>
 <1b961364-e014-57c9-5849-eb67c05b3a76@hafenthal.de>
 <5f52d13e-d135-7cb2-707f-2037ba041c87@fhmtech.com>
 <375f428e-f37b-551a-e09d-1024f00abb3d@hafenthal.de>
 <20210308210518.GC10808@breakpoint.cc>
 <624d2626-2fdc-a1d8-825c-81891488bf9d@hafenthal.de>
 <af7cddce-b8cf-1a01-1b71-130ea452c84b@fhmtech.com>
 <20210309172428.GF10808@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=2OJHcDWjutp5wsX434YVg9WGMJNwPpzw3FN4wXFRpXg=;
        b=MG84v32RkIV3yd2gvnDIOr8wqKZ/7QrO5aVor46WabHEfe6exrr+Z/HWcXqjYRWZ7k9+89D6160HQTENhWkZnHrEW0OM73SnldQes5SxULx4YuzVyrmXgoYlPpmKaSg0tZJjnraMI1LwjMGvj7ty3tmUDGhrm3eTVHoheP0oHaI=;
In-Reply-To: <20210309172428.GF10808@breakpoint.cc>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: Stefan Hartmann <stefanh@hafenthal.de>, "netfilter.org" <netfilter@vger.kernel.org>

On 2021/03/09 12:24, Florian Westphal wrote:
> Frank Myhr <fmyhr@fhmtech.com> wrote:
>> 1) I will look at the code, but am surprised that "ct helper" uses the
>> in-kernel name "ftp" rather than that of the stateful object "ftp-21" that
>> the ruleset goes to the trouble of explicitly defining.
>>
>> a) Is this simply a parsing artifact -- if the helper were called "abcd"
>> would the expression 'ct helper "abcd"' match it?
>>
>> b) If it is NOT a parsing artifact but by design: why? It would be more
>> intuitive to use the name of the explicitly-named helper object. Another way
>> to ask the same thing: why bother with the explicit helper object at all,
>> rather than just use "ftp" (which implies the ip & tcp protocols in "ftp-21"
>> definition anyway) in both match and statement, like 'ct helper set "ftp"'?
> 
> Its a design fuckup.  When I made the objref patches to attach the
> defined helpers I did not consider that we already had a 'ct helper'
> with existing behaviour.
> 
> The explicit helper objects were done this way to allow defining
> multiple helpers wuth different settings.
> 
> There are helpers that can be tuned by options and users might want to
> use different settings in each.

Got it. Thank you for very much for explaining the history and rationale.


>> 2) Does it make a difference whether 'ct helper set' is done in input (as in
>> below ruleset) or in prerouting? Maybe it has to be in prerouting only in
>> case of forwarded traffic?
> 
> It can be in input if the traffic is not forwarded.

Thanks for confirming. I'll make the wiki page more explicit on this point.

Best Wishes,
Frank
