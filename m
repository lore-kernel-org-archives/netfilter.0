From: "Baake, Matthias" <m.baake@porta.de>
Subject: RE: FQDN filtering
Date: Tue, 30 Aug 2005 15:23:41 +0200
Message-ID: <201E6F5AC48C274996A5AD8304FAEF860BFC9E@p001ex03.porta.local>
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
To: rockey dada <rockeydada@yahoo.com>
Cc: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>

hi

afaik it is possible, but the hostname will be resolved if the rule is =
executed.
this means if there is a dns update, the resolved ip may not match the =
hostname you want to filter.
so i would say better be careful

greets

Matthias

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of rockey dada
> Sent: Tuesday, August 30, 2005 2:58 PM
> To: netfilter@lists.netfilter.org
> Subject: FQDN filtering
>=20
>=20
> Is there any way one can use IPTABLES to filter traffic based=20
> on "Fully
> Qualified Domain Names".
>=20
> Rgds
>=20
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around=20
> http://mail.yahoo.com=20
>=20
>=20

