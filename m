From: "Jannes Faber" <jafaber@zonnet.nl>
Subject: Re: packets dropped when using MASQ and QUEUE
Date: Fri, 6 Sep 2002 18:37:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003101c255c3$bf468a10$3303a8c0@p951>
References: <m3znv08kup.fsf@isengard.firemission.org><008801c25446$89c61820$3303a8c0@p951> <m34rd43dag.fsf@isengard.firemission.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Mattias_R=F6nnblom?= <hofors@lysator.liu.se>
Cc: netfilter@lists.samba.org

I experimented again with the scripts I wrote to do this, but it really
doesn't work. If you NF_ACCEPT a packet without altering it, there is no
problem and the masquerading works ok. But as soon as you try to NF_ACCEPT
an altered packet it gets lost.

On the other hand when you send a packet to the box itself (so there is no
NAT), it works perfectly: including the altered packets.

I tried to refind the articles I read about it a few months back, but I
couldn't find them again.

I think what you need is a new target that can alter the packets in
kernel-space for you. Like the TOS target can alter the TOS bits, you need
something like a REPLACE target or maybe even a REGEXP target. There already
exists a string match extension (in patch-o-matic I think) that lets you
search through the packet contents, but as far as I know not something to
alter the packets.

Jannes Faber

From: "Mattias R=F6nnblom" <hofors@lysator.liu.se>


> "sufcrusher" <sufcrusher@zonnet.nl> writes:
>
> > I've had the exact same problem. I did a google search on this and found
out
> > pretty quickly that this is how it's supposed to be. For a really
technical
> > explanation you might want to do a google search yourself, but it comes
down
> > to the fact that the userspace program can only completely ACCEPT or
> > DENY/REJECT a packet. It can *not* let the packet continue traversing
the
> > chains/tables.
>
> Cannot continue traversing that particular chain (FORWARD, in my case),
> or any chain? My MASQ rules are on the POSTROUTING chain.
>
> And if it's a design flaw i QUEUE, how come it works for some of
> the packets, but not all?
>
> Kind regards,
>         Mattias
>
>



