From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: ftp contrack
Date: Tue, 25 Jan 2005 15:04:54 -0500
Message-ID: <2E314DE03538984BA5634F12115B3A4E01BC42F1@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Jose Maria Lopez <jkerouac@bgsec.com>, netfilter@lists.netfilter.org

2121 is used for frox ftp proxy

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jose Maria =
Lopez
Sent: Tuesday, January 25, 2005 7:53 AM
To: netfilter@lists.netfilter.org
Subject: Re: ftp contrack

El mar, 25 de 01 de 2005 a las 13:15, Filip Sneppe escribi=F3:
> On Mon, 24 Jan 2005 00:57:14 +0100 (MET), Mario Ohnewald
> <mario.Ohnewald@gmx.de> wrote:
> > Hello List!
> >=20
> > I am trying to redirect (NAT) to a internal ftp box (but both have a =
public
> > ip).
> > I am using those rules:
> >=20
> > modprobe ip_conntrack_ftp ports=3D21,2121
> > modprobe ip_nat_ftp
>=20
> Hi Mario,=20
>=20
> Add "ports=3D21,2121" to the "modprobe ip_nat_ftp" command.
> That should do the trick.
>=20
> modprobe ip_nat_ftp ports=3D21,2121
>=20
> Regards,
> Filip

Maybe it's a stupid question, but...
Why are you using port 2121 for ftp?
I couldn't find any information on it being used.

Regards.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=D1A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"



