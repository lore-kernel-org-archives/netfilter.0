From: "" <kfm@plushkava.net>
Subject: Re: Migrate ipsets to nftables
Date: Thu, 21 Jan 2021 12:06:38 +0000
Message-ID: <43938678-15a5-ac0b-ebab-4b9bd327e225@plushkava.net>
References: <520e46a0d20803c22d515aca5e8df7045ca09497.camel@lusan.id.au>
 <87122b3e-c40c-1df5-360c-4298cdff509d@plushkava.net>
 <e75a9fa70660560f33b43ce654395f94e899d380.camel@lusan.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=6
        pjQhdeYmRVVw/T8XjEuO8VDQyjTdEl+rUck5wVqd1c=; b=IQ/kn4kjIuYxkCf7g
        0rSQIE2IVpBqWIvYNcBlnxtldFNMbdSX7VAkLsidYevGloshUGdqvTtOlZZquQKP
        Z2Lvi5YrzxBZsaVZB58CGr+nNWS2B6iuJDQo6AjIuUe6rYPqyJRIwKWrtFIwV+BQ
        Mylajca1oNxfJB1cfk7i3dILpTQlUt21YZp7ph8i2GLuRNQyYrMOMnpLImPjzin6
        a2f/r5a8aH+K5eM44T36LMyOmNYjvdenG2ss2YqunchtWy+hFnFvHu94isoCQM/1
        mPhUsqvVJVETVd/DXNYxHsWipRqRA+Q8XU21pTJIMo5aN8YWWWrZoidAS8/Rwb7J
        t06Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=6pjQhdeYmRVVw/T8XjEuO8VDQyjTdEl+rUck5wVqd
        1c=; b=H45C0tf4vrTOtr3P/f9cYYil+Z2zILOh6peESoMLRO6rxEmK5WfZNepEw
        lQ/kGu2bhT81OYLqMfJfBV1C3zD49k1C8hi2AZC16F/bAdGKLRPc+EVjBJRiU/6B
        2Jt9fcf5zMb2Gq+Fj8VbOVgIfV5bO7iMdCddIcKQpqI1xNO/8BJ/ANSBa/t+ZwC6
        nj6+uwHvwsBTBMGphirGumuvcldWTd0+cXQyHtRU9EFAUL2ARblEUMTTGJVguWrs
        MjqERtuq1sK4UjzfqFEm9pxQJi9YNJ4eie+wVuBBhNFm0sKLgKus9eaQCvKC7/CJ
        teG4vKfJfo6mvgvjXlg/Yt4xqv8pg==
In-Reply-To: <e75a9fa70660560f33b43ce654395f94e899d380.camel@lusan.id.au>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: nikolai@lusan.id.au, netfilter@vger.kernel.org

On 21/01/2021 10:18, Nikolai Lusan wrote:
> Hi,
> 
> Basically I have a handfull of custom sets, the small ones are easy
> enough to transition in nft - and they remain fairly static - the
> larger ones (some contain networks, some IPv4/6 hashes) are cumbersome
> at best to re-create ... currently I have been using ipset-save to put
> all the sets into a file which is used to rebuild the sets when needed,
> or on reboot. Some of the larger sets have thousands of IP addresses in
> them, so sticking them in the standard nftables.conf file is unsightly
> and unreadable at best.

Ah, I see. Indeed, I can fully understand the desire not to clutter the 
primary ruleset file with large sets whose contents would normally 
remain out of sight and mind. The following approach is by no means 
perfect but might be acceptable.

   • use "list set" to dump the sets into individual files
   • have nftables.conf import these files with include directives
   • use the -n option in the case of "list ruleset"

Note that the include directive supports simple globbing, so you may do 
such things as include "/etc/nftables.d/*.conf" or include 
"/etc/nftables.d/bogons[46].conf".

In the case of scripts that are used to dynamically create and/or update 
sets, they may execute "list set" commands to re-generate the relevant 
files that are the subject of any include directives. For instance, 
consider the following excerpt from one of my shell scripts.

   # Atomically flush and populate the set, efficiently
   {
     echo "flush set $table $setname"
     echo "add element $table $setname { "
     tr '\n' ',' < "$tmpfile"
     echo " }"
   } | nft -f - || exit

   # Stash the updated set for later inclusion
   nft -s "list set $table $setname" \
     > "/etc/nftables.d/set-$table-$setname.conf"

There are some potential annoyances. In particular, it would be 
necessary to ensure that the OS does not attempt to save the ruleset 
upon stopping the the service that is responsible for ruleset loading 
and persistence. Otherwise, it will flatten the ruleset, losing the 
include directives. The same consideration applies in the case that you 
want to re-generate the primary ruleset file by running "list ruleset" 
manually.

-- 
Kerin Millar
