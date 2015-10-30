From: =?ISO-8859-15?Q?Martin_Gr=F6ger?= <mgroeger1@web.de>
Subject: Re: nftables: bridge filter with queue to userspace
Date: Fri, 30 Oct 2015 08:16:21 +0100
Message-ID: <56331945.1080804@web.de>
References: <56328E60.4040002@web.de> <20151029221138.GA3447@salvia> <20151029222303.GF18062@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20151029222303.GF18062@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org, bernhard.thaler@wvnet.at


Am 29.10.2015 23:23, schrieb Florian Westphal:
> Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> [ CC Bernhard ]
>
>> On Thu, Oct 29, 2015 at 10:23:44PM +0100, Martin Gr=F6ger wrote:
>>> I'm trying to build a transparent filter with application level fil=
tering.
>>> First experiment with ip and output hook and queue to userspace was
>>> successful. Then I changed to bridge filtering with forward hook. W=
ith
>>> counter action I see that the packets match the rule, but the queue=
 to the
>>> usersapce doesn't work.
>>>
>>> Am I right, that this fuction should work?
> nfqueue backend only works with NFPROTO_IPV4 and _IPV6 at the moment,
> i.e. nft ip and nft ip6, or via bridge_netfilter hack (which 'pushes'
> packets though ipv4/ipv6 netfilter hooks).
Ok, this explains why my experiment with ip work, but not the one with=20
bridge family.

>
>> Florian told me he will come up sooner or later with native queue
>> support for nft (ie. no bridge_netfilter required anymore).
> Argh.  I'm a moron and forgot about this.
How does a native (indepent on bridge) queue support should work ?
>
> I still have the q&d hack that makes it work but no reroute (re-bridg=
e,
> cough) support, just dump-to-userspace.
As far as I understand this would be sufficient for my usecase, since I=
=20
want simply to inspect the packets and then decide to accept or drop th=
em.

>
> Bernhard, did you have time to work on this?
>
> If not, I think I can make time available soon since the other work
> (nft bridge conntrack, nf netns hook stuff) is delayed at the moment
> anyways.
>
Would be great, if you can help me!

