From: Lopsch <lopsch@lopsch.com>
Subject: Re: questions about chain traversal, new ascii diagram
Date: Thu, 06 Jan 2005 18:49:09 +0100
Message-ID: <41DD7A15.6050405@lopsch.com>
References: <BAY101-F121798A658C0B56334F8D7DF930@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigEDF92E7135B09F9E6E0CB421"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY101-F121798A658C0B56334F8D7DF930@phx.gbl>
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
To: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigEDF92E7135B09F9E6E0CB421
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Curby . schrieb:
> Hi, I'm in the process of building a three-interface firewall and I have
> some questions about how the different chains see NAT packets and
> locally-generated packets.
>
> Firstly, if I just do filtering in the INPUT/OUTPUT chains, NAT-ed
> packets will not traverse those chains, so I figure I should probably
> put similar filtering rules in the FORWARD chain? (For example, I'd like
> to be able to block all my internal users from accessing certain sites,
> or block incoming traffic sent by bad hosts from being port-forwarded to
> internal servers).
>
> If I was trying to block incoming traffic from bad hosts, why not simply
> put the filters in the PREROUTING chain instead of both INPUT and
> FORWARD?  Is it because the nat table is intended for just nat and doing
> filtering there would be ugly, or would it actually fail to work?
>
> I read in http://davidcoulson.net/writing/lxf/14/iptables.pdf (on the
> netfilter.org documentation page) that nat's OUTPUT chain performs DNAT
> on outgoing packets originating from the server, and POSTROUTING
> performs SNAT on outgoing packets passing through the firewall from
> other hosts.  If I have two Internet-facing IPs and would like to SNAT
> locally-generated traffic to one or the other, it would appear that
> iptables wouldn't let me do that very easily, right?  What is the
> purpose of nat's OUTPUT chain (in other words, when would I want to DNAT
> locally-generated traffic)?
>
> In what order does locally-generated traffic traverse the OUTPUT chains
> of filter and nat tables?
>
> Lastly, aside from those issues, is the diagram below a reasonable
> representation?  The only diagrams I found on chain traversal dealt with
> the nat and filter tables separately, but I'm hoping that it's possible
> to show them together.  (I hope hotmail doesn't completely destroy this
> ascii hehe).
>
> # -->n.PREROUT-->routing decision-->f.FORWARD-->n.POSTROUT--,-->
> #                       |                     ,-------------^
> #                       v                     |
> #                     f.INPUT              f.OUTPUT, n.OUTPUT
> #                       |                     ^
> #                       `--->local process----'
>
> Thanks!
>
> --curby
>
>
http://joerg.fruehbrodt.bei.t-online.de/pics/abb3_netfilter_ablaufdiagramm.jpg

What about the mangle decisions, do you also want to include them :D?

--

PGP-ID 0xF8EAF138

--------------enigEDF92E7135B09F9E6E0CB421
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1-nr1 (Windows XP)

iQIVAwUBQd16GCXe0Lt4Z4FpAQJKoxAAgzZw2EDMkU3jzAtbrsZ9wdMKUWa6y+Ca
9+mO4fK2qtfPBivUmBzRszq3/MqlirnouwskBArUoQXtZV6JMe7b/Iw+zDjeHhFM
bGQUdY6zb2jsABTvD+eRk2+iP075YjX01fbe00DNTor/yQ1yh5/MQSvdMKxbrmFE
dA05cUgEZDGyESTpC+gUL/ssv/JS0U86zUbC2/S4yqgYBgQeaSDqWbErm4VaEfNj
GNCj1MAJ+1sXbTFAp3/tYKF0aj8//bp84zdDel1IEkD0WKOw7o46WLdagwBwdFYm
uFptEN2dOK9x7A2ZpFzvXPLXePbBRWcw8/kX7zFWSDLHvaq+0lEEVlS+DFryj892
0HTj7r17BcWbwdupP6dr0LS16tJwIu8PcUyCyg/1gW66uJ72u9PL+ErR2nI1lojD
Q3pS5KqcmQlSu4OuwiGk+q3orzm+2KLhkbVkzR6RO1OQr6uF64LQgArfep7XFN5L
tedw054DTsT1EH0NputGHkK7MzBllXY1Oafp339YcPUsL/cyzZVB43D/xceEEM2W
WWPkunY/JYMLK5m9iaRibYApCEv/9YF8BPUubN/mQwU00im7nzij/4LtmyiYmkxa
jS/It/AF3go/QpHlmPydmDoXTtXYVRhIR9/XUyoROtj5G72nrFWp0rgfxoP3OXO+
hhvJwhtj3U8=
=EuDR
-----END PGP SIGNATURE-----

--------------enigEDF92E7135B09F9E6E0CB421--

