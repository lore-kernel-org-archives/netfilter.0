From: =?iso-8859-1?Q?Lo=EFc?= Minier <lool+netfilter@via.ecp.fr>
Subject: Re: Connections with SYN aren't NEW
Date: Sun, 14 Dec 2003 17:59:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031214165943.GB897@via.ecp.fr>
References: <20031214162315.GA897@via.ecp.fr> <200312141634.54552.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200312141634.54552.Antony@Soft-Solutions.co.uk>
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

> So, if your HTTP client is just dropping a connection without closing it =

> nicely (using FIN, or even RST) then netfilter will think it is still=20
> ESTABLISHED.

 I should have written that the connection is closed nicely, with a FIN
 packet (I just re-checked). Please note that the conntrack keeps closed
 connection for a while exactly like a normal connection, and with the
 [ASSURED] flag but it adds a TIME_WAIT flag to closed connections.

> I don't know if this explains the problem you are seeing, but it's a reas=
on=20
> why netfilter may think the connection is in a different state than the=20
> client does.

 Yes, it could have been a good explanation.

--=20
Lo=EFc Minier <lool@dooz.org>

