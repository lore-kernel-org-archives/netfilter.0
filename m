From: Askar <askarali@gmail.com>
Subject: Re: Target ROUTE
Date: Fri, 7 Jan 2005 16:32:19 +0500
Message-ID: <a0f69e50501070332637519af@mail.gmail.com>
References: <20050105092351.2652e925@jcesar.fnde.gov.br>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050105092351.2652e925@jcesar.fnde.gov.br>
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?J=FAlio_C=E9sar_de_Magalh=E3es?= <jcesar@fnde.gov.br>
Cc: netfilter@lists.netfilter.org

why not using MARKing feature of iptables and then route the marked
packet via iproute2 like...
#iptables -A PREROUTING -i eth0 -t mangle  -p tcp  --dport 995 -j MARK
--set-mark 4

this is iproute2 part

ip rule add fwmark 4 table another.out
ip route add default via $GATEWAY dev eth0 table another.out
ip route flush cache


regards

On Wed, 5 Jan 2005 09:23:51 -0200, J=FAlio C=E9sar de Magalh=E3es
<jcesar@fnde.gov.br> wrote:
> i need all my network trafic to any host on 995 port goes to another gate=
way then the default. So i execute the following iptables command:
> iptables -t mangle -A OUTPUT -p tcp --dport  995 -j ROUTE --gw x.x.x.x
> where x.x.x.x is my another gateway .
>=20
> The problem  when i execute the iptables command above is this:
> iptables: No chain/target/match by that name
>=20
> thanks a lot
>=20
> J=FAlio C=E9sar de Magalh=E3es
> Analista de Suporte - Poliedro/FNDE
> (61) 81177547 Bras=EDlia - DF
>=20
>=20


--=20
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

