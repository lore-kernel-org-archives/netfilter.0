From: "Baake, Matthias" <m.baake@porta.de>
Subject: RE: ip + mac filtering
Date: Mon, 20 Jun 2005 17:17:05 +0200
Message-ID: <201E6F5AC48C274996A5AD8304FAEF869B37@p001ex03.porta.local>
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
Content-Type: text/plain; charset="us-ascii"
To: varun_saa@vsnl.net
Cc: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>

You can filter by mac addresses with the module mac

a sample could be

iptables -A FORWARD -m mac --mac-source ff:ff:ff:ff:ff:ff -j DROP

/cmb

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of
> varun_saa@vsnl.net
> Sent: Monday, June 20, 2005 5:05 PM
> To: netfilter@lists.netfilter.org
> Subject: ip + mac filtering
>=20
>=20
> Hello,=20
>      I want to do IP filtering as well as =20
> MAC filtering.=20
> =20
> If I were to right seperate set of rules for=20
> IP and MAC filtering. Will there be any problem ?=20
> =20
> Thanks in advance=20
> =20
> Varun=20
> =20
> =20
>=20
>=20
>=20

