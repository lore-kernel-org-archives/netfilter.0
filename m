From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: connection track == stateful inspection(Check Point Firewall)???
Date: 22 Feb 2003 11:37:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045910276.2713.2.camel@kermit.spenneberg.de>
References: <20030222032746.18033.qmail@web15206.mail.bjs.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030222032746.18033.qmail@web15206.mail.bjs.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: Dig Harry <digharry@yahoo.com.cn>, Netfilter <netfilter@lists.netfilter.org>

Am Sam, 2003-02-22 um 04.27 schrieb Dig Harry:
>=20
> connection track(Iptables) and stateful
> inspection(Check Point Firewall) is same???
No it is not the same. Connection tracking just tracks the connection
and can decide whether a packet belongs to a connection or not, but does
no intelligent filtering. This is the same between FW1 and iptables.

Stateful inspection is implemented in netfilter too, using specific
modules, like ip_conntrack_ftp, ip_conntrack_h323 etc.
It is not as advanced as in FW-1, meaning FW-1 supports more protocols
and actually content inspection.

Cheers,

Ralf
> I think:
> connection track is only "track", can not filter.
> stateful inspection can filter according to the packet
> information.
> Is that correct?
> what is the difference between connection track and
> stateful inspection???
>=20
> _________________________________________________________
> Do You Yahoo!?=20
> "=E7=94=A8=E9=9B=85=E8=99=8E=E6=90=9C=E7=B4=A2=EF=BC=8C=E6=89=BE=E5=88=B0=
=E5=85=B3=E4=BA=8E=E5=A5=A5=E6=96=AF=E5=8D=A1=E7=9A=84=E4=B8=80=E5=88=87"
> http://cn.search.yahoo.com/search/cn?p=3D%b0%c2%cb%b9%bf%a8
--=20
Ralf Spenneberg
RHCE, RHCX

IPsec/PPTP Kernels for Red Hat Linux: =20
http://www.spenneberg.com/.net/.org/.de
Honeynet Project Mirror:                http://honeynet.spenneberg.org
Snort Mirror:                           http://snort.spenneberg.org

