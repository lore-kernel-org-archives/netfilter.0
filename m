From: Patrick McHardy <kaber@trash.net>
Subject: Re: POM Xtables???
Date: Tue, 01 Jul 2008 13:43:33 +0200
Message-ID: <486A1865.40106@trash.net>
References: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com>  <alpine.LNX.1.10.0806272003170.12725@fbirervta.pbzchgretzou.qr>  <4866F152.7030109@riverviewtech.net> <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com> <486907EA.60105@trash.net> <alpine.LNX.1.10.0806302218500.30639@fbirervta.pbzchgretzou.qr> <48694787.3080906@trash.net> <Pine.LNX.4.64.0807011135120.30394@blackhole.kfki.hu> <4869FCE7.9000404@trash.net> <alpine.LNX.1.10.0807011326351.12878@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0807011326351.12878@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Dave <finalglide@gmail.com>, netfilter@vger.kernel.org

Jan Engelhardt wrote:
> On Tuesday 2008-07-01 11:46, Patrick McHardy wrote:
> 
>> Jozsef Kadlecsik wrote:
>>> On Mon, 30 Jun 2008, Patrick McHardy wrote:
>>>
>>>> - LOGMARK - haven't seen it or can't remember
>>> It adds the possibility to log the mark values of the packet/corresponding
>>> conntrack entry via syslog. 
>>> The feature should simply be added to the LOG target, there's no real point
>>> to keep a separated target, as far as I see.
>> I agree. In fact I already added this to ipt_LOG/ip6t_LOG in
>> 2.6.26-rc :)
> 
> You only added the nfmark, and it is printed unconditionally at that,
> the latter of which I do not see as thrilling. Seems like it is time
> for a new revision? Also I think the two modules should be unified
> first.

It doesn't need a new revision, it doesn't affect the userspace
API in any way. As for the argument of parsers that might not
handle this: any parser needs to expect new things to be added
at the end of the line, otherwise its giving us no possibility
of ever extending the output, which is not reasonable.

