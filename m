From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Redirect for transparent proxy does not work with https
Date: 21 Mar 2003 19:30:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048271413.3279.2.camel@elendil.intranet.cartel-securite.net>
References: <20030321175750.6512.qmail@hm36.locaweb.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030321175750.6512.qmail@hm36.locaweb.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: "Luis Fernando C. Talora" <talora-listas@talora.com.br>
Cc: netfilter@lists.netfilter.org

Le ven 21/03/2003 =E0 18:57, Luis Fernando C. Talora a =E9crit :
> I've tried to use RedHat Linux 8.0 to build a transparent proxy with
> squid (squid-2.4.STABLE7-4) and netfilter (iptables-1.2.6a-2). Squid
> is listening on port 8080. When a http packet arrives, the requisition
> appears on squid log and the page is viewed nicely. When a https
> requisition is made, squid seem not to recieve the redirection from
> netfilter, though. The nat rule used for redirection follows:
>=20
>       iptables -t nat A PREROUTING -i $EXTERNAL_INTERFACE -p tcp -d !
> $INTERNAL_NETWORK -m multiport --dports 80,443 -j REDIRECT --to-port
> 8080

Afaik, HTTPS cannot be proxied transparently as client must issue a
CONNECT method to have the proxy fall back into TCP relay mode. Or you
use kind of SSL certificate replacement...

You problem can be related to this.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


