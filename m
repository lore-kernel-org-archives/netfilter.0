From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: Is this conntrack behaviour correct? Aka. Stealing services...
Date: Fri, 04 Jun 2004 14:30:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086352205.1799.44.camel@nienna.balabit>
References: <BDEHJGPIKNLKJJBCCFPLIEGLCOAA.Markus.Schaefer@epygi.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BDEHJGPIKNLKJJBCCFPLIEGLCOAA.Markus.Schaefer@epygi.de>
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
To: Markus Schaefer <Markus.Schaefer@epygi.de>
Cc: netfilter@lists.netfilter.org


  Hi,

2004-06-04, p keltez=E9ssel 13:15-kor Markus Schaefer ezt =EDrta:
> Short questions for the impatient:
>   - Why is netfilter using a port for NATing,
>     even though the very same port is reserved
>     by the router device though a listening socket,
>     (but "free" from view of conntrack table.)

  Because it wouldn't be a trivial task to assign every new connection
to an opened socket. Netfilter conntrack and NAT works strictly _below_
the IP layer, where these kind of lookups are not yet done.

>   - I need a way to reserve a certain touple in
>     the conntrack table. Or
>   - prevent a fixed touple from being used.
>     (I know, it sounds strange but i need it :)

  Although I don't know of an existing iptables-level solution, I've
implemented the nat-reservations patch (it's in POM-NG) exactly because
of the same problems. However, this is only a low-level (in-kernel, only
for Netfilter extensions) interface for reserving tuples, you cannot use
that directly from iptables. And yes, I agree, sometimes it would be
useful to define such reserved tuples in your ruleset.

--=20
 Regards,
   Krisztian KOVACS


