From: Dave Johnson <davejohnson_hifi@yahoo.com>
Subject: Re: Help needed for a box with 4 Ethernet Interfaces
Date: Thu, 4 Aug 2005 10:25:29 -0700 (PDT)
Message-ID: <20050804172529.54124.qmail@web30112.mail.mud.yahoo.com>
References: <20050804171507.39668.qmail@web30101.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050804171507.39668.qmail@web30101.mail.mud.yahoo.com>
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
To: Dave Johnson <davejohnson_hifi@yahoo.com>, Eduardo Spremolla <edspremolla@antel.com.uy>, netfilter@lists.netfilter.org

Sorry again, Box A and C have 2 interfaces.


--- Dave Johnson <davejohnson_hifi@yahoo.com> wrote:

>=20
> Sorry for the confusion. Box A and B have 2 interfaces.=20
> Here is updated diagram.
>                                                                          =
------------
>                                             -----------------------------=
|  Box D   |
>                               172.16.6.10   |                            =
|          |
>          Mgmt Port<---------------------|   |                            =
------------
>                                         |   | 192.168.0.1                =
 192.168.0.2
>                                    Eth0 |   | Eth1 (for internal network)
>  ------------                        ------------                        =
------------
>  |  Box A   |10.1.1.1 _______________|  Box B   |_____________21.21.21.1_=
|  Box C   |
>  |          |                    Eth2|          | Eth3                   =
|          |
>  ------------     10.1.1.0/24        ------------       21.21.21.9/24    =
------------        =20
> =20
>   192.168.0.1                         192.168.0.3                        =
 192.168.0.2
>=20
>=20
>=20
> --- Eduardo Spremolla <edspremolla@antel.com.uy> wrote:
>=20
> > You can't have Box A with ip 192.168.0.1 on a 10.1.1.0/24 subnet, the
> > same goes for Box C. They need ip in the subnet range.
> > After that we may start to talk about roouting.
> >=20
> >=20
> > LALO
> >=20
> > On Thu, 2005-08-04 at 09:11 -0700, Dave Johnson wrote:
> > > Hi All:
> > > I need help to setup my box with some complicated configuration.
> > >=20
> > > I have a box with 4 Ethernet Interfaces:
> > >=20
> > > Eth0: 172.16.6.10
> > > Eth1: 192.168.0.1/24
> > > Eth2: 10.1.1.0/24      ------> Connected to a box A with an IP addres=
s of 192.168.0.2
> > > Eth2: 21.21.21.9/24    ------> Connected to a box C with an IP addres=
s of 192.168.0.1 (which
> > is
> > > same as IP address of Eth1)
> > >=20
> > > Loopback Interface: 192.168.0.3
> > >                                                                      =
    ------------
> > >                                             -------------------------=
----|  Box D   |
> > >                               172.16.6.10   |                        =
    |          |
> > >          Mgmt Port<---------------------|   |                        =
    ------------
> > >                                         |   | 192.168.0.1            =
     192.168.0.2
> > >                                    Eth0 |   | Eth1 (for internal netw=
ork)
> > >  ------------                        ------------                    =
    ------------
> > >  |  Box A   |________________________|  Box B   |____________________=
____|  Box C   |
> > >  |          |                    Eth2|          | Eth3               =
    |          |
> > >  ------------     10.1.1.0/24        ------------       21.21.21.9/24=
    ------------      =20
> =20
> >   =20
> > >   192.168.0.1                         192.168.0.3                    =
     192.168.0.2
> > >=20
> > > Here is what I want to do:
> > > Packets from Eth2 should only go to Eth3 except the ones detined to E=
th0's IP.
> > > Packets from Eth3 should only go to Eth2 except the ones detined to E=
th0's IP.
> > > Local packets destined for Eth1's ip and its subnet should be forward=
ed via Eth1 only.
> > > Packets from Eth1 can only be directed to Eth0.=20
> > >=20
> > > This will allow me to ping Box A (192.168.0.1) from Box C (192.168.0.=
2) without getting a
> > response
> > > from Box B who has local interface with address 192.168.0.1.
> > >=20
> > > Basically I want to isolate interfaces in 2 groups:
> > > One with Eth0, Eth2 and Eth3
> > > Second with Eth0 and Eth1.
> > >=20
> > > I tried IPtables and multiple routing tables but it did not work. I t=
hink I need some
> > directions
> > > as to how would this even be possible.
> > >=20
> > > Thanks
> > >=20
> > > Dave.
> > >=20
> > >=20
> > >=20
> > > __________________________________________________
> > > Do You Yahoo!?
> > > Tired of spam?  Yahoo! Mail has the best spam protection around=20
> > > http://mail.yahoo.com=20
> > >=20
> >=20
> >=20
> > Este e-mail y cualquier posible archivo adjunto est=E1 dirigido =FAnica=
mente al destinatario del
> > mensaje y contiene informaci=F3n que puede ser confidencial. Si Ud. no =
es el destinatario
> correcto
> > por favor notifique al remitente respondiendo este mensaje y elimine in=
mediatamente el e-mail
> y
> > los posibles archivos adjuntos al mismo de su sistema. Est=E1 prohibida=
 cualquier utilizaci=F3n,
> > difusi=F3n o copia de este e-mail por cualquier persona o entidad que n=
o sean las espec=EDficas
> > destinatarias del mensaje. ANTEL no acepta ninguna responsabilidad con =
respecto a cualquier
> > comunicaci=F3n que haya sido emitida incumpliendo nuestra Pol=EDtica de=
 Seguridad de la
> Informaci=F3n.
> > . . . . . . . . .
> > This e-mail and any attachment is confidential and is intended solely f=
or the addressee(s). If
> > you are not intended recipient please inform the sender immediately, an=
swering this e-mail and
> > delete it as well as the attached files. Any use, circulation or copy o=
f this e-mail by any
> > person or entity that is not the specific addressee(s) is prohibited. A=
NTEL is not responsible
> > for any communication emitted without respecting our Information Securi=
ty Policy.
> >=20
>=20
>=20
>=20
> 	=09
> ____________________________________________________
> Start your day with Yahoo! - make it your home page=20
> http://www.yahoo.com/r/hs=20
> =20
>=20
>=20



	=09
____________________________________________________
Start your day with Yahoo! - make it your home page=20
http://www.yahoo.com/r/hs=20
=20

