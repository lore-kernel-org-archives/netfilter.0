From: Patrick McHardy <kaber@trash.net>
Subject: Re: POM Xtables???
Date: Mon, 30 Jun 2008 22:52:23 +0200
Message-ID: <48694787.3080906@trash.net>
References: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com>  <alpine.LNX.1.10.0806272003170.12725@fbirervta.pbzchgretzou.qr>  <4866F152.7030109@riverviewtech.net> <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com> <486907EA.60105@trash.net> <alpine.LNX.1.10.0806302218500.30639@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0806302218500.30639@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Dave <finalglide@gmail.com>, netfilter@vger.kernel.org

Jan Engelhardt wrote:
> On Monday 2008-06-30 18:20, Patrick McHardy wrote:
>   
>>> 3) Still don't know where Xtables-addons fits in with Netfilter?  Why
>>> is Xtables not on the Netfilter site or even mentioned there at all?
>>> What does the core Netfilter team think of Xtables-addons?
>>>       
>> I have no opinion about this except that already mentioned by
>> Jan: useful patches in proper state should be upstream, all
>> others I don't care about.
>>     
>
> Well at least I want to give it some care. POM, and Xtables-addons
> exist because modules were rejected upstream.
> ...
> - the rest: dunno?
>   

Which rest? Is the list at the end of your mail complete?

>>> 6) Currently the extensions and patching systems seems to be a
>>> hodge-podge of items, all with different web sites, maintainers and
>>> writers, from a newbie perspective it's confusing, would be nice if it
>>> was wrapped up into something more straitforward. Hopefully this is
>>> what Xtables-addons is doing, BUT would be really nice if this all
>>> started officially at Netfilter.org.
>>>       
>> Short answer - don't do it, the module provided by the kernel
>> should be enough for 99.99% of all cases. If it isn't, convince
>> us to merge the patch, which usually isn't very hard.
>>
>> History has repeatedly shown that out of tree patches are buggy
>> and cause more problems than they solve, which is why there
>> is no interest from the netfilter team in maintaining external
>> patches.
>>     
>
> Hence I have taken up some and fixed them to be straight.
> Patrick, what's your judgment on the existing
> xt_{LOGMARK,TARPIT,TEE,condition,geoip,ipp2p} modules in xtables-addons?
>   

- LOGMARK - haven't seen it or can't remember
- TARPIT - fine if remaining issues are fixed
- TEE - same as TARPIT
- condition - undecided
- geoip - seems like a toy. Whats the use case?
- ipp2p - last version I've seen was a *horrible* mess, unless I'm
  confusing it with the other l7 classifier module out there.


