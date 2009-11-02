From: Patrick McHardy <kaber@trash.net>
Subject: Re: Multiple nf_bind_pf to the same protocol
Date: Mon, 02 Nov 2009 16:30:43 +0100
Message-ID: <4AEEFB23.407@trash.net>
References: <87iqdtnetv.fsf@isengard.friendlyfire.se>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87iqdtnetv.fsf@isengard.friendlyfire.se>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-15?Q?Mattias_R=F6nnblom?= <hofors@lysator.liu.se>
Cc: netfilter@vger.kernel.org

Mattias R=F6nnblom wrote:
> Hi,
>=20
> with NFQUEUE and the libnetfilter_queue library, is it possible to
> bind several applications to same protocol (for example, AF_INET)?
>=20
> That would be useful if you want to do load balancing on a multicore
> system, with a thread/process serving each NFQUEUE queue.
>=20
> After having a brief look at the NFQUEUE/libnetfilter_queue code, it
> looks like there's only single netlink fd for all queues, and the
> library does the demultiplexing. Would that mean I have to have a
> "front-end" thread distributing different servering threads?

You can bind them to different group numbers for the same AF.
The latest version of the NFQUEUE target even supports automatic
balancing between those groups based on a simple flow hash.
