From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: POM Xtables???
Date: Tue, 1 Jul 2008 16:30:15 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807011629390.12878@fbirervta.pbzchgretzou.qr>
References: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com>  <alpine.LNX.1.10.0806272003170.12725@fbirervta.pbzchgretzou.qr>  <4866F152.7030109@riverviewtech.net> <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com> <486907EA.60105@trash.net>
 <alpine.LNX.1.10.0806302218500.30639@fbirervta.pbzchgretzou.qr> <48694787.3080906@trash.net> <Pine.LNX.4.64.0807011135120.30394@blackhole.kfki.hu> <4869FCE7.9000404@trash.net> <alpine.LNX.1.10.0807011326351.12878@fbirervta.pbzchgretzou.qr> <486A1865.40106@trash.net>
 <486A39BF.4090206@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <486A39BF.4090206@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Tuesday 2008-07-01 16:05, Grant Taylor wrote:

> On 07/01/08 06:43, Patrick McHardy wrote:
>> As for the argument of parsers that might not handle this: any parser needs
>> to expect new things to be added at the end of the line...
>
> *LOL*
>
> Now you are expecting people to do what they should verses what is easy.
>
> Unfortunately, what is considered best practice (at the time) is not followed
> often enough.
>
> (Joke)  Why don't we just log in XML and parse it out later.  :P~

Why don't we just rip out LOG and instead force users to use NFLOG,
then all these things are hidden and they control how nflogd
outputs it. Hm?
