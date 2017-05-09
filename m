From: Maxime de Roucy <maxime.deroucy@gmail.com>
Subject: nftables: Request for comments - packet flow diagram
Date: Tue, 09 May 2017 21:38:03 +0200
Message-ID: <1494358682.1866.2.camel@gmail.com>
Reply-To: maxime.deroucy@gmail.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-v3Kh4JmZ+b+gop10WgpA"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:reply-to:to:date:mime-version;
        bh=0HtvKcd8Eo4L7+su3I6pIj4waDlpkp5s4BpTFtyfyLw=;
        b=VyyfSR5RE5wQXhRmTraa0Bet7c1ReSp0r4MPQDyC92i4qMQVfbTquOL7RvXsEX+Yzo
         j+TQx6YhMd6XekzwB9QIphgIWXV9JpW4gKuCW3KKRHBO/JBAEm26SRuq9taH/F59ilnA
         775+8Lu8eaeYNfPElGIlFJ7SNj6FwqbYqJdn3JJOGBjgkR1aakCfyH2GPWnO34v8wqJU
         gqSh270UasFMYnAeDmRgVAclKEbIruJHC09553/6pEluWCPQ3yHBjoy0ukBZnJdV/DWc
         q6x34D5aZUoEDxDOa0+IQkf8oZNYmBC3a6nz7wedumg72AcDJZ7kTZh5FYl9kb9CvXRJ
         bkpA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-v3Kh4JmZ+b+gop10WgpA
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello,

I recently switch from iptables to nftables (I have a very
simple/personal firewall).

When I built my iptables firewall I refereed to the packet flow diagram
(by Jan Engelhardt) on iptables Wikipedia web page :=A0
https://en.wikipedia.org/wiki/Iptables#/media/File:Netfilter-packet-flow.sv=
g

Using this diagram for nftables firewall is hard as some concept
changed.

I did some tests and draw my own diagram (using yed editor) covering
all netdev, ip, ip6, inet, bridge and arp tables :

https://pelican.craoc.fr/#packet-flow

Direct URL and yed sources :
 * https://pelican.craoc.fr/images/packet_flow.svg
 * https://pelican.craoc.fr/images/packet_flow.graphml

Can you please verify it ? Feedback would be much appreciated :)
I am not a network expert but the subject interest me and I would like
to know if I misunderstand something.

I put this diagram on CC-BY-SA license so feel free to use/modify it if
you like.

Note: I draw an arp-forward-filter chain in the diagram because I can
create one, but I can't actually saw any packet going through it.
I think it's a bug, so I draw it anyway. More informations :

 * https://pelican.craoc.fr/#arp-vm1-vm2
 * http://marc.info/?l=3Dnetfilter&m=3D149410713429067
--=20
Regards
Maxime de Roucy
--=-v3Kh4JmZ+b+gop10WgpA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEER5gczwOKW0gcs6kxEf8YVWxR9N0FAlkSGpoACgkQEf8YVWxR
9N0XdhAAgZhzjIwfSslMKhANxqgCePVP5w6Q5448D0dCzqjJTmKb6tHo14AzIGQO
sul05WT5CWOalMirZZfQCqJ1F5cw0UAW3fR6kU283iFzR7TtlM2EtJmUAtMKLug1
tpIMZetdw5kb8ESZUa/okyVw9Vj9iNK8xe7KDNW4tP3yAjBxxvUsZMAAdpswyE+L
9kcNsFJIsb5x9+uRMjzjElZNTUlKqdmfuXfvUCCkz0FTCGr2YRLFo9fsKP41o+iR
vorsKlBd4Av2sWnxRDxblyhLyrEFC+IS3grF5Hu8tyXunVtM1FJoP0R+ndYkyEsM
2SV4obWUEhRKu5aKW6QL9Ftuv8OGQO62VU0+SkcPgZ8+DTTSPN3xZbJyeUtwyg1p
4azrjHN+/kuldj1Jiy3jUjVTcBoXpLrUDD5k5u1ZxyUnraCPQciQyD4C6412ohE6
F+0aNm73ww4qVlH12qeGOKuThUZtXI/Zg7p562P380Qm2dE0O1Ypt/aMwMgHyRI1
M0o+BpkiHBjZ3ff+xsPZyH8w35eFeQ1fET/Fu+HFqoNcZyI5rS6WEWXBowSxYcbe
1WGTgPkNM8Kxgjc1O8xOb7DqgKnvJXAYd+QHFs+Hz79SkUD7D2C916dtidupDnDn
s1J4pT18wam1MfZp6kXbG+PQqyVKYUVaVz4d8RSEA75wKQdm9Os=
=FFPY
-----END PGP SIGNATURE-----

--=-v3Kh4JmZ+b+gop10WgpA--

