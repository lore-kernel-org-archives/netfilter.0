From: =?iso-8859-1?q?Giancarlo=20Boaron?= <gboaron@yahoo.com.br>
Subject: Re: No Internet Connection
Date: Fri, 10 Sep 2004 14:28:20 -0300 (ART)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040910172820.33842.qmail@web50210.mail.yahoo.com>
References: <1094835410.1900.151.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094835410.1900.151.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Ok Jason. I agree with you. When any packet matches a
specific rule, it returns to the top level rule that
called a down level rule (in this situation, that's
the INPUT chain). And if we have no matches in the
INPUT chain, iptables uses the default policy (DROP).

I tested that DHCP rules and it seems that it's
working. I'm running my script for about 2 hours and
it didn't crash yet.=20

So, I think that strange behavior was resolved.

Im going to test that nice ideas when rebooting the
server and another ones suggested in this mail list.

Thank you.
Giancarlo

 --- Jason Opperisano <opie@817west.com> escreveu:=20
> On Fri, 2004-09-10 at 12:41, Aleksandar Milivojevic
> wrote:
> > > $IPTABLES -N tcp_invalidos
> > >=20
> > > $IPTABLES -A tcp_invalidos -p tcp --tcp-flags
> SYN,ACK
> > > SYN,ACK \
> > > -m state --state NEW -j REJECT --reject-with
> tcp-reset
> > > $IPTABLES -A tcp_invalidos -p tcp ! --syn -m
> state
> > > --state NEW -j LOG \
> > > --log-prefix "Novo nao SYN:"
> > > $IPTABLES -A tcp_invalidos -p tcp ! --syn -m
> state
> > > --state NEW -j DROP
> >=20
> > Here's the place where you made an error.  When
> you reach end of=20
> > "tcp_invalidos" chain, default policy for
> INPUT/OUTPUT/FORWARD chains=20
> > will be applied (which is DROP).  Which means, all
> packets will be=20
> > dropped by the firewall.
>=20
> i don't know that i agree with this statement.  when
> a packet reaches
> the end of custom chain "tcp_invalidos" and has not
> matched any rules in
> that chain--it should return to the calling chain
> where it left off;
> i.e.
>=20
>         iptables -P INPUT DROP
>         iptables -A INPUT -j badstuff
>         iptables -A INPUT -j goodstuff
>         iptables -A INPUT -j LOG
>        =20
> a packet not matching any rule in "badstuff" will
> return to INPUT, and
> then jump to "goodstuff"...  if the packet doesn't
> match any rule in
> "goodstuff" it will return to INPUT, get logged, and
> *then* get dropped,
> as it has hit the end of the INPUT chain and not
> matched any rules.=20
> only then does the POLICY of the chain get enforced.
>=20
> -j
>=20
>
=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D=
~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~
> We don't smoke and we don't chew, and we don't go
> with girls that do. --
> Walter Summers
>
=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D=
~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~=3D~
>=20
>=20
> =20


=09
=09
	=09
_______________________________________________________
Yahoo! Messenger 6.0 - jogos, emoticons sonoros e muita divers=E3o. Instale=
 agora!
http://br.download.yahoo.com/messenger/

