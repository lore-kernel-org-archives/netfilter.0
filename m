From: Andreas Hainke <andreas.hainke@foteviken.de>
Subject: nftables: Intervals inside of maps?
Date: Thu, 15 Sep 2016 14:13:55 +0200
Message-ID: <98f722ce-a936-015f-e90c-bd95eb27b9ba@foteviken.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="sPQ6jLwok4Jgxhs7poLvKTT69KDlqDeA3"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sPQ6jLwok4Jgxhs7poLvKTT69KDlqDeA3
Content-Type: multipart/mixed; boundary="IODJTMCaM6v6XemE6AldCmHxPXCtuHLOk";
 protected-headers="v1"
From: Andreas Hainke <andreas.hainke@foteviken.de>
To: netfilter@vger.kernel.org
Message-ID: <98f722ce-a936-015f-e90c-bd95eb27b9ba@foteviken.de>
Subject: nftables: Intervals inside of maps?

--IODJTMCaM6v6XemE6AldCmHxPXCtuHLOk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

does anybody know if it's possible to use intervals inside of maps?
Pablo already pointed out that it is possible to use maps as follows to
handle rule processing more efficient:

nft add rule test myChain ip saddr . ip daddr vmap { 10.10.10.15 .
10.10.20.5 : accept, 10.10.10.1 . 10.10.20.1 : accept}

table ip test {
    chain myChain {
        ip saddr . ip daddr vmap { 10.10.10.15 . 10.10.20.5 : accept,
10.10.10.1 . 10.10.20.1 : accept}
    }
}



If I try to use intervals in maps the same way, I receive the following
output:

root@fw:~# nft add rule test myChain ip saddr . ip daddr vmap {
10.10.10.0/24 . 10.10.20.0/24 : accept }
<cmdline>:1:64-64: Error: syntax error, unexpected ., expecting colon
add rule test myChain ip saddr . ip daddr vmap { 10.10.10.0/24 .
10.10.20.0/24 : accept }
                                     =20
                                                              ^


I also tried to add a map using the flag interval which will be
converted into a set without a verdict like this:

root@fw:~# nft list ruleset
table ip test {
    chain myChain {
    }
}
root@fw:~# nft add map test myMap { type ipv4_addr . ipv4_addr : verdict
\; flags interval \; }
root@fw:~# nft list ruleset
table ip test {
    set myMap {
        type ipv4_addr . ipv4_addr
        flags interval
    }

    chain myChain {
    }
}
root@fw:~#


So I guess using intervals inside of maps is currently not supported, is
this correct?

Kind regards
Andreas


--IODJTMCaM6v6XemE6AldCmHxPXCtuHLOk--

--sPQ6jLwok4Jgxhs7poLvKTT69KDlqDeA3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJX2pCGAAoJENMia1VtPcvYj5IP/iiIl1pvWHO5caLmmKpC67Ko
UAK5OoTXHKd+28ihhoXQUdfremDTskHYIE36AutSo2h3smt9AFduoXB7AcLrT0yj
TX0ER6fKrRa2Ayf9LIc2LUFE7H86Iun/VqzvwF5o8L5V06CBcb+cCImagLyR0gVh
cLQJ5uw1gQVEcJ0X8yzbxf1eRivc6Br1gkCm9p2FOYKVL6BZii/T+U6IZfXq8Ljy
aGN0hXyxw0CazsQ66JOqyDB/snkXt0j2wJ9YO/Y38+4wQWpZkeoan30aF5fPLNlw
G0Px/Hd9928w6MIywh9+6dXQgovhZqHX/nmtrb8O4uGsLaYhtuZCvHJfbcvqknCL
ZSXThZe67VVf3d6TSgSmdvLvhkZwsRD5EWaMl2LF94BPfmNVw1o2m0l9YIYPUU0/
nW8FoWF0AQnaYTEEmG3l7RM3i3pGHFzXEzGQaPQ3/rFH8vgim0BpkR+4HX1TUTne
moAHtb/UZnh/syc4PcSWsUrOxWFPHJrfV4OTeIWkzL4TrVN3RrDZBYqFWDOaxlbb
YGMZ+qIjwrltz2IsXNSR4B9rn7Eb90njVwpGTBpQLqaMINTHHHAEqRvdGxtVzgaf
e1tQevglMFSGwkGizuxpbUh7CKVxZkVLsErW4tJQ5tOpgTCJ9z84sEnQOyrVmZNo
j8Q5SCKl30g0/mzuCyc4
=Nk6s
-----END PGP SIGNATURE-----

--sPQ6jLwok4Jgxhs7poLvKTT69KDlqDeA3--
