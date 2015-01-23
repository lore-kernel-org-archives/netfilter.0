From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Order of iptables vs. ip6tables chains
Date: Fri, 23 Jan 2015 23:59:21 +0100
Message-ID: <54C2D249.9090007@familie-kuntze.de>
References: <20150123223116.GA3522@blackhole.tracing.lan> <54C2CD64.5000104@familie-kuntze.de> <20150123225143.GB3522@blackhole.tracing.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150123225143.GB3522@blackhole.tracing.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Thomas Preissler <thomas@preissler.co.uk>, netfilter@vger.kernel.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello Thomas,

As a packet only has a single protocol on layer three (IPv4/IPv6/...),
it will only pass through the tables and chains for that particular net=
work protocol
It makes no sense to pass an IPv4 packet through rules for IPv6 traffic=
=2E

Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
=46ingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658

Am 23.01.2015 um 23:51 schrieb Thomas Preissler:
> Noel,
>
> On Fri, Jan 23, 2015 at 11:38:28PM +0100, Noel Kuntze wrote:
>> This [1] picture shows where the chains are used.
>> Also, IPv4 traffic is only handled by iptables rules and IPv6 traffi=
c
>> obviously only by ip6tables rules. iptables only handles ip traffic,=
 not decnet or any
>> other fancy layer three protocol.
>
> [1] http://inai.de/images/nf-packet-flow.png
>
> Ah yeah, thanks, I forgot about this picture.
> But where does ip6tables fit in here? Does it first run through the
> whole netfilter stack as in [1], and then for v6, or is it doing it
> in some mixed way:
>
> 1) mangle PREROUTING v4
> 2) mangle PREROUTING v6
> 3) mangle INPUT v4
> 4) mangle INPUT v6
> 5) filter INPUT v4
> 6) filter INPUT v6
>
> and so on (I skipped NAT... as there is no v6 NAT (haha - I know)).
>
> (It is late here and I am tired and I just can't remember why I neede=
d
> to know that.)
>
>
> Cheers
>
> Thomas
>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUwtJGAAoJEDg5KY9j7GZYUX8P/1tMo6JgfL/S2xP7DwO8gYV7
vCrl11wG0LsRW2FzanHaDE3leJiu70qtOk2oao1vN25moxMpIIODyBfu5xE0Y+Z7
pc9X4WHFJHqhICMajZ6CQi/iX82doGFCVQ4t+DnJKb0iNGwK9cs5wW2hQ+nTe7yu
25RNATNyeF+gE/EOJgng6uIHxZTqw/EgaXJu3hZYTN5zkc+gyzf7rDzGge9SzM8g
l0X4Y87F72R0DWAPzuXaDq2bJwa4KY5Lk7pS8BMzzGMK5o37xkmXaqANN8+uBfpx
iKiNWK+enwJ0FTHPq32yId0NrAgqT+7N6fI0DyfInb+bDY9q68C5wS7LRK/RLGCN
HIde0txH4R2sqE1BfyVBGjaE/YhUj6OYxGXAqigj1EhyexOQCwKACBev0jUy4HOp
uvGNK6Ogk+RgB9rNfEbC7x76f7djXYvGDqNS3COwF0/ASz1jqQW+TMDodpdRVWpP
L/UBtCTap0US4DE0780UjnaDu36Io1JSpuHrLSbtv9Glr7QiIssvw2kYi93lPVw5
+TbXvHFPTYAhPz/AOQigqQaRHaXaGRwZFnZogDjVV43GXRmla/IWIYyDI4VzNt+F
2PKbXd24XnlHC50QTqBChcRlntLYwvTAru/17d3k6eYWyREIuvrPqsWSjY4K5fVW
3dNHVlbPN+JzYMdYtxm4
=3DmGs1
-----END PGP SIGNATURE-----

