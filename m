From: Andreas Hainke <andreas.hainke@foteviken.de>
Subject: Re: nftables: Using variables in named sets
Date: Tue, 6 Sep 2016 11:55:02 +0200
Message-ID: <88a1629b-5324-c802-cf9e-ffa64f81a460@foteviken.de>
References: <97002fd1-5d03-64e7-37c0-3807c2c59d37@foteviken.de>
 <20160829160429.GA20024@salvia>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="7igg8RrN9VSnj8iar6eNJrxMfctTs0cx9"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20160829160429.GA20024@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7igg8RrN9VSnj8iar6eNJrxMfctTs0cx9
Content-Type: multipart/mixed; boundary="S0fi5XqEsxriotAk11Mx3iV74jLcLcHIg";
 protected-headers="v1"
From: Andreas Hainke <andreas.hainke@foteviken.de>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org
Message-ID: <88a1629b-5324-c802-cf9e-ffa64f81a460@foteviken.de>
Subject: Re: nftables: Using variables in named sets
References: <97002fd1-5d03-64e7-37c0-3807c2c59d37@foteviken.de>
 <20160829160429.GA20024@salvia>
In-Reply-To: <20160829160429.GA20024@salvia>

--S0fi5XqEsxriotAk11Mx3iV74jLcLcHIg
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Pablo,

thank you for the patch and the hint regarding the simplification of the
ruleset. It's now working as expected.


Kind regards,

Andreas


Am 29.08.2016 um 18:04 schrieb Pablo Neira Ayuso:
> Hi Andreas,
>
> On Mon, Aug 29, 2016 at 01:37:20PM +0200, Andreas Hainke wrote:
>> Hi,
>>
>> I have a question regarding the definition of variables in nft. I have=

>> created two files rules.nft and definitions.nft. The file rules.nft=20
>> contains a ruleset as follows:
>>
>> include "/opt/firewall/filter/definitions.nft"
>> table inet forward {
>> *	   set s-ext-2-int {**
>> **		    type ipv4_addr . inet_service**
>> **		    elements =3D	{ $s-ext-2-int }**
>> **	    }*
>>
>> 	  chain segments {
>> 		  type filter hook forward priority 0; policy drop;
>> 		  ct state established, related accept
>>
>> 		  ip saddr $g_n_int ip daddr $n_dmz ct state new jump
>> int-2-dmz
>> 		  ip saddr $n_dmz ip daddr $g_n_int ct state new jump
>> dmz-2-int
>> 		  ip saddr $g_n_int ip daddr $n_ext ct state new jump
>> int-2-ext
>> 		  ip saddr $n_ext ip daddr $g_n_int ct state new jump
>> ext-2-int
> Not related, but you can represent this is a more performance way
> using maps, just a simplification of the ruleset above:
>
> define g_n_int =3D 1.1.1.1
> define n_dmz =3D 2.2.2.2
> define n_ext =3D 3.3.3.3
>
> table inet forward {
> 	chain int-2-dmz {
> 	}
> 	chain dmz-2-int {
> 	}
> 	chain int-2-ext {
> 	}
> 	chain ext-2-int {
> 	}
>
> 	chain segments {
> 		ct state new ip saddr . ip saddr vmap { \
> 			$g_n_int . $n_dmz : jump int-2-dmz, \
> 			$n_dmz . $g_n_int : jump dmz-2-int, \
> 			$g_n_int . $n_ext : jump int-2-ext, \
> 			$n_ext . $g_n_int : jump ext-2-int
> 		}
> 	}
> }
>
> This is very fast as we use concatenations and maps to find the
> destination chain to jump in O(1), this is scales up nicely.
>
> [...]
>> I can use the variables as expected, except for named sets. Using only=

>> one element in s-ext-2-int is working properly, but as soon as I add a=

>> second element to the variable definition like this:*
>> *
>>
>> *define s-ext-2-int =3D 10.10.10.10 . 25, 10.10.10.10 . 143*
>>
>> I receive the following error while loading the rules using nft -f:
>>
>>
>> In file included from /opt/firewall/filter/ruleset.nft:2:1-41:
>> /opt/firewall/filter/rules.nft:9:38-38: Error: syntax error, unexpecte=
d
>> comma, expecting newline or semicolon
>> n_int tcp dport 22 ct state new accept
>> 				       ^
>> In file included from /opt/firewall/filter/ruleset.nft:2:1-41:
>> /opt/firewall/filter/rules.nft:19:32-42: Error: unknown identifier
>> 's-ext-2-int'
>> 	  elements =3D  { $s-ext-2-int }
>> 				 ^^^^^^^^^^^
>>
>> Is it possible to use variables for named sets, maps, etc. or is this
>> currently not possible?
> I've submitted a patch for nft that I have tested with:
>
> 	define s-ext-2-int =3D { 10.10.10.10 . 25, 10.10.10.10 . 143 }
>
> 	table inet forward {
> 	        set s-ext-2-int {
> 	                type ipv4_addr . inet_service
> 	                elements =3D $s-ext-2-int
> 	        }
> 	}
>
> http://patchwork.ozlabs.org/project/netfilter-devel/list/
>
> Thanks for reporting.



--S0fi5XqEsxriotAk11Mx3iV74jLcLcHIg--

--7igg8RrN9VSnj8iar6eNJrxMfctTs0cx9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJXzpJ6AAoJENMia1VtPcvYeS0QAIZoU9sllaYmJU9vP6o5dmda
eLuzuc4rrPSyWRY0wUTjDUbVBS2+CA1dEbD5N2KA7YQJ4TmYmn00adocMPkgWplc
T6vlbyaULAE/HhUvYNfmEz7zgsgZ4JiSeFMSoMsFRPYUcDgacmrXNZLMEdnW4q7K
tXNrcct+SflCLxDM417eksPW+Yzsv4U3bc1tfyJ9iuNKnBiJ5upfel876BDkIJR2
X06dSY18+wWllP45rUVYC010vIAOv6bYz8fRiWiuHPywWU4M7KnM8z+Uz5lkuB3V
qq88ZdLQSaYhtEZVLhgAvzSe5xmOo+Kn/I/f46pyzzvofV/FI19GZqSRrot/Vnej
xPkF9jKXi0QQA78D9PRMns6MKBcNtsKHLoOPOyJSx6RmsVpB1tM7vN/l6p8rop7f
AFJ3g3rR7Uy+pnljL9xzEg8oniraoISepC0V9/M1ahtDSWF2bQDI2GfPJ+Xvh7oh
EIjEURzVo/4oYiJICZVYiwW1W94v5gxVFxdr9LZahZ6Pi+gpmE83axAvfQQ+G3v0
7uXzvnMmcIzB1qpubv+3D4S2KE4xtS8c8RBLLn0hOuWhwCBz9GU7hl07EzHs8j2S
fh8eGpVVJ38Lq6c8WIApOT1iNAWg5rNloeghRPvZWOGZ6HeJpFUpVf0i3WG01kv3
2Xc7vPUQZeFP8zmCA4lJ
=4c/o
-----END PGP SIGNATURE-----

--7igg8RrN9VSnj8iar6eNJrxMfctTs0cx9--
