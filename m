From: Alexandros Papadopoulos <apapadop@cmu.edu>
Subject: Re: non-standard FTP ports and connection tracking (redux)
Date: Tue, 10 Dec 2002 11:18:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212101118.53239.apapadop@cmu.edu>
References: <Pine.LNX.4.33.0212100943130.9625-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_GZVW8XG9TQRMMPCSE81F"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0212100943130.9625-100000@blackhole.kfki.hu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org


--------------Boundary-00=_GZVW8XG9TQRMMPCSE81F
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tuesday 10 December 2002 03:46, Jozsef Kadlecsik wrote:
> On Tue, 10 Dec 2002, Alexandros Papadopoulos wrote:
> > In any case, the relevant rules from the output chain are:
>
>                    ^^^^^^^^^^^^^^
> Isn't there a rule intented for other purposes, which blocks the
> passive data channel?

The default behavior is DROP for all chains, so if these ones don't=20
allow it, then it is blocked. I thought these ones were sufficient. I'm=20
attaching the complete ruleset I'm using.

>
> > I'd bet that the problem is that the SYN request sent from the
> > client to my server gets dropped, though. Seems like a
> > conntrack/INPUT thing.
>
> I'd setup logging rules to see where and why the connection gets
> blocked.
>

I've monitored the packets with Ethereal and seen that the problem is=20
the one mentioned -- the SYN packet from the client that tries to open=20
the data connection (when in passive mode) never makes it through the=20
firewall.

The question is, why doesn't connection tracking pick this up and allow=20
the packet to go through? (since it's a RELATED connection to a=20
preexisting FTP session)

Thanks

- -A
- --=20
http://andrew.cmu.edu/~apapadop/pub_key.asc
3DAD 8435 DB52 F17B 640F  D78C 8260 0CC1 0B75 8265
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE99hPtgmAMwQt1gmURAgCAAJwMh/18DnsMuY3Zp/401XU4itDNbACdEeSj
8vvn0n0ot+Dbc0QuANY4+rY=3D
=3D9dZt
-----END PGP SIGNATURE-----

--------------Boundary-00=_GZVW8XG9TQRMMPCSE81F
Content-Type: application/x-gzip;
  name="rules.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="rules.gz"

H4sICIIS9j0AA3J1bGVzALVXXW/bNhR996+4aAa03WrZUpzE7bABXqw0xtLEsF106ItBS5TNVSJV
kkoaDPvvu6Rk2ZEl2+1aB0iskDz33K/Dq5OTfZ+W+QVv/Vt/MriB67v3U/9P3x+Pbt9CubznNK7D
kCmyiClIqlLBFQUtIGV86bQ6C8Y7NFgJeOY+g9+hk0oRdNSj6nCqOyy973VYkKRzs2XOllxIOidx
3Ii6kIKEAVFafRv25nxuQvDnGkgQ0FSDEpkM0JzINA0hJcEnWjHTbTATCB51kHYnR5rnSHOL9MSV
0eW7MfoTMkmDtV3CA/pNVtY4uSs+txYWJAQqpZCQUKXIkgICadzFBD8+ZOtoiWWm5hZuvs5Cbm2W
SQ6Coy/3VGJqUqJXELFYU2nzHiEBxvEpIhhSxhv9+bkj03l+8FcIRQsAqiR/+qdE+rcVCp6H9EYs
ARmJaJOrV/UpfLWJeF1SmwJRhjsWy3lCpGaEbzsfRTAaAzr6QGRYLfamHDJ0Nj/RqmmsvBWvRhP/
w+Dmpqn9LIcRpkJqQJI8T25bS3QOeUAiwiymxkllCOEj8lhgFkxlaoIlubMwNzgWYN/aPNIppEJq
9Zvnem7rpMaAeOBUWoZXcaZWgAEEaegUwLjH1KmC9pVtDBpTTe2uIFNaJJAv7+z+y+z+SKXI94rM
lMTuto/W9JRqCGlEshhTLmIWPBrtGE7ubL5yhBVhfPf8GEa34/czu7dm8epu8mEwGTYt372flYfr
8lumeDzxJ7h5rbENImt9mZRqgax1kAKmIopYACumtUn3mflYxcXMQL+7TsuGmAZONLQH22bbqQVr
t0N7LAdp/w0Tf4jldznDFS3aa8h9vlxeD0a3RdgO+DLIhdZoxqNeGfKMByIxX1BLYiHSBZbZRjh2
Qjwo7LQVuN6F08UfF9rh9gNDHOPI4PLSH8+2zZoAlvbWUYwk1pykMTGCgbVBlbHF1AofN821Wygl
kwRsT2G88r/+dDb442Y0vfaHryb+zWDmD6t04lg8bIOb5KFwwUpjf2FbY3gANzaaLFJnYtB3PON4
xz0vU9kzn2NNRlsWD9kr8E3r18JPp9dPTNjQDuk9488VJCTAhNs7PNsTzYprnuN6JrLWsNv1em82
NLwKiQmqjIEnlgz9gjXESbw2bD1G0xTwu8pUuNsmuyS87pnjdV3H7TnnfVNnW/9we2clF9frVUJy
sF/WStLcMbZnmlv5bjr7nr38hFyhY3u4baU9FgExipwkGWcByXP/AqvAzB/y0SpuKtm9+PL4sibx
ha09HV1Tani/L4VpY6VWezArhVutmArW9Wy2K+pNYP3uYbDp0Wi93ul+uPHd+PRoNNc9QG767is8
9c72gw1vpyignzNqhup9oFm4VaMH/L2ajeGFqSnCw31VU5WmI1BDoslL+MVmCImnMasZN3Yt1GlQ
8fStV4BhAvmkXNxKRkJRpyTVZsS0lyE+KspDHKqO5Wjq/EcRtEH73wxN8/wohlffg2B+x30fimX1
mZe/vQzMq1fDxb0lrvDA8F0rZIF2hFy+8c69/mG/zNX12jnrO+4ZaqrpvnXL4PFamywx63Y0i+AT
fSzu83SZOgnTDg2zN657euEeY9vtOxf2zjx9vSVSeLjW8mhyWY5nGLwFzvq1t3W9Bpyfn19UYGcU
4yqfjAeZnQeKacV81Sta3GSmgPKR6Ct0p0F51m4UBvDdFVDQ8N8ZhSQLHSJxVgpMHjeeHhHPytGS
xkW3KvxY9iZ/JZoKJH5v/Qfik0sPEhIAAA==

--------------Boundary-00=_GZVW8XG9TQRMMPCSE81F--


