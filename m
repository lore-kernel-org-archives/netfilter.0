From: Dominic Iadicicco <sctylib2004@yahoo.com>
Subject: RE: Can anyone tell me how to do this?
Date: Thu, 23 Sep 2004 10:28:46 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040923172846.66764.qmail@web51302.mail.yahoo.com>
References: <004301c4a18c$9ebe9500$0801010a@sdg03>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <004301c4a18c$9ebe9500$0801010a@sdg03>
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
Content-Transfer-Encoding: quoted-printable
To: netfilter <netfilter@lists.netfilter.org>

it didn't work
=20

  Thank you for the input though.=20


Dom
--- Samuel D=EDaz Garc=EDa (ArcosCom)
<samueldg@arcoscom.com> wrote:

> Think in that it is an internal configured SSH
> daemond and the administrator
> don't want to modify the config because the daemon
> is worwing well.
>=20
> The solution to open the service to another network
> is map the ports.
>=20
> A posible solution for redirect the ssh port is (in
> the 10.0.0.1 machine):
>=20
> 1) Allow incoming SSH connexs from the 10.0.0.1
> iface.
> 2) Redirect 10.0.0.1:22 to 172.16.12.130:22
>=20
> And ... how to do this with IPTABLES?
>=20
> $> iptables -t filter -A INPUT -i eth1 -d 10.0.0.1
> -m tcp -p tcp --dport
> 22 -j ACCEPT
> $> iptables -t nat -A PREROUTING -i eth1 -d 10.0.0.1
> -m tcp -p tcp --dport
> 22 -j DNAT --to-destination 172.16.12.130:22
>=20
> This add the rules at the chain tail.
>=20
> Regards,
>=20
> Samuel D=EDaz Garc=EDa
> Director Gerente
> ArcosCom Wireless, S.L.L.
>=20
> mailto:samueldg@arcoscom.com
> http://www.arcoscom.com
> m=F3vil: 651 93 72 48
> tlfn/fax: 956 70 13 15
>=20
>=20
> -----Mensaje original-----
> De: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]En
> nombre de Jason
> Opperisano
> Enviado el: jueves, 23 de septiembre de 2004 18:15
> Para: netfilter@lists.netfilter.org
> Asunto: Re: Can anyone tell me how to do this?
>=20
>=20
> On Thu, 2004-09-23 at 11:14, Dominic Iadicicco
> wrote:
> > yes
> >
> > > wrote: On Thu, 2004-09-23 at 09:22, Dominic
> Iadicicco wrote:
> > > ok, I have another one for all.
> > >
> > > I have now been tring to do this:
> > >
> > > I have an IP, 10.0.0.1 on eth1 and an IP
> 172.16.12.130
> > > at eth0. And heres were things get fun. I want
> all
> > > ssh requests that go to 10.0.0.1 to get routed
> to
> > > 172.16.12.130 just like it worked when we did it
> from
> > > .130 to .212. (if anyone is new and doesn't what
> was
> > > discussed yesterday, please let me know I will
> post
> > > it.)
> >
> > are 10.0.0.1 and 172.16.12.130 on the same
> physical machine?
> >
> > -j
>=20
> i hate answering questions with the "why don't you
> just do it this way"
> response, but here goes...
>=20
> if you have SSH connections being received on
> 10.0.0.1, and that machine
> also has an IP of 172.16.12.130, why don't you just
> accept the
> connections on 10.0.0.1?
>=20
> -j
>=20
> --
> Jason Opperisano <opie@817west.com>
>=20
>=20
>=20
>=20
>=20



	=09
_______________________________
Do you Yahoo!?
Declare Yourself - Register online to vote today!
http://vote.yahoo.com

