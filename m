From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: Re: router/firewall
Date: Fri, 2 Jul 2004 12:50:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040702125046.222b4c0f.leslie.polzer@gmx.net>
References: <a0f69e504070122354e2d19d5@mail.gmail.com>
	<200407020952.41515.Antony@Soft-Solutions.co.uk>
	<a0f69e504070203265f6fc9f8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e504070203265f6fc9f8@mail.gmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hello Askar,

On Fri, 2 Jul 2004 15:26:56 +0500
Askar Ali Khan <askarali@gmail.com> wrote:

> Ofcourse your contribution to this mailing list is greattt, no one but
> your there with solution to lot of ours problem :)
> heh i don't wana make your fly with all this sorta praises ;)
> /anthony blueshes
> ;)
Well, so I'm going to help out a bit now, too ;)

> its a very simple LAN :) what i want to do is instead of traffic for
> Internet goes from C------->A,       A--------->C
> its travel from C----->B------->A,                         A---->B----->C
> that only C uses the linux box as router/firewall, all the traffic
> from C first travel to B and then to A . :)
1) On C, set your default gateway to B's IP.
2) Turn on IP forwarding on B (IIRC it's /proc/sys/net/ip_forwarding)
3) See that B is accepting FORWARDing from C to A and back.

Only 3) is Netfilter stuff.

A small note: please quote only relevant parts next time; thanks.


Kind regards,

Leslie

