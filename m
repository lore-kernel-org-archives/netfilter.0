From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Need help have some questions...
Date: 25 Aug 2003 07:54:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1061790870.1507.10.camel@kermit>
References: <20030823205158.60796.qmail@web40210.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030823205158.60796.qmail@web40210.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Sam, 2003-08-23 um 22.51 schrieb SBlaze:
> Ralf made some really good points. He says I should use a proxy. Ok so ho=
w do I
> go about proxying my two web sites that are hosted with apache? Honestly =
I'm
> not being sacrastic I really don't know. Going along with what Ramin says=
 is
> the third level of a fully implemented firewall(the application level) am=
 I to
> assume then that it is then to fall to a proxy(I again don't know what so=
rt of
> proxy I need here...not sure squid is what I need) or I would really like=
 to
> ask should it fall to apache(if so anyone know of how to define what apac=
he
> logs?)
Apache can serve as a webserver and as a proxy. You can serve one site
while proxying the other.
>=20
> A question to Ralf about the second lawyer of a firewall. Is a circut rel=
ay
> also known as a bridge?
No. A curcuit relay is something like a very dumb proxy.=20
>=20
> Also a question to Ramin. You make note in that last post of basically de=
aling
> with the HTTP protocol on the HTTP application level.... are you referrei=
ng to
> web server(apache) ?
Probably yes. see above.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

