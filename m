From: Mario V Guenzi <jclark@tiscali.it>
Subject: Grammar in a bash script
Date: Mon, 17 Aug 2020 07:55:32 +0200
Message-ID: <74c7c496-2429-8646-6c1a-9454169498ac@tiscali.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="dqitcXzUsVjfCl744EgkKhos7sDn9tB6F"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tiscali.it; s=smtp;
        t=1597643737; bh=4cl4U4y7eWGJtMcoreLc2WgxWanHVijoRqFr4Ww18xI=;
        h=To:From:Subject:Date;
        b=Lw6OKK4uNOsmhMHDW7ZFpfNzOkk2HeKPPMfZqBJ4EbzqYm90EHgtF95wSRm4qx1pm
         tuftEYJWY6JJX/7rs7ITfnqOnD1FEa/sta7eZ1WxBUh6LiEaze3eUjP6G65F/qAKwD
         AjkXr9hoNC6U7ZyZlMbkWYVCI7OZyINverSG5imo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Netfilter list <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dqitcXzUsVjfCl744EgkKhos7sDn9tB6F
Content-Type: multipart/mixed; boundary="aNiIxSNWF8YSMNlTh0CciN7jcbpmyUjvo"

--aNiIxSNWF8YSMNlTh0CciN7jcbpmyUjvo
Content-Type: text/plain; charset=iso-8859-15
Content-Language: it-IT
Content-Transfer-Encoding: quoted-printable

Goodmorning everyone,
Does it make sense to use this kind of grammar in a bash script?

$NFT add table inet firewall
$NFT add table inet nat
$NFT add table netdev noddos

$NFT add chain inet firewall INPUT { type filter hook input priority 0 \;=
  }
$NFT add chain inet firewall OUTPUT { type filter hook output priority 0
\; }
$NFT add chain inet firewall FORWARD { type filter hook forward priority
0 \; }
$NFT add chain inet firewall IPS { type filter hook forward priority 10 \=
; }
$NFT add chain inet firewall POSTROUTING { type filter hook postrouting
priority 0 \; }
$NFT add chain inet firewall SYN-FLOOD { type filter hook input priority
0 \; }
$NFT -- add chain inet  nat PREROUTING { type nat hook prerouting
priority -100 \; }
$NFT add chain inet nat OUTPUT { type nat hook output priority 0 \; }
$NFT add chain inet nat POSTROUTING { type nat hook postrouting priority
100 \; }
$NFT -- add chain netdev noddos ingress { type filter hook ingress
device $EXTIF priority -500 \; }

my rules
my rules
my rules
=2E
=2E
=2E
$NFT add chain inet firewall INPUT { type filter hook input priority 0
\; policy drop \; }
$NFT add chain inet firewall OUTPUT { type filter hook output priority 0
\; policy drop \; }
$NFT add chain inet firewall FORWARD { type filter hook forward priority
0 \; policy drop \; }
$NFT -- add chain inet  nat PREROUTING { type nat hook prerouting
priority -100 \; policy drop \;  }
$NFT add chain inet nat OUTPUT { type nat hook output priority 0
\;policy drop \;  }

The reasoning that I have done and of which I ask for confirmation is,
after having given permission to what I need, I deny everything as a poli=
cy

Thanks in advance to those who want to answer me.


--aNiIxSNWF8YSMNlTh0CciN7jcbpmyUjvo--

--dqitcXzUsVjfCl744EgkKhos7sDn9tB6F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTq04Bmf6EVqIWOKVubqqzVmQ2sigUCXzob1AAKCRCbqqzVmQ2s
itBBAJ9Txpt93MoIRHbk1xrKc7LNLJnU7gCfagYjcUKlVLCYcxjyWbOr0O1yiAA=
=3nyr
-----END PGP SIGNATURE-----

--dqitcXzUsVjfCl744EgkKhos7sDn9tB6F--
