From: Andre Costa <brblueser@uol.com.br>
Subject: Re: Question on ICMP
Date: Sun, 26 Jan 2003 12:38:49 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030126123849.4ff8a3bf.brblueser@uol.com.br>
References: <3E3379D8.4050809@optushome.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E3379D8.4050809@optushome.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi folks,

I am not sure 'subtypes' could be ICMP codes, but in case it is indeed,
iptables 1.2.7a help shows:

# iptables -p icmp --help
[...]
ICMP v1.2.7a options:
 --icmp-type [!] typename       match icmp type
                                (or numeric type or type/code)

So, I guess you could say for instance

iptables -A INPUT -p icmp -m icmp --icmp-type 3/0 -j ACCEPT

if you would like to accept ICMP traffic of type 3 (Destination
Unreachable) and code 0 (Destination Net Unreachable).

HTH

Andre

On Sun, 26 Jan 2003 17:02:00 +1100
Santi <nagajuna@optushome.com.au> wrote:

> Hello Guys,
>=20
>      Is it possible to specify icmp type AND subtypes ( in numerical=20
> format )
> in iptables rules ? I know I can easily specify type, but I'm unsure
> about subtypes ..
>=20
>=20
>      Sincerily,
>      Leonardo Rodrigues
>      Solu=E7=F5es IP
>=20
>=20
> Reply: You are able to define icmp subtypes, although I don't think
> that it is possible to do it numerically.
> For help on the types and subtypes issue the command from console:
>=20
> $iptables -p icmp --help
>=20
> This should show you the different types and subtypes that will
> enable you to get finer grain control.
>=20
> Santos.
>=20
>=20


--=20
Andre Oliveira da Costa

