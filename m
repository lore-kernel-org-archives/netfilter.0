From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: simple rules and unexpected traffic
Date: Fri, 5 Jul 2002 09:54:04 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA239@JUPITER>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

So why are you allowing any other device being allowed, please tell me =
your
not running PPPoE for adsl or something.. this means your network is =
open
then.....

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: christophe barb=E9 [mailto:christophe.barbe.ml@online.fr]
Sent: Friday, 05 July 2002 9:47 AM
To: netfilter@lists.samba.org
Subject: Re: simple rules and unexpected traffic


On Fri, Jul 05, 2002 at 09:44:36AM +1000, George Vieira wrote:
> Have you got any packet counts for the DROPped rules??

no.

> I'm still a bit stumped on the
>=20
> -A block -i ! eth0 -m state --state NEW -j ACCEPT=20
>=20
> as what other devices do you have???

I have only eth0 and lo.

Christophe


>=20
> thanks,
> George Vieira
> Systems Manager
> Citadel Computer Systems P/L
> http://www.citadelcomputer.com.au
>=20
>=20
>=20
> -----Original Message-----
> From: christophe barb=E9 [mailto:christophe.barbe.ml@online.fr]
> Sent: Friday, 05 July 2002 8:57 AM
> To: netfilter@lists.samba.org
> Subject: Re: simple rules and unexpected traffic
>=20
>=20
> On Fri, Jul 05, 2002 at 12:54:36AM +0200, Jan Humme wrote:
> > On Friday 05 July 2002 00:45, christophe barb=E9 wrote:
> > > On Fri, Jul 05, 2002 at 08:35:53AM +1000, George Vieira wrote:
> > > > Yes I've found that some user space programs can see stuff =
before
> > > > iptables.. tcpdump too I think...
> > >
> > > Yes it sounds logical for tcpdump or tools like that (which pass =
the
> > > interface in promiscuisious mode) to see everything. I was not
expecting
> > > the same from a unprivileged app like gkrellm.
> > > It is stil unclear for me what is the data processing path.
> > >
> > > Has someone a clear picture of the packets path ?
> >=20
> > It is no problem to open a socket and receive a copy of all raw =
packets=20
> > before they get to the kernel iptables modules. See "man 7 packet" =
for=20
> > details.
> >=20
> > I believe this is how tcpdump does it too.
>=20
> Ok it sounds logical.
> Now the question is what is dropping these packets ? Apparently not
> rp_filter, and not netfilter because I see no log for it.
>=20
> Christophe
>=20
> >=20
> > Jan Humme.
>=20
> --=20
> Christophe Barb=E9 <christophe.barbe@ufies.org>
> GnuPG FingerPrint: E0F6 FADF 2A5C F072 6AF8  F67A 8F45 2F1E D72C B41E
>=20
> Imagination is more important than knowledge.
>    Albert Einstein, On Science

--=20
Christophe Barb=E9 <christophe.barbe@ufies.org>
GnuPG FingerPrint: E0F6 FADF 2A5C F072 6AF8  F67A 8F45 2F1E D72C B41E

L'experience, c'est une connerie par jour mais jamais la m=EAme.

