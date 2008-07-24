From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: POM Xtables???
Date: Thu, 24 Jul 2008 11:21:41 +0200
Message-ID: <488849A5.6050401@netfilter.org>
References: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com>	 <alpine.LNX.1.10.0806272003170.12725@fbirervta.pbzchgretzou.qr>	 <4866F152.7030109@riverviewtech.net>	 <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com>	 <486907EA.60105@trash.net>	 <alpine.LNX.1.10.0806302218500.30639@fbirervta.pbzchgretzou.qr>	 <48694787.3080906@trash.net>	 <alpine.LNX.1.10.0807010907040.26892@fbirervta.pbzchgretzou.qr>	 <4887BCE0.2050902@trash.net> <38bcb3ec0807240131n1f5d4051k9e89731aa2fcb6c9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <38bcb3ec0807240131n1f5d4051k9e89731aa2fcb6c9@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James King <t.james.king@gmail.com>
Cc: Patrick McHardy <kaber@trash.net>, Jan Engelhardt <jengelh@medozas.de>, Dave <finalglide@gmail.com>, netfilter@vger.kernel.org

James King wrote:
> On Wed, Jul 23, 2008 at 4:21 PM, Patrick McHardy wrote:
> 
>>>> - ipp2p - last version I've seen was a *horrible* mess, unless I'm
>>>> confusing it with the other l7 classifier module out there.
>>> It was ugly from a codingstyle pov, which was fixed. It inspects
>>> packets
>>> xt_ipp2p I gave it some care and a cleanup. it also "works", that is, it
>>> matches on bittorrent (something I could test), not all (data) connections
>>> though, but I guess the control connections are in.
>> Just send it to netfilter-devel. If its the thing with lots
>> of hard-coded binary matches full of magic values I'm not
>> interested :) I'd be more interested in a discussion what
>> would be necessary to represent all those matches through
>> the FSM textsearch match or something similar.
> 
> ipp2p is the one with hard coded magic values.
> 
> What are your feelings on the kernel version of l7filter (regex
> patterns loaded from the filesystem)?  Currently it requires a patch
> to add a structure to nf_conn, but I've been meaning to rewrite it to
> use ct_extend so that it could at least be included into xtables-addon
> and used with a stock kernel, although if there's interest in having
> it merged into mainline I'd be willing to focus on that.  One thing
> I'm not sure of is whether the license used by the Henry Spencer regex
> library it depends on is acceptable by kernel standards (or whether
> it's permissive enough to relicense under GPL, as IANAL).

If we want to do this in-kernel I think that it's better if it must use
the textsearch infrastructure. Probably it would require some patches to
extend the existing infrastructure.

The other choise is userspace by means NFQUEUE. If we use some
heuristics, we may try to classify the traffic by means of the initial
data packets and then mark the connection. Thus, the number of packets
that go to userspace would be small and the classification logic is
implemented in userspace using whatever regex
engine/aho-corasick/bit-wise/boyer-moore/bayes whatsoever...

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
