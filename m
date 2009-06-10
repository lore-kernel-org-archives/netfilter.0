From: Dongsheng Song <dongsheng.song@gmail.com>
Subject: strange incoming speed behaver of hashlimit
Date: Wed, 10 Jun 2009 10:31:23 +0800
Message-ID: <4A2F1AFB.2000206@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------enig7CDE4172064353BDDDD78980"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:x-enigmail-version:openpgp
         :content-type;
        bh=qDfLbwfewUyvB5u0H94ZenzdV7v+ExIS/SMPNDDxPgQ=;
        b=ALyiSphLWlazoCaX/unpqg9m+y16wMblF6weHGZeZVHVMJtYV9oEXq9/J1/e9qELSi
         EtFO7vXQDx6g4SS3aksK7HRpPd0ytTgQOudmfwG2v08tfV09BlXWB2G/hiU8QEwlkKSE
         ZuCIQyYJyFKNPlsgAG+UVQH3YY2bHENrSxleQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig7CDE4172064353BDDDD78980
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable

I'm want use hashlimit to limit incoming/download speed:

iptables -t filter -A FORWARD -d 10.10.0.0/16 -m hashlimit
--hashlimit-above 10/sec --hashlimit-burst 2 --hashlimit-mode dstip
--hashlimit-name pkt_limit --hashlimit-htable-max 270
--hashlimit-htable-expire 60000 -j REJECT --reject-with icmp-host-prohibi=
ted

iptables -t filter -A FORWARD -d 10.10.0.0/16 -m hashlimit
--hashlimit-above 12/sec --hashlimit-burst 2 --hashlimit-mode dstip
--hashlimit-name pkt_limit --hashlimit-htable-max 270
--hashlimit-htable-expire 60000 -j ULOG --ulog-cprange 100
--ulog-qthreshold 1 --ulog-prefix "[test-hashlimit]"

iptables -t filter -A FORWARD -s 10.10.0.0/16 -j ACCEPT

I can verified hashlimit take effect by ulog, but I still observed
download speed above 300kbyte/s !
The theory speed limit shoud be: (10 + 2) * 1460 bytes/s =3D 17kbyte/s,
is't it ?

Can someone tell me the ipt_hashlimit file format ?

# cat /proc/net/ipt_hashlimit/pkt_limit
35 0.0.0.0:0->10.10.7.103:0 3200 3200 64
4 0.0.0.0:0->10.10.7.104:0 3200 3200 64
59 0.0.0.0:0->10.10.2.112:0 3200 3200 64
=2E..

Thanks for some help,

--
Dongsheng Song



--------------enig7CDE4172064353BDDDD78980
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iQEVAwUBSi8bAAQBqiBG05f/AQggfwf/YbsfDDETpcPiR8n9FfDi4Z0ctVxCatQ1
cFoGAcpNbNwHCkpZdChUaG4BBbzgi6ts7Idp3v+BenEYrzr37V23NVLlPtVGvBJh
A6rxsBaCK07pzB8IrZ7tRg7xZd7tnAjIKXGoY3WVfiGpx1g1roVhbRGdvObpuVxz
HbdH3ZMnYFGzzHePlKaJZWv4owBhn41ekegOG1o8XnbjAeZPAHdWb1jAPvkTvFO4
6ew28W98gsetmuZedZdwFUBMyHOzmNxRE0nNjNsiHwoHhgzZb8yVsr7U/PN/JRwN
F5J7viHVp+GNNLjlNKHpqDeCBhYWwUmJ6eEehfz3gCSZkpPPh/oYfg==
=tzZf
-----END PGP SIGNATURE-----

--------------enig7CDE4172064353BDDDD78980--
