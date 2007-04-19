From: Elvir Kuric <omasnjak@yahoo.com>
Subject: Re: Setup of different types of NAT
Date: Thu, 19 Apr 2007 06:06:48 -0700 (PDT)
Message-ID: <235535.26076.qm@web56203.mail.re3.yahoo.com>
References: <4625E078.1020301@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4625E078.1020301@gmail.com>
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
To: Pedro =?unknown-8bit?q?Gon=E7alves?= <pedro.pandre@gmail.com>, Mail List - Netfilter <netfilter@lists.netfilter.org>

Hi Pedro,=20
what is Cone? Some abbervation or what else ?
Please for clearability describe what you want achieve
using NAT?

Regards=20

Elvir Kuric=20

--- Pedro Gon=E7alves <pedro.pandre@gmail.com> wrote:

> Hello everyone
>=20
> I want to know *how to* setup this types of NAT:
> /-Full Cone NAT/
> /-Restricted Cone NAT/
> /-Port Restricted Cone NAT/
> /-Symmetric NAT/
>=20
> Using iptables, I set all policies to "ACCEPT" and I
> was able to setup=20
> two kinds of NAT:
> (192.168.2.170 is my "public" address and 10.0.0.1
> is my "private" address
>=20
> /-"Full Cone NAT", with the following rules:/
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT
> --to-source 192.168.2.170
> iptables -t nat -A PREROUTING -i eth0 -j DNAT
> --to-destination 10.0.0.1
>=20
>=20
> /-"Port Restricted Cone NAT", with just a single
> rule:/
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT
> --to-source 192.168.2.170/
>=20
> /
> Now does anyone know how to setup Restricted Cone
> NAT and Symmetric NAT?
>=20
> Thanks in advance
> Pedro
> //
>=20
>=20


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around=20
http://mail.yahoo.com=20

