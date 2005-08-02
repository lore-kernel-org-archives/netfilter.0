From: Eric Leblond <eric@inl.fr>
Subject: Re: about NFQUEUE and nth match
Date: Tue, 02 Aug 2005 14:59:57 +0200
Message-ID: <1122987597.7160.8.camel@localhost.localdomain>
References: <WorldClient-F200508011629.AA29430066@tesla.cujae.edu.cu>
	<1122928961.5084.12.camel@porky>
	<WorldClient-F200508011918.AA18330122@tesla.cujae.edu.cu>
	<1122939173.5292.6.camel@localhost.localdomain>
	<WorldClient-F200508020846.AA46420147@tesla.cujae.edu.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <WorldClient-F200508020846.AA46420147@tesla.cujae.edu.cu>
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

Le mardi 02 ao=FBt 2005 =E0 08:46 -0400, Frank Abel Cancio Bello a =E9crit =
:
> Thanks again eric
>=20
> Can you send me or point me to some code that you are tested?

All the tests have been done on NuFW : http://www.nufw.org
The libipq sources are in the src/nufw directory.

The daemon in quiet simple :=20
      * one thread read message from kernel and send them other network
        (packetsrv.c)
      * second thread read decision from network and give it to kernel
        (authsrv.c)

Hope this help,

BR,

>=20
> Salute
> Frank
>=20
> > Le lundi 01 ao=FBt 2005 =E0 19:18 -0400, Frank Abel Cancio Bello a =E9c=
rit :
> > > > On Mon, 2005-08-01 at 16:29 -0400, Frank Abel Cancio Bello wrote:
> > > > > Hi all!
> > > > >=20
> > > > > Some time ago I post a mail in this list=20
> > > > >=20
> > >=20
> ("https://lists.netfilter.org/pipermail/netfilter/2005-April/059499.html"=
)=20
> > > > > asking about how manage packets that was captured with "libipq" a=
nd=20
> > > "QUEUE"=20
> > > > > target in different threads or process.
> > > > >=20
> > > > > Now with the new "NFQUEUE" target I can have many process reading=
=20
> > > parckets=20
> > > > > in different queues numbers and using "nth match" to spread=20
> equitably=20
> > > over=20
> > > > > all process the captured packects.=20
> > > >=20
> > > > This look terribly awfull to me ! You better use a single=20
> multithreaded
> > > > application.
> > > >=20
> > >=20
> > > Due to libipq isn't thread-safe (see one problem in=20
> > >
> >=20
> http://www.experts-exchange.com/Programming/Programming_Platforms/Linux_P=
rogrammi
> > ng/Q_20766491.html)=20
> > > and I'm not a netfilter hacker I send the mail=20
> > > (https://lists.netfilter.org/pipermail/netfilter/2005-April/059499.ht=
ml)=20
> but=20
> > > anybody reply.=20
> > > The problem is that I need to know if is safe make a multithreaded=20
> > > application with libipq. Now I have the same questions that that some=
=20
> time=20
> > > ago:
> >=20
> > >From my experience, I've tested with two threads. One receiving packet=
s
> > the other sending packets back to kernel. It seems to work fine, even
> > under heavy load. I've never tried multiple sending and receiving
> > threads.
> > But you can always have something like that by using messages between
> > the threads.
> >=20
> > BR,
> > --=20
> > Eric Leblond=20
> >=20
> >=20
> >=20
>=20
>=20
>=20
>=20



