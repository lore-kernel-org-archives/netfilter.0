From: Djalma Fadel Junior <dfadel@ferasoft.com.br>
Subject: Re: Possible conntrack problem
Date: Sat, 3 Jun 2006 19:04:11 -0300
Message-ID: <20060603190411.7108369a@phadell.org>
References: <20060602_184642_048181.zottmann@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060602_184642_048181.zottmann@ig.com.br>
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
To: netfilter@lists.netfilter.org

On Fri, 2 Jun 2006 15:46:42 -0300
zottmann <zottmann@ig.com.br> wrote:

> Hi !!=20
>=20
> We are seeing a lot of packets being blocked at our firewall, coming from=
=20
> our webserver, port 80, going to the several hosts at the Internet, at hi=
gh=20
> ports, with both SET and ACK set.=20
>=20
> It seems that these packets are answers from our webserver to connections=
=20
> estabilished to it, and, for some reason, their state is not being kept.=
=20
>=20
> How can I track this problem?=20
>=20
> We are using iptables 1.3.1, kernel 2.6.11.12, in a Fedora Core 3 machine=
.=20

I'm facing the same problem on port 3128.
I guess that may be some kind of virus/worm that use ports like 80,1080,808=
0,3128 for spam purpose. They use any HTTP port to connect on mail servers =
and send bulk email.

My conntrack table was getting flooded and I set 2 rules, but the problem k=
eeps on.

iptables -t nat -I PREROUTING -p tcp ! --syn -m state --state NEW -j DROP
iptables -I FORWARD -d ${MY_NETWORK} -p tcp --dport 3128 -m state --state N=
EW -j DROP


any effective solution would be appreciated.

thanks


--=20
Djalma Fadel Junior
Diretor T=E9cnico
Ferasoft Corporation Ltda
+55 (19) 3542-3490
dfadel@ferasoft.com.br

