From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: a sort of n00b question here but I'ld like to know.
Date: Tue, 21 Oct 2003 11:11:38 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031021181138.49502.qmail@web40202.mail.yahoo.com>
References: <200310210046.16324.Alistair@nerdnet.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310210046.16324.Alistair@nerdnet.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Alistair@nerdnet.ca, Simon Garner <sgarner@expio.co.nz>, netfilter@lists.netfilter.org


>=20
> 	I agree the response is indeed sad, but I believe that's typical for tha=
t=20
> sort of forum.  Watching the traffic coming in to your router and chartin=
g it
>=20
> is NOT any sort of violation of any *rational* AUP.  Going farther than t=
hat=20
> might well be.  The average user of cable internet access has little idea=
 of=20
> what goes on beyond the screen.  I've noted that DSL reports has a few de=
cent
>=20
> posters and occaisionaly has good advise, but frequently is populated by =

> *twinks*.   Considering that you are supposed to be 2Mbs down... I'd doub=
t=20
> that the garbage is that substantial an issue.  I've takn to REJECT with =
tcp=20
> reset for anything targetting the windows filesharing ports off my segmen=
t. =20
> It seems to slow the constant scans, but may be bad policy.  I do know th=
at=20
> the ISP i'm with has a 'no filtering ' policy, and thats one reason I'm w=
ith=20
> them.  But there are days (immediately after a new worm comes out like?) =
when
>=20
> I wish......
>=20
>    In your case its possible that traffic from other folks on your segmen=
t is
>=20
> causing the slow connection.  However keep in mind that you get decent TC=
P=20
> ping times and poor pings in the game.  Perhaps the problem exists with t=
he=20
> *game* servers being slow to respoind to udp traffic due to their load.
>=20
>=20
> >
> >
> > =3D=3D=3D=3D=3D
> > In the absence of order there will be chaos.
> >
> > __________________________________
> > Do you Yahoo!?
> > The New Yahoo! Shopping - with improved product search
> > http://shopping.yahoo.com
>=20
> --=20
>=20
> 	Alistair Tonner
> 	nerdnet.ca
> 	Senior Systems Analyst - RSS
> =09
>      Any sufficiently advanced technology will have the appearance of mag=
ic.
> 	Lets get magical!
>=20


This is the section that I am wondering about in Charter's AUP.

7. NO =93HACKING"

Customer will not use, nor allow others to use, the Service to access the
accounts of others or to attempt to penetrate security measures of the Serv=
ice
or other computer systems (=93hacking=94) or to cause a disruption of the S=
ervice
to other on-line users. Customer will not use, nor allow others to use, too=
ls
designed for compromising network security, such as password-guessing progr=
ams,
cracking tools, packet sniffers or network probing tools.

Wouldn't ntop be considered a "probing" tool?

And getting back to my original reason and question for this post. How
statistically can you see just how much iptables/netfilter is using of syst=
em
resources?

Thanks Everyone
SBlaze


=3D=3D=3D=3D=3D
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

