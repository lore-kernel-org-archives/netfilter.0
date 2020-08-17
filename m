From: Mario V Guenzi <jclark@tiscali.it>
Subject: Re: Grammar in a bash script
Date: Mon, 17 Aug 2020 10:09:48 +0200
Message-ID: <681adee0-91f7-506b-d8f7-c3f270e613aa@tiscali.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="96n5W2AvyXMOSdZcgTLX5BPnmFbLh3nQQ"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tiscali.it; s=smtp;
        t=1597651794; bh=imaX9kpN/PZLc0qtC5z2bdGgfjrwYbSzuskM5XWu7sE=;
        h=Subject:To:Cc:From:Date;
        b=laChM/DsUQac/r1YJ7/glR3cxOquoSRZVUX3LyhWkYKAu3yqERNYg9XLJQHcqq33r
         2dqAMxKQjeI0dPb0xOaj6LMQE8n4eMzRCui3LP4Xsnp4+IXz1g1igU+nMd3CaZlpP+
         4p9BWXJvw9RqEHchIXRPAdTJ/EryJhlceNKS4TZc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Netfilter list <netfilter@vger.kernel.org>
Cc: david@hajes.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--96n5W2AvyXMOSdZcgTLX5BPnmFbLh3nQQ
Content-Type: multipart/mixed; boundary="cYrrh76bDo8J5Np4HNU9ySSLwsL1eNAzx"

--cYrrh76bDo8J5Np4HNU9ySSLwsL1eNAzx
Content-Type: text/plain; charset=utf-8
Content-Language: it-IT
Content-Transfer-Encoding: quoted-printable

Il 17/08/20 09:58, david@hajes.org ha scritto:
> Standard firewall strategy - policy DROP all and allow only what you re=
ally need.
yes, but if I put drop as default policy it doesn't even let me access
via ssh, that's why I was forced not to put policy and then drop with
the rules, and for this, once finished I wanted to further close
Sorry for my poor english


--cYrrh76bDo8J5Np4HNU9ySSLwsL1eNAzx--

--96n5W2AvyXMOSdZcgTLX5BPnmFbLh3nQQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTq04Bmf6EVqIWOKVubqqzVmQ2sigUCXzo7TAAKCRCbqqzVmQ2s
ijveAJ9Wf3sYxjuotnplIfXqpNTmAOM7pACfRLIQyMmVo/2x67v2iX3wD4ldtT0=
=PUA/
-----END PGP SIGNATURE-----

--96n5W2AvyXMOSdZcgTLX5BPnmFbLh3nQQ--
