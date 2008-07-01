From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: POM Xtables???
Date: Tue, 1 Jul 2008 13:50:22 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807011346590.12878@fbirervta.pbzchgretzou.qr>
References: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com>  <alpine.LNX.1.10.0806272003170.12725@fbirervta.pbzchgretzou.qr>  <4866F152.7030109@riverviewtech.net> <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com> <486907EA.60105@trash.net>
 <alpine.LNX.1.10.0806302218500.30639@fbirervta.pbzchgretzou.qr> <48694787.3080906@trash.net> <Pine.LNX.4.64.0807011135120.30394@blackhole.kfki.hu> <4869FCE7.9000404@trash.net> <alpine.LNX.1.10.0807011326351.12878@fbirervta.pbzchgretzou.qr>
 <486A1865.40106@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <486A1865.40106@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Dave <finalglide@gmail.com>, netfilter@vger.kernel.org


On Tuesday 2008-07-01 13:43, Patrick McHardy wrote:
>> You only added the nfmark, and it is printed unconditionally at that,
>> the latter of which I do not see as thrilling. Seems like it is time
>> for a new revision? Also I think the two modules should be unified
>> first.
>
> It doesn't need a new revision, it doesn't affect the userspace
> API in any way. As for the argument of parsers that might not
> handle this: any parser needs to expect new things to be added
> at the end of the line, otherwise its giving us no possibility
> of ever extending the output, which is not reasonable.
>
That is why LOGMARK has been LOGMARK so far, where the (undocumented)
requirement is that parsers have to split at whitespace and may not
assume any particular order of fields. This allows to selectively log
things by means of flags passed in from userspace and thus sparing
syslog from being spammed with unwanted fields.
So the only way is to introduce a LOG2 target?
