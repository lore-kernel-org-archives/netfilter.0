From: =?ISO-8859-1?Q?Ren=E9_Gallati?= <draxinusom@gmail.com>
Subject: Re: is NOTRACK modules the only way to avoid connection tracking?
	(fwd)
Date: Wed, 9 Feb 2005 14:07:25 +0100
Message-ID: <50f03b9705020905074800433f@mail.gmail.com>
References: <Pine.GSO.4.33.0502090846230.22322-100000@indigo>
Reply-To: =?ISO-8859-1?Q?Ren=E9_Gallati?= <draxinusom@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.GSO.4.33.0502090846230.22322-100000@indigo>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Alexander Piavka <piavka@cs.bgu.ac.il>
Cc: netfilter@lists.netfilter.org

On Wed, 9 Feb 2005 08:47:41 +0200 (IST), Alexander Piavka
<piavka@cs.bgu.ac.il> wrote:
> On Mon, 7 Feb 2005, Samuel Jean wrote:
>=20
> > On Mon, February 7, 2005 7:00 am, Alexander Piavka said:
> > >
> > >  Hello, i have a question about connection tracking.
> >
> > Hi
> >
> > >
> > > if i have at least one iptables rule with -m state ,no matter in whic=
h
> > > chain,then the conntrack module gets loaded in all iptables hooks and
> > > thus all packets will be connection tracked, even if i need to track
> > > only a small subset of packets. This means that the only way to avoid
> > > connection tracking for most of packes is to use the NOTRACK module i=
n raw
> > > table to match them. Is my understanding correct?
> >
> > Yes. This is right. Keep in mind that conntrack is a hook in the packet
> > traversal just like any other hooks (PREROUTING, INPUT, FORWARD, ...)
> >
> > Usually, that's the first hook ever. But, with the raw table, there's a=
 new
> > hook registered before conntrack. That's why you can tell :
> >
> > That packet which is not going to TCP X and host X, just don't track it
> > (NOTRACK).
> >
> > > Or i can avoid connection tracking without the use of NOTRACK modules=
?
> >
> > Without NOTRACK, that's a no conntrack for all or conntrack for all
> > condition. There's no beside.
>=20
>  ok, thanks that's that i thought, it just the author of article "Securin=
g
> Linux System with Host Based Firewalls" from Sun blueprints writes:
>=20
> Stateful packet filtering uses a certain amount of memory per active
> connection. To limit the memory impact, we use stateful packet filtering
> only where necessary. This strategy limits the impact during a flooding o=
r
> DOS attack. For simple inbound services like HTTP and secure shell (SSH),
> we do not need to use stateful packet filtering. The FTP protocol is a
> different matter, because passive mode FTP does not use a fixed port
> number for the data connection...
>  and there is a code like:
> for port in ${TCP_IN}; do
>  case "${port}" in
>  ftp) $NEW INPUT -p tcp --dport ${port} --syn -m state --state NEW -j
> ACCEPT
>     ;;
>  *)  $NEW INPUT -p tcp --dport ${port} -j ACCEPT
>     $NEW OUTPUT -p tcp '!' --syn --sport ${port} -j ACCEPT
>     ;;
>  esac
> done
>  and not a word about NOTRACK or raw table. That got me confused, i guess
> the author got it wrong or am i missing something?

I believe a lot of people think that conntrack takes only place where
a "-m state" rule is encountered. This may come from the fact that
all(?) other matches work this way. But when conntrack is loaded it
"sees" every connection. The line in the chain is but a test for a
specific condition of the connection. Since when using conntrack you
pay the price anyway, it therefor makes sense to get the most benefit
out of it and put -m state ESTABLISHED, RELATED or some such as early
as possible to minimize the rules to traverse.

With NOTRACK you can change that a bit, but it might be cumbersome
unless you want something simple like no tracking for all forwarding
packets but tracking for incoming/outgoing.

--=20
C U

     - -- ---- ----- -----/\/  Ren=E9 Gallati  \/\---- ----- --- -- -

