From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: PPTP conntrack
Date: Mon, 14 Oct 2002 12:12:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615F7E@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Rickard Eriksson <riceri@home.se>, netfilter@lists.netfilter.org

Hi,

Rickard Eriksson [mailto:riceri@home.se] wrote
>=20
> When i try to use pptp conntrack module and the proto gre=20
> module i get=20
> this in the log file, anyone know what can be wrong?
>=20
>=20
> kernel: ip_conntrack_pptp.c: bad csum

I can't help you with this message. You may want to enable debugging
in the relevant netfilter modules (gre and pptp) by changing the
#if 0
into
#if 1
and recompiling, then posting this info to netfilter-devel
if the problem persists.

Are you actually experiencing connection problems with PPTP ?

> kernel: ASSERT ip_conntrack_core.c:94 &ip_conntrack_lock readlocked
> kernel: ASSERT ip_conntrack_core.c:1067 &ip_conntrack_lock=20
> not readlocked
> kernel: ASSERT ip_conntrack_core.c:1076 &ip_conntrack_lock=20
> not readlocked
> kernel: ASSERT: ip_nat_core.c:839 &ip_conntrack_lock not readlocked
> kernel: ASSERT ip_conntrack_core.c:94 &ip_conntrack_lock readlocked
> kernel: ASSERT: ip_nat_core.c:839 &ip_conntrack_lock not readlocked
> kernel: ASSERT ip_conntrack_core.c:94 &ip_conntrack_lock readlocked
> kernel: ASSERT: ip_nat_core.c:839 &ip_conntrack_lock not readlocked
> kernel: ASSERT ip_conntrack_core.c:94 &ip_conntrack_lock readlocked
> kernel: ASSERT: ip_nat_core.c:839 &ip_conntrack_lock not readlocked
>=20

Apparently these are annoying, but harmless messages. See this
thread on netfilter-devel:

http://lists.netfilter.org/pipermail/netfilter-devel/2002-October/009517
.html

Regards,
Filip

