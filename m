From: Michael Vallaly <netfilter@nolatency.com>
Subject: Re: dst nat failover only while port is closed
Date: Fri, 13 Mar 2015 09:45:25 -0500
Message-ID: <20150313094525.43d7a91eec673de618a9081e@nolatency.com>
References: <CAPhFQCvTHxvx+aExK1DkxutqONq-67ypApKUowQdFyj6fvbvfA@mail.gmail.com>
	<CAOkSjBh+iMWtJwrbDQ9jMFUxUuaCPoYvp_6Qk54PA70Z2BZghw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOkSjBh+iMWtJwrbDQ9jMFUxUuaCPoYvp_6Qk54PA70Z2BZghw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Stefan Certic <stefan@cs-networks.net>, Netfilter Users Mailing list <netfilter@vger.kernel.org>


AFAIK There isn't any functionality for this in netfilter directly. The=
 best I think you could do with solely iptables would be instrument you=
r monit/startup scripts to alter your iptable rules pre/post action. (T=
urning your local application machine into a router with NAT may not be=
 desired)

With LVS you would also need to enable some sort of monitoring to modif=
y the LVS node weights (ldirectord), which will still require periodic =
polling.

A much better approach in this case would be to use a proxy (such as HA=
proxy), which will allow you to "redirect" the request to a working nod=
e, if the local process has failed, or is unresponsive.=20

-Mike

On Fri, 13 Mar 2015 08:52:32 +0100
Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com> wrote:

> On 13 March 2015 at 04:15, Stefan Certic <stefan@cs-networks.net> wro=
te:
> > Hello World :)
> >
> > I am interested in following scenario with iptables (if such is pos=
sible).
> >
> > Setup:
> >
> > 1. Ext Firewall nats port Z to server A.
> > 2. Application X listens on port Z of server A
> > 3. It happens that application X crashes for a couple of seconds an=
d
> > get's restarted by a monit.
> >
> > Question:
> >
> > Is it possible to perform Nat on server A itself, to server B, that
> > will took place only until application is restarted (only while no =
one
> > is listening on port Z) otherwise expose port Z to back to
> > application.
> >
> > Reason:
> >
> > The idea is to provide a failover, uninterrupted service even when =
app
> > crash occurs.
>=20
> I think this is what LVS does.
>=20
> You can configure a loadbalancer which listen on a virtual address.
> Then, you have several real servers in the backend. The LVS can do
> health checks and deliver connection to real servers in the backend i=
f
> they are alive.
>=20
> Your "firewall --> server A --> server B" architecture seems very wei=
rd.
>=20
> best regards.
>=20
> --=20
> Arturo Borrero Gonz=E1lez
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=20
Michael Vallaly <mvallaly@nolatency.com>
