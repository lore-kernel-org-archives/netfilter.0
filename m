From: Mariusz Kruk <kruk@rdc.pl>
Subject: Re: dnat to multiple destination
Date: Wed, 26 Oct 2005 16:10:39 +0200
Message-ID: <435F8E5F.50408@rdc.pl>
References: <20051026140258.79270.qmail@web53313.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051026140258.79270.qmail@web53313.mail.yahoo.com>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@lists.netfilter.org

=C2=B0=C2=B0 =C3=BE=C3=A3=C3=BE=C3=A3 =C3=9F=C3=AAr=C3=BB=C3=A2=C3=B1g =C2=
=B0=C2=B0 napisa=C5=82(a):
> iptables -A PREROUTING -s xxx.xxx.xxx.xxx -p tcp
> --dport 80 -j DNAT --to-destination aaa.aaa.aaa.aaa
> --to-destination bbb.bbb.bbb.bbb
>=20
> but it says invalid arguments.
> which part was wrong ?

try [...]-p tcp -m tcp --dport 80[...]

