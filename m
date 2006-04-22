From: robee <mlody@elpec.com>
Subject: Re: one rule to create per IP connlimits?
Date: Sat, 22 Apr 2006 17:35:24 +0200
Message-ID: <1145720124.2502.2.camel@robee.mars.cyberbajt.pl>
References: <5cc9c8f90604211201keda9583yf0026180cbfe9a75@mail.gmail.com>
	<006201c665f5$00205670$0e01050a@CyberAdmin>
	<876ef97a0604220615g530bd141uffe611fec9759a8e@mail.gmail.com>
Reply-To: mlody@elpec.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <876ef97a0604220615g530bd141uffe611fec9759a8e@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Dnia 22-04-2006, sob o godzinie 09:15 -0400, Toby DiPasquale napisa=B3(a):
> On 4/22/06, robee <mlody@elpec.com> wrote:
> > maybe this way:
> >
> > iptables -I FORWARD -p tcp --syn -s 10.10.2.96/27 -m
> > connlimit --connlimit-above 20 -j REJECT
> >
> > or
> >
> > iptables -I FORWARD -p tcp --syn -m iprange --src-range
> > 10.10.2.96-10.10.2.127 -m connlimit --connlimit-above 20 -j REJECT
>=20
> Those both still allow one IP to use up all the connections, leaving
> none for the others.
>=20
> To do this, the connlimit module would have to keep track of
> individual conntracks, not just aggregate numbers. It doesn't right
> now, but it could be made to do so.
>=20
> --
> Toby DiPasquale
> 0x636f6465736c696e67657240676d61696c2e636f6d
>=20

do you mean it shoud be indyvidual rule for each IP separatelly?

robee


