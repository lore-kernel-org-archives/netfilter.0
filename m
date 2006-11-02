From: "Yakov Lerner" <iler.ml@gmail.com>
Subject: Re: cooperation between connection tracking and traffic shaping
Date: Thu, 2 Nov 2006 22:02:15 +0200
Message-ID: <f36b08ee0611021202y54a25cc0s16a05ba6ae9b25db@mail.gmail.com>
References: <f36b08ee0611010211r598a4857u383de5d0c721887a@mail.gmail.com>
	<9151ac2a0611010221i3e062172pc9c6ee5e636b94b3@mail.gmail.com>
	<1162377918.18395.13.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1162377918.18395.13.camel@localhost>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Eric Leblond <eric@inl.fr>
Cc: Filip Sneppe <filip.sneppe@gmail.com>, netfilter@lists.netfilter.org

On 11/1/06, Eric Leblond <eric@inl.fr> wrote:
> Hi,
>
> Le mercredi 01 novembre 2006 =E0 11:21 +0100, Filip Sneppe a =E9crit :
> > Hi Yakov,
> >
> > On 11/1/06, Yakov Lerner <iler.ml@gmail.com> wrote:
> > > It worked. But I think it was ugly because:
> > >     (2) maybe there is a much easier way to achieve this
> > > qos-to-conntrack cooperation [than hacking conntrack modules] ?
> > >
> > Yes, the general way to do this, is to use the MARK target from
> > netfilter to mark the packets you want to QoS and then use the fwmark
> > from within your tc rules.
> >
> > That works without hacking any code. Note that the fwmarks can also
> > be used between netfilter and the advanced routing framework in the
> > Linux kernel (ip route, ip rule, etc.)
>
> Yes, but you have to use CONNMARK on top of that

And what's the solution for 2.4 ?

> to be able to put the
> mark on all packets of a connections. It also works with RELATED
> packets. This will be useful with SIP ...

Yakov

