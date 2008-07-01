From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: POM Xtables???
Date: Tue, 1 Jul 2008 13:38:07 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807011326351.12878@fbirervta.pbzchgretzou.qr>
References: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com>  <alpine.LNX.1.10.0806272003170.12725@fbirervta.pbzchgretzou.qr>  <4866F152.7030109@riverviewtech.net> <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com> <486907EA.60105@trash.net>
 <alpine.LNX.1.10.0806302218500.30639@fbirervta.pbzchgretzou.qr> <48694787.3080906@trash.net> <Pine.LNX.4.64.0807011135120.30394@blackhole.kfki.hu> <4869FCE7.9000404@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4869FCE7.9000404@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Dave <finalglide@gmail.com>, netfilter@vger.kernel.org


On Tuesday 2008-07-01 11:46, Patrick McHardy wrote:

> Jozsef Kadlecsik wrote:
>> On Mon, 30 Jun 2008, Patrick McHardy wrote:
>> 
>> > - LOGMARK - haven't seen it or can't remember
>> 
>> It adds the possibility to log the mark values of the packet/corresponding
>> conntrack entry via syslog. 
>> The feature should simply be added to the LOG target, there's no real point
>> to keep a separated target, as far as I see.
>
> I agree. In fact I already added this to ipt_LOG/ip6t_LOG in
> 2.6.26-rc :)

You only added the nfmark, and it is printed unconditionally at that,
the latter of which I do not see as thrilling. Seems like it is time
for a new revision? Also I think the two modules should be unified
first.

LOGMARK was also instantiated on January 30 already, so that's
prior art here :)
