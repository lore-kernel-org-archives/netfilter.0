From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: PPTP Problem with 2.6.20-rc1 >=
Date: Fri, 19 Jan 2007 11:13:25 +0100
Message-ID: <45B099C5.6060303@plouf.fr.eu.org>
References: <001d01c7399d$66573b30$0301a8c0@hercules.decimalint.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001d01c7399d$66573b30$0301a8c0@hercules.decimalint.pt>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Jorge Bastos a =E9crit :
> I just updated kernel to 2.6.20-rc5, and i can't make pptp connections=20
> anymore, is just stoped in the AUTH step, hanging up witout sucess.
>=20
> I can see that diferent modules are used now, before i used:
> ---
> ip_nat_pptp
> ip_conntrack_pptp
> ---
>=20
> Now there's new modules with new names, like:
> nf_nat_pptp
> nf_conntrack_pptp
>=20
> Are they the same with diferent names?

nf_conntrack is the new layer-3 independent Netfilter connection=20
tracking framework. It supports both IPv4 and IPv6 and is aimed to=20
replace the old ip_conntrack framework which supports only IPv4.=20
nf_conntrack is included in the standard kernel since version 2.6.15,=20
but lacked support for NAT until version 2.6.20 so, as NAT is=20
unfortunately more widely used than IPv6, ip_conntrack was still the=20
default. ip_conntrack and nf_conntrack are mutually exclusive.

If you have trouble with nf_conntrack helper modules, you could rebuid a=20
kernel with nf_conntrack disabled and ip_conntrack enabled.

