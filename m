From: =?iso-8859-1?Q?Lo=EFc?= Minier <lool+netfilter@via.ecp.fr>
Subject: Re: Connections with SYN aren't NEW
Date: Sun, 14 Dec 2003 18:24:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031214172408.GC897@via.ecp.fr>
References: <20031214162315.GA897@via.ecp.fr> <200312141654.41489.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200312141654.41489.Antony@Soft-Solutions.co.uk>
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
To: Netfilter <netfilter@lists.netfilter.org>

Antony Stone <Antony@Soft-Solutions.co.uk> - Sun, Dec 14, 2003:

> What do you gain from having them match NEW, which isn't already true if =
they=20
> match --syn?

 Frankly speaking, I am not certain of the true benefits I will ever
 enjoy of forcing both NEW and --syn. But the topic of where to place
 the limit in the types of traffic you accept would be too much of a
 troll to discuss here... ;)
   I see the TCP flags and the conntrack as two different providers for
 the information "this is a new TCP connections". I think I should only
 believe a new connection takes place when both agree, because my goal
 is to stop suspicious traffic.

 As a dumb example of traffic I could reject with such a rule, I could
 take an injected SYN packet in the middle of a real TCP connection
 generating a tcp-reset and effectively closing the connection. This
 could be an efficient manner of closing a connection in a way which
 couldn't easily be seen. Call me paranoid, I prefer to call myself
 ignorant of what somebody could do if I don't disallow this :)

 Is this clear enough? or too far-fetched?

   Sincerely,

--=20
Lo=EFc Minier <lool@dooz.org>

