From: Robert White <rwhite@pobox.com>
Subject: Re: Hairpin NAT - possible without packet marking?
Date: Sat, 8 Jul 2017 21:55:15 +0000
Message-ID: <44043c5f-748e-c943-f40b-70d1c16e15f7@pobox.com>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
 <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
 <ea023673-d0c6-f8d8-0399-203a71e7fa62@trustiosity.com>
 <6773e78c-f0e6-508d-0a72-d5880705756d@pobox.com>
 <a3219c0b-2e2e-74d3-ae9b-88ec6ff35810@trustiosity.com>
 <1402388a-fb32-d7af-bc3a-6f25b8a2f47a@pobox.com>
 <50f20723-a7c5-3130-9319-cb5ebec7f7c3@trustiosity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50f20723-a7c5-3130-9319-cb5ebec7f7c3@trustiosity.com>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zrm <zrm@trustiosity.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 07/08/2017 07:54 PM, zrm wrote:
> On 07/03/2017 09:14 PM, Robert White wrote:

> I looked into that at one point for other reasons, but it won't
> translate ports, and according to the man page ip-route nat seems to
> have been removed anyway.

man ip-rule

Stateless nat is a rule not a route. You end up needing both the rule
and some route stuff to make it work.

And being "stateless" it, indeed, cannot track packet mappings as
knowing what to do to ports on the return path requires state.

> My argument is that public is not particularly rare or special.
> 
> It can make sense to e.g. isolate finance from advertising. And if there
> isn't any _reason_ for the web server to talk to the finance systems
> then by all means isolate them from each other too.
> 
> You're probably right that a public server is more likely to be
> compromised than an equally well maintained internal server, but it
> doesn't fare so well compared to _user devices_.
> 
> A random laptop is already exposed to browser vulnerabilities, email
> attachments, third party wifi, etc. If it becomes "public" due to a port
> mapped for VoIP or similar, that is not going to change the security
> posture significantly. A non-zero number of the devices are likely to be
> infected regardless and the same precautions should be taken either way.
> 
> So if the traditional model was to separate public servers from internal
> servers and user devices and then lock down the public servers, I would
> argue a better model is to separate public servers and user devices from
> internal servers and then lock down the internal servers.

You mistake a design to prevent network intrusion as if it were offered
as panacea.

It is always wrong to discard good design because it only covers what
it's designed to cover.

So yes, you need to have other protections from other sources of
compromise, but other sources of compromise aren't at issue in the
material being addressed.

I already mentioned leaving CDROMS and thumbdrives lying around, and
other issues as very good attacks.

Also in the news: techniques to minimize heart disease may not be
applicable to liver flukes...

So describing "The traditional model" as you have misses and
oversimplifies and conflates too much to be anything other than a straw
man because your "if the traditional model is" predicate doesn't
actually describe the traditional model correctly.
