From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Setup of different types of NAT
Date: Thu, 19 Apr 2007 21:49:19 +0200
Message-ID: <4627C7BF.5000406@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Hello,

Pedro Gon=E7alves a =E9crit :
>=20
> I want to know *how to* setup this types of NAT:
> /-Full Cone NAT/
> /-Restricted Cone NAT/
> /-Port Restricted Cone NAT/
> /-Symmetric NAT/

Again ? I thought I already answered the last time you asked.

> Using iptables, I set all policies to "ACCEPT" and I was able to setup=20
> two kinds of NAT:
> (192.168.2.170 is my "public" address and 10.0.0.1 is my "private" addr=
ess
[...]
> /-"Port Restricted Cone NAT", with just a single rule:/
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.2.17=
0/

This is "symmetric NAT", not "restricted cone NAT".

> Now does anyone know how to setup Restricted Cone NAT and Symmetric NAT=
?

AFAIK, you cannot do "restricted cone NAT" nor "port restricted cone=20
NAT" with the stock Netfilter/iptables. It would require dedicated=20
conntrack and NAT helper modules.

