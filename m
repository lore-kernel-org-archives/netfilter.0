From: Michael Weinert <weinert@sys2.de>
Subject: Re: Log everything from iptables
Date: Thu, 16 Jun 2005 15:36:50 +0200
Message-ID: <200506161536.54612.weinert@sys2.de>
References: <00c901c571ce$95902260$ec0211ac@PIVT>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1144896.0rtCzHEbqT";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00c901c571ce$95902260$ec0211ac@PIVT>
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
To: netfilter@lists.netfilter.org

--nextPart1144896.0rtCzHEbqT
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Mittwoch, 15. Juni 2005 19:20 schrieb Sebasti=E3o Ant=F4nio Campos:

Hi,

> How can I do to log everything is passing thru my firewall on eth0 and et=
h1
> and lo?? Using iptables??
just put:

iptables -I INPUT 1 -j LOG
iptables -I OUTPUT 1 -j LOG
iptables -I FORWARD 1 -j LOG

in a script and run it. It pushes a Log-entry as the first rule in the tabl=
e.

Michael

=2D-=20

          SysQuadrat    Systeme mit Sicherheit
    Michael Weinert Stuttgart Filderstadt-Plattenhardt
  Tel.: 0711-9970288 Fax: 5360559 Mobil: 0170-4141273
   http://www.linux-firewall.de  weinert@sys2.de
           KeyServer hkp://pgp.mit.edu

--nextPart1144896.0rtCzHEbqT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iQGlAwUAQrGAdqvpi4/XslceAQIQlQyA7K2z4gOTZE73vCguP0oIt08wlKDob0Cr
Jn8vrkU6O5hqXcK9e9gMnnEfJOD9CUcROxAo4RcTF8H9dlsE7bKcE/oNDkl2dbqw
NNZ0k9bPGL5XxHZlYfazBI9Yh/5puedE8vvTrQXlzGGiN2/xO+PKhunYtzKwYocp
SQtPr0NFj7uXSHo8alVRZNU9iFshFfeeIwN61T4I8OzNIJgFOdQBr2zp3A4zTaHU
vA7AFcm/AWw0q6pTYtLIEi7UWRpugG04x3cBP0XfWyZN0dAUvjK7sx1NtiN/e7am
UA865gcTqlY794SWMHZTtClOXhexhRQywcYSwPdWBuH55n1lPYl8Alp1FjStXCdP
XsF62K8xPLKi5wsiiR6kwhjd8daxjMx62N9c+P8/z2gODJ8B0d1jIjmk4E552CC6
OsGVdta5SaQ0j36jPBIMm5qfYWfwyf/uLmDcZCZEIRRIn6r7mDiFPgWaJgUq3Die
WIRZc4rB25JpuTYUMyU0C/trlVu9oH/XsXbwl86S0lfE3JpfAehr1Q==
=Zdb7
-----END PGP SIGNATURE-----

--nextPart1144896.0rtCzHEbqT--

