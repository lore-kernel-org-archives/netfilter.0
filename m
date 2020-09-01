From: Mikhail Morfikov <mmorfikov@gmail.com>
Subject: Nftables rules change when network interfaces disappear
Date: Tue, 1 Sep 2020 13:59:51 +0200
Message-ID: <219301a8-70a9-d2d9-f231-1ab9db107e1a@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="cshJ42UqIsYgMMRZ5Su76YHGLvzHs9X5S"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:autocrypt:subject:message-id:disposition-notification-to
         :date:mime-version;
        bh=lXKx2lMp+ONWP8QsnsKgBS4pI3fuJBQY8mkCf+SIEYE=;
        b=q3+A3fTnpTaYsktrV7qYohdaKtZuzvQx2QUSckIQtdMuRvoClU0KUtaOBRsS3z7dMi
         JeBiU62/HEN0Z1JMhGoIC2XgBWrzNoXWvvjhiXiX36ABzf+sXpSelJtvWU+SsO3/g5w0
         pgI8Rk/XASHJqQMh4NI48WyR3/8pv1wL/rRVkyR4QXPV2WKYOYkVFU2/tHewLqtkyGUc
         AfG8uZ2379NHNUNS0xCfOwCUS40j2+oU4S3gVQRYaQNUjsG1HafF5k6VVjIdCW3GwvEo
         X3T+9+lBUxEA0TFIRql60ooJ2H1lUyxhAnX2VlBVPuHP8TrcqzTjeGqhFH1Z97osk7mK
         PweQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cshJ42UqIsYgMMRZ5Su76YHGLvzHs9X5S
Content-Type: multipart/mixed; boundary="OzahTkH3GztERlJ1Hk13bWqvDJrufGclV";
 protected-headers="v1"
From: Mikhail Morfikov <mmorfikov@gmail.com>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-ID: <219301a8-70a9-d2d9-f231-1ab9db107e1a@gmail.com>
Subject: Nftables rules change when network interfaces disappear

--OzahTkH3GztERlJ1Hk13bWqvDJrufGclV
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

I was trying to write some FW policy for VPN and I added the following ru=
les to
my openvpn script:

    nft create chain ip nat force-vpn
    nft add rule ip nat POSTROUTING meta oif ${dev} counter jump force-vp=
n
    nft add rule ip nat force-vpn meta oif ${dev} counter snat ${ifconfig=
_local}

When the VPN connections is being established, the rules do their job, th=
e ${dev}=20
variable is properly resolved and nftables can live with it just fine:

# nft -a list table ip nat

table ip nat { # handle 55
=2E..
        chain POSTROUTING { # handle 3
=2E..
                oif "tun0" counter packets 0 bytes 0 jump force-vpn # han=
dle 20
        }
=2E..
        chain force-vpn { # handle 19
                oif "tun0" counter packets 0 bytes 0 snat to 172.27.100.2=
0 # handle 21
        }
}

But when I close the VPN connection, something weird happens. The above r=
ules=20
now looks like this:

# nft -a list table ip nat

table ip nat { # handle 55
=2E..
        chain POSTROUTING { # handle 3
=2E..
                oif 61 counter packets 0 bytes 0 jump force-vpn # handle =
20
        }
=2E..
        chain force-vpn { # handle 19
                oif 61 counter packets 0 bytes 0 snat to 172.27.100.20 # =
handle 21
        }
}

So the output interface is now 61 and not "tun0" . My script doesn't do a=
nything=20
with the nftables rules when the VPN connection is closing. So the value =
of the=20
output interface magically changed on its own.

The number is the one that can be found in the output of the `ip` command=
 when=20
the interface was created:

# ip addr show
=2E..
61: tun0: ...
=2E..

Is this a bug or is this intended behavior?

---
# nft -v
nftables v0.9.6 (Capital Idea #2)

# cat /proc/version
Linux version 5.8.5-amd64 (morfik@morfikownia) (gcc (Debian 10.2.0-5) 10.=
2.0, GNU ld (GNU Binutils for Debian) 2.35) #2 SMP PREEMPT Thu Aug 27 12:=
08:37 CEST 2020


--OzahTkH3GztERlJ1Hk13bWqvDJrufGclV--

--cshJ42UqIsYgMMRZ5Su76YHGLvzHs9X5S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCX043uAAKCRAy2ctjR5bM
oYL+AQCh5pW29Fy3QuuP0rcVeYjOxd74UeLKDyh1EvC6nLDNIAEA335I++yvMWDl
HXHV/+HgwNsEPntVBfMx9fssbf0hQwQ=
=ZtA1
-----END PGP SIGNATURE-----

--cshJ42UqIsYgMMRZ5Su76YHGLvzHs9X5S--
