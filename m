From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: is this the zillionth mail asking for this detail?
Date: Wed, 10 Aug 2005 11:37:47 -0400
Message-ID: <65aa6af9050810083761c164a8@mail.gmail.com>
References: <65aa6af905072021501603cfd5@mail.gmail.com>
	<42DF85AE.1000400@gmx.co.uk>
	<Pine.LNX.4.58.0507211511240.27131@blackhole.kfki.hu>
	<Pine.LNX.4.61.0507211521120.17188@yvahk01.tjqt.qr>
	<Pine.LNX.4.58.0507211523100.27131@blackhole.kfki.hu>
	<42DFA8D1.207@mnemon.de>
	<Pine.LNX.4.58.0507211557070.27131@blackhole.kfki.hu>
	<65aa6af905072107096e1d6d06@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af905072107096e1d6d06@mail.gmail.com>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

Sorry to reply on an old thread.. but I think it's a good point to
start my next questions. Does the same policy stand on FORWARD? There
will be another routing decision if source address, destination
address, nfmark field or tos of the skbuff changed???

On 7/21/05, Edmundo Carmona <eantoranz@gmail.com> wrote:
> >
> > But for the record: for locally generated packets the routing engine is
> > called after OUTPUT only if source address, destination address, nfmark
> > field or tos of the skbuff changed. So it's not called blindly for ever=
y
> > packet.
> >
> > Best regards,
> > Jozsef
> > -
> > E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> > PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> > Address : KFKI Research Institute for Particle and Nuclear Physics
> >           H-1525 Budapest 114, POB. 49, Hungary
> >
> >
> Good to know!
>

