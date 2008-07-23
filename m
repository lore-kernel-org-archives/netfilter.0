From: Patrick McHardy <kaber@trash.net>
Subject: Re: POM Xtables???
Date: Thu, 24 Jul 2008 01:21:04 +0200
Message-ID: <4887BCE0.2050902@trash.net>
References: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com>  <alpine.LNX.1.10.0806272003170.12725@fbirervta.pbzchgretzou.qr>  <4866F152.7030109@riverviewtech.net> <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com> <486907EA.60105@trash.net> <alpine.LNX.1.10.0806302218500.30639@fbirervta.pbzchgretzou.qr> <48694787.3080906@trash.net> <alpine.LNX.1.10.0807010907040.26892@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0807010907040.26892@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Dave <finalglide@gmail.com>, netfilter@vger.kernel.org

Jan Engelhardt wrote:
> Still had this in the Draft folder..
> 
> On Monday 2008-06-30 22:52, Patrick McHardy wrote:
>> Which rest? Is the list at the end of your mail complete?
> 
> Just contains those you have not yet rejected ;-)

Rejections are not necessarily permanent .. but they may require
some convincing. Sometimes the mind just changes over time and
sometimes a convincing argument that it won't make things worse
is needed.

Which is just a general comment, I can only partially remember
which ones I've rejected :)

>>> Hence I have taken up some and fixed them to be straight.
>>> Patrick, what's your judgment on the existing
>>> xt_{LOGMARK,TARPIT,TEE,condition,geoip,ipp2p} modules in xtables-addons?
>>>   
>> - LOGMARK - haven't seen it or can't remember
> 
> Prints everything that LOG is missing, like nfmark, ctmark, secmark,
> connection state, status. Quite useful when toying around with
> fwmark-based policy routing.

I believe we've discussed this already, just add it to the end
of the MARK output. That would also be most useful since thats
what people already use. ctmark would also be useful for nfnetlink.

>> - TARPIT - fine if remaining issues are fixed

I actually would be quite happy to merge this or help fix the
remaining issues since I know a lot of people use this for
spam trapping.

>> - TEE - same as TARPIT

This one as well (well, the packet duplication feature,
I'm not sure whether it also included some routing hacks).

>> - condition - undecided
>> - geoip - seems like a toy. Whats the use case?
> 
> Matching on countries and (possibly) blocking them. People have
> philosophized in the past whether (or not) it could use ipset;
> right now it uses a binary search over ipranges, which is at least
> a known good denominator.

Evgeniy submitted an updated version, I think we already discussed
everything there (IIRC you followed that discussion). A u32 based
replacement would be the preferred choice, and also a nice precedent
that not every userspace match necessarily needs a corresponding
kernel module.

>> - ipp2p - last version I've seen was a *horrible* mess, unless I'm
>> confusing it with the other l7 classifier module out there.
> 
> It was ugly from a codingstyle pov, which was fixed. It inspects
> packets 
> 
> xt_ipp2p I gave it some care and a cleanup. it also "works", that is, it 
> matches on bittorrent (something I could test), not all 
> (data) connections though, but I guess the control connections are in.

Just send it to netfilter-devel. If its the thing with lots
of hard-coded binary matches full of magic values I'm not
interested :) I'd be more interested in a discussion what
would be necessary to represent all those matches through
the FSM textsearch match or something similar.



