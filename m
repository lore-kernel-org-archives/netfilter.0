From: vinay mathew <vinaymathew80@yahoo.com>
Subject: Re: [LARTC] Compiling sch_tbf.c in user space
Date: Thu, 17 Feb 2005 13:20:12 -0800 (PST)
Message-ID: <20050217212013.96729.qmail@web50408.mail.yahoo.com>
References: <Pine.LNX.4.62.0502171341490.25118@webhosting.rdsbv.ro>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.62.0502171341490.25118@webhosting.rdsbv.ro>
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: "Catalin(ux aka Dino) BOIE" <util@deuroconsult.ro>
Cc: lartc@mailman.ds9a.nl, netfilter@lists.netfilter.org


--- "Catalin(ux aka Dino) BOIE" <util@deuroconsult.ro>
wrote:

> > Hi,
> Hi!
>=20
> > I am new to kernel programming.
> > My task is to route packets from different hosts
> > through one single token bucket filter as we are
> > trying to model a wireless scenario with many
> hosts
> > communicating and sharing the same bandwidth.So
> the
>=20
> But why do you want to go to userspace for this
> simulation. Why not in=20
> kernel. If you want to simulate wireless, take a
> lokk at netem scheduler.

I have already looked at netem and am using that for
modelling parameters like delay, jitter etc.
But the situation for bandwidth modelling is not there
in netem.The reason im doin it in user space is that i
need to route all packets coming into the system
through a single tbf.Using the kernel and tc system
the tbf is attached to a particular interface and
hence i do not have a common tbf for all interfaces.I
want a common tbf to shape all the traffic before
sending the packets out on the respective interfaces.I
have just come across the idea of using IMQ devices
for this task.I believ it is possible for the packets
coming in from different interfaces to be passed thro
a common tbf attached to an IMQ before sending them
out on the final interfaces.Im just not sure if the
packets routed to thro to the imq are again routed to
the correct interface finally.Do u have any idea on
this one.I would greatly appreciate any help on this.
thanx in advance
>=20
> > idea we came up with was to route packets from
> > different hosts to user space using Netfilter and
> then
> > send them through a common tbf implemented in user
> > space in order to model a simple bandwidth shaping
> > scenario.
> > Routing packets to user space has been easy using
> the
> > Netfitler hooks and libipq.
> > My problem now is that i need to implement a tbf
> in
> > user space.I was thinking if its possible to
> modify
> > the sch_tbf.c code to make it work in user space
> so
> > that i can compile it as part of my user space
> program
> > that handles the packets sent to user space thro
> > netfilter.Ive tried modifying this code a bit but
> it
> > gives me a huge number of errors when i try to
> compile
> > it as a simple C program in user space.
> > If this is not possible does any one have a simple
> > basic implementation of the token bucket filter
> that i
> > can use in my program to test this scenario or any
> > other ideas on how to implement this tbf in user
> > space.
> > Thanx a million in advance.......and im sorry i
> didnt
> > know exactly where to post the query so thats why
> i
> > posted to both lists.
> > thanx and kind regards
> > vinay
> >
> >
> >
> >
> > __________________________________
> > Do you Yahoo!?
> > Yahoo! Mail - You care about security. So do we.
> > http://promotions.yahoo.com/new_mail
> > _______________________________________________
> > LARTC mailing list / LARTC@mailman.ds9a.nl
> > http://mailman.ds9a.nl/mailman/listinfo/lartc
> HOWTO: http://lartc.org/
> >
>=20
> ---
> Catalin(ux aka Dino) BOIE
> catab at deuroconsult.ro
> http://kernel.umbrella.ro/
>=20


=3D=3D=3D=3D=3D
Vinay Mathew
Technische Universit=E4t - Braunschweig,
Zimmer 41215, Rebenring 64, 38106 Braunschweig,
Deutschland.
Ph No:+4917622086705






	=09
__________________________________=20
Do you Yahoo!?=20
All your favorites on one personal page =96 Try My Yahoo!
http://my.yahoo.com=20

