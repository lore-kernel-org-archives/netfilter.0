From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Distinguishing between local FTP uploads and remote FTP
	downloads
Date: 10 Jan 2005 14:10:39 +0100
Message-ID: <1105298748.31862.0.camel@nostromo.bgsecm.com>
References: <20050108140640.GA18766@teaser.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050108140640.GA18766@teaser.fr>
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
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El s=C3=A1b, 08 de 01 de 2005 a las 15:06, Andre Majorel escribi=C3=B3:
> For traffic shaping purposes, I'd like to distinguish (-j MARK)
> between ftp-data packets resulting from me uploading something to
> a remote host and ftp-data packets resulting from a remote
> download from me.
>=20
> The goal is, of course, to be able to upload at full speed without
> letting remote hosts hog my upload bandwidth at the same time.
>=20
> Is there any way to do that ?
>=20
> Thanks in advance.

Your best bet it's using the QoS capabilities of the
kernel and the tc command. You can find all the information
you need and an excellent howto at http://lartc.org

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


