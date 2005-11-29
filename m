From: "Baake, Matthias" <m.baake@porta.de>
Subject: RE: what happens after ip_conntrack_max is reached?
Date: Tue, 29 Nov 2005 10:56:58 +0100
Message-ID: <201E6F5AC48C274996A5AD8304FAEF860BFEB5@p001ex03.porta.local>
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
To: Lihua Yuan <lihua.yuan@gmail.com>
Cc: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>

Hello,

if the conntrack Limit is reached, the Machine does not accept new =
Connections that would end up in the Connection Tracking Table as far as =
i know. At least that's what i noticed. It seems that the machine slows =
down but it just not accept new Connection until there is Space =
available.

greets

Matthias

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Lihua Yuan
> Sent: Tuesday, November 29, 2005 10:49 AM
> To: netfilter@lists.netfilter.org
> Subject: what happens after ip_conntrack_max is reached?
>=20
>=20
> Hi,
>     I'm wondering what happens after ip_conntrack_max is reached?
> Reading the archive, I understand the UNREPLIED entries are removed in
> favor of new connection. But other than that, it seems that new
> connections will simply be dropped?  If this is the case, then new
> clients might not be able to make a connection at all?
>=20
>=20
> thanks for your help
> Lihua
>=20
>=20

