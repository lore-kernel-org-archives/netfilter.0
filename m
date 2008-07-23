From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: POM Xtables???
Date: Wed, 23 Jul 2008 22:19:30 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807010907040.26892@fbirervta.pbzchgretzou.qr>
References: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com>  <alpine.LNX.1.10.0806272003170.12725@fbirervta.pbzchgretzou.qr>  <4866F152.7030109@riverviewtech.net> <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com> <486907EA.60105@trash.net>
 <alpine.LNX.1.10.0806302218500.30639@fbirervta.pbzchgretzou.qr> <48694787.3080906@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48694787.3080906@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Dave <finalglide@gmail.com>, netfilter@vger.kernel.org


Still had this in the Draft folder..

On Monday 2008-06-30 22:52, Patrick McHardy wrote:
>
> Which rest? Is the list at the end of your mail complete?

Just contains those you have not yet rejected ;-)

>> Hence I have taken up some and fixed them to be straight.
>> Patrick, what's your judgment on the existing
>> xt_{LOGMARK,TARPIT,TEE,condition,geoip,ipp2p} modules in xtables-addons?
>>   
>
> - LOGMARK - haven't seen it or can't remember

Prints everything that LOG is missing, like nfmark, ctmark, secmark,
connection state, status. Quite useful when toying around with
fwmark-based policy routing.

> - TARPIT - fine if remaining issues are fixed
> - TEE - same as TARPIT
> - condition - undecided
> - geoip - seems like a toy. Whats the use case?

Matching on countries and (possibly) blocking them. People have
philosophized in the past whether (or not) it could use ipset;
right now it uses a binary search over ipranges, which is at least
a known good denominator.

> - ipp2p - last version I've seen was a *horrible* mess, unless I'm
> confusing it with the other l7 classifier module out there.

It was ugly from a codingstyle pov, which was fixed. It inspects
packets 

xt_ipp2p I gave it some care and a cleanup. it also "works", that is, it 
matches on bittorrent (something I could test), not all 
(data) connections though, but I guess the control connections are in.
