From: Fabien Germain <fabien.germain@gmail.com>
Subject: Re: ddos / no connection tracking / tarpitting
Date: Sat, 23 Apr 2005 00:18:54 +0200
Message-ID: <20a523fb0504221518633ecee7@mail.gmail.com>
References: <Pine.LNX.4.60.0504221707050.15167@darkstar.sysinfo.com>
	<42697714.011dd32f.69e7.219fSMTPIN_ADDED@mx.gmail.com>
Reply-To: Fabien Germain <fabien.germain@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42697714.011dd32f.69e7.219fSMTPIN_ADDED@mx.gmail.com>
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
To: edvin.seferovic@kolp.at
Cc: netfilter@lists.netfilter.org

As Ron explained, the problem with DoS is not the firewall (iptables
or not), but the pipe size. I also had a few DDoS, and the OpenBSD
firewall never had any trouble... but I had a pipe saturation :-(

Fabien
--=20
fabien (at) klipz (dot) fr
http://www.klipz.fr


On 4/23/05, Seferovic Edvin <edvin.seferovic@kolp.at> wrote:
> Hi,
>=20
> my partner company has implemented a really good DdoS protection that is
> able to process more than 3mil packets/sec. Beside of that fact, the
> appliance has web interface where you can track the load on your connecti=
on
> as well as block some ips or ip ranges that are attacking your server. If
> you are interested, I could send you a information folder.
>=20
> Regards,
>=20
> Edvin Seferovic
>=20
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of R. DuFresne
> Sent: Freitag, 22. April 2005 23:13
> To: Taylor Grant
> Cc: Vic N; netfilter@lists.netfilter.org
> Subject: Re: ddos / no connection tracking / tarpitting
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> the only way to really survive a ddos without affecting connectivity in
> any shapoe or form is to have a bigger pipe then the other end<s> does.
> idiots trying to ddos from a cable connection or dialup are not a problem
> and sufferable.  Those a tad higher in technical advancement with a bot
> net and tousands of zomies to attack from are likely to bring even the
> biggest pipes to a dead halt, at least getting in and our of the firewall
> gateway is impossible.  Traffic on the inside should be unaffected.
>=20
> I've suffered attacks with a firewall not doing connection tracking and
> had no problems with either the firewall failing or suffereing a reboot.
> I have yet to suffer such an attack on a staeful firewall, but tend to
> think I should suffer no less with such a firewall in place as apposed to
> an the older mere packet filters I've been replacing over time.  Course,
> it helps to have enough RAM in the firewall in the firstplace...
>=20
> pipes size and RAM, them be the keys to surviival.
>=20
> Thanks,
>=20
> Ron DuFresne
>=20
> On Fri, 22 Apr 2005, Taylor Grant wrote:
>=20
> >> A while ago I saw an iptables solution that was able to serve as an
> >> effective anti-ddos solution.   I didn't get to see under the hood, bu=
t
> >> the creator told me that the solution was essentially an iptables
> >> implementation with no connection tracking built in.  Allegedly, the f=
act
>=20
> >> that no connection tracking was used enabled the the iptables to deal
> with
> >> a much higher volume of traffic w/o crashing.  He had also mentioned
> using
> >> packet counting (to count packets as they passed through since there w=
as
> >> no way to keep track of them otherwise) and using tarpitting.
> >>
> >> While I can't attest to what the person told me, I do know the firewal=
l
> >> was soaking up ddos traffic that was otherwise bringing servers to the=
ir
> >> knees with the use of regular connection-based firewalling.
> >>
> >> So my question is, is this the basic element of building a good anti-d=
dos
>=20
> >> solution wtih iptables to address a *large* volume of ddos traffic to
> >> build iptables w/o connection tracking?
> >>
> >> Thanks,
> >
> > Yes this is possible and (I think) fairly easy to do.  As I have never
> done
> > this I can not tell you for sure, but this is what I would do if I were=
 to
> do
> > such a thing.
> >
> > I will presume that you are wanting to drop all traffic to a specif por=
t
> on
> > an IP address for the sake of this discussion.
> >
> > iptables -t raw -A PREROUTING -d 1.2.3.4 -p tcp --dport 5678 -j NOTRACK
> > iptables -t filter -A FORWARD -d 1.2.3.4 -p tcp --dport 5678 -j TARPIT
> >
> > This will cause any traffic that comes in that is distend to 1.2.3.4 on
> port
> > 5678 to  NOT be tracked with the connecting tracking sub system and to
> > subsequently be redirected to the TARPIT target.
> >
> >
> >
> > Grant. . . .
> >
>=20
> - --
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          admin & senior security consultant:  sysinfo.com
>                          http://sysinfo.com
> Key fingerprint =3D 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
>=20
> ...We waste time looking for the perfect lover
> instead of creating the perfect love.
>=20
>                  -Tom Robbins <Still Life With Woodpecker>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
>=20
> iD8DBQFCaWjtst+vzJSwZikRAu6hAJ496gLuwc31uc2uiCNXzbk3AMA1SQCdEXNI
> VfK1Yh+17fGQV6Qb6gRF8Zc=3D
> =3Dsgu8
> -----END PGP SIGNATURE-----
>=20
>

