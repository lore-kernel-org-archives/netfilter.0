From: Mario Ohnewald <mario.ohnewald@gmx.de>
Subject: Re: ftp contrack
Date: Tue, 25 Jan 2005 10:50:26 +0100
Message-ID: <1106646626.7431.1.camel@linux.site>
References: <22793.1106524634@www29.gmx.net>
	<9151ac2a05012504156caf097b@mail.gmail.com>
	<1106657609.22125.78.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106657609.22125.78.camel@nostromo.bgsecm.com>
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

On Tue, 2005-01-25 at 13:53, Jose Maria Lopez wrote:
> El mar, 25 de 01 de 2005 a las 13:15, Filip Sneppe escribi=C3=B3:
> > On Mon, 24 Jan 2005 00:57:14 +0100 (MET), Mario Ohnewald
> > <mario.Ohnewald@gmx.de> wrote:
> > > Hello List!
> > >=20
> > > I am trying to redirect (NAT) to a internal ftp box (but both have a =
public
> > > ip).
> > > I am using those rules:
> > >=20
> > > modprobe ip_conntrack_ftp ports=3D21,2121
> > > modprobe ip_nat_ftp
> >=20
> > Hi Mario,=20
> >=20
> > Add "ports=3D21,2121" to the "modprobe ip_nat_ftp" command.
> > That should do the trick.
> >=20
> > modprobe ip_nat_ftp ports=3D21,2121
> >=20
> > Regards,
> > Filip
>=20
> Maybe it's a stupid question, but...
> Why are you using port 2121 for ftp?
> I couldn't find any information on it being used.

Because i have a ftpd running on the firewall itself.

by the way. =20
  modprobe ip_nat_ftp ports=3D21,2121
didnt work.


Cheers, Mario


