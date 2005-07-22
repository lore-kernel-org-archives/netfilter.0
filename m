From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: why isn't masquerade working?
Date: Fri, 22 Jul 2005 00:59:31 -0400
Message-ID: <65aa6af905072121592a7393b@mail.gmail.com>
References: <65aa6af9050721190612c5cbf2@mail.gmail.com>
Reply-To: Edmundo Carmona <eantoranz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af9050721190612c5cbf2@mail.gmail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have been doing some reseach.

As both links are present in the same network, it's making the kernel
(IPROUTE?) get confused, apparently, about the address it has to stamp
on the outgoing packet, because of a tp_filter.

I tried with SNAT, and echoing 0 on that flag of the "unused link"
where I want to send traffic through... but It's still not working.

This kind of problems can be so annoying.

On 7/21/05, Edmundo Carmona <eantoranz@gmail.com> wrote:
> This is the first time I ever see this kind of problem... maybe it's
> because I have such a weird configuration right now.
>=20
> I'm testing a host with two internet connections.
>=20
> the default route is only one of the two connections. The other link
> is not involved at all. However, I set a rule in OUTPUT mangle that
> will mark icmp traffic and then I have an ip rule that forces it to
> use a routing table that is configured to use the "unused link".
>=20
> I thought that it meant that icmp would come out from that interface..
> and as I am masquerading traffic through that interface, the src
> address would be set to that interface's address.
>=20
> It's a BIG surprise to see that it's not happening.  I tcpdumped
> traffic and noticed that traffic is coming through the unused
> interface... but still has the src address of the other interface. Is
> that normal?
>=20
> And how can I make it to use the "correct" address?
>

