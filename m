From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: RE: Port 21, 23, and 80 are open according to Shields Up at grc.com
Date: 13 Sep 2004 18:04:16 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095091456.6971.4.camel@nostromo.bgsecm.com>
References: <C8DE82BEF24D0146862937D2A9DD0E92254489@qlmail2.qlogitek.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <C8DE82BEF24D0146862937D2A9DD0E92254489@qlmail2.qlogitek.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El lun, 13 de 09 de 2004 a las 17:21, Miguel Laborde escribi=C3=B3:
> Something else you can try is using the lsof command.
>=20
> Give lsof -i tcp:21 a try and see what it returns. If you have somethin=
g running on that port it will tell you its name and PID.
>=20
> Regards,
>=20
> 	Miguel

Another option is using the nmap -sV option that will tell you
the version of the program that it's listening on that port.

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


