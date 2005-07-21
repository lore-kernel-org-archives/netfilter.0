From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: is this the zillionth mail asking for this detail?
Date: Thu, 21 Jul 2005 11:04:52 -0400
Message-ID: <65aa6af905072108048be6c7d@mail.gmail.com>
References: <65aa6af905072021501603cfd5@mail.gmail.com>
	<42DF85AE.1000400@gmx.co.uk>
	<Pine.LNX.4.58.0507211511240.27131@blackhole.kfki.hu>
	<Pine.LNX.4.61.0507211521120.17188@yvahk01.tjqt.qr>
	<Pine.LNX.4.58.0507211523100.27131@blackhole.kfki.hu>
	<65aa6af905072107063ebab0bc@mail.gmail.com>
	<Pine.LNX.4.61.0507211614340.20941@yvahk01.tjqt.qr>
	<65aa6af9050721071866e3c73b@mail.gmail.com>
	<Pine.LNX.4.61.0507211650020.23894@yvahk01.tjqt.qr>
Reply-To: Edmundo Carmona <eantoranz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507211650020.23894@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

Oh, I think I see what you mean.

That multipath thing is driving me crazy, man.

I just tested what Jozsef told us,  that there's a routing decision
right after output if something changed in the packet. He is so right!
I marked a packet in the output mangle, and it was routed according to
that mark.

Thank you, Jozsef!

On 7/21/05, Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
>=20
> >>> I think it's because they're both on the same network.
> >>
> >> Load balancing using route path cost and tc is done on a per-device ba=
sis;
> >
> >Oh, ok. Good! (I need a translator!).
> >What do you mean? I didn't get it. (I'm kind of ashamed :-)).
>=20
> If you do load balancing / traffic shaping using iptables, you operate on=
 a
> per-packet or per-connection basis (depending on what you do)
>=20
> If you do load balancing with /sbin/route, you operate at the device leve=
l.
> If you do traffic shaping with /sbin/tc, you operate at the device level.
>=20
>=20
>=20
> Jan Engelhardt
> --
>

