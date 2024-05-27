Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156E31EB35
	for <netfilter@vger.kernel.org>; Mon, 27 May 2024 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716827269; cv=none; b=teRzj33AXYfk8DhSwTGQwTqEHugGW36/kNzg0IdpLaLfqwKAR75LuYNE4sM7Fbf4V0ZhzHd2TwABEl04+qbr97GsfCkgW+aYacIZLTkBt0w75Z4vw+4k8++sdD7V+vO+wTPWXYcZwdN3PLW+nuN5fTY8JRHvZOXPilhNocHrueI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716827269; c=relaxed/simple;
	bh=sM1LvQt02Z9RlkJIw2TZb8SOflT5rXthxUJ899YbncY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HpEkeI3buMRp85yjGn1VW9tHaiEBFdQ2xzzjY/soSHiw1wbAU2BjoEa457qo629LCewDLs3C3v8EEIGK1+O81oED5Q2XA2f5EjZ3CX+SAiw8kPPsRXoMX4IQZMDKXAO65RcP3lbqcSNp3BCR3B9JvfvJM1CwCFwNIX7LX/SA3As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biscuolo.net; spf=pass smtp.mailfrom=biscuolo.net; dkim=pass (2048-bit key) header.d=biscuolo.net header.i=@biscuolo.net header.b=PNvOkTYy; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biscuolo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=biscuolo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=biscuolo.net header.i=@biscuolo.net header.b="PNvOkTYy"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23A4B4000A
	for <netfilter@vger.kernel.org>; Mon, 27 May 2024 16:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biscuolo.net;
	s=gm1; t=1716827265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=6w2irvJZzwPz6opW3bajLHo5Bp4JK3+oRi9LVAB2+JQ=;
	b=PNvOkTYyE0yDChLDj8NcWRm+qNAjcOtXmv0HVaKj5S9RMjVF3/kImCJfJrURXqwgn08kXZ
	Qc94EY+mCkrUL2Ek96Rfxgh4TKBJC7UjdvE29jSQ9XD48POj7IZSRGRGboK2lEzD4HlBNU
	QJUzsvfJ3NozQ7YMIrdZcSuNV5KG2dQxQ8c6J9ZPru6XKKsJyj27jLtEWfarOgfV7P6J40
	FzsQQ7y5StBI2VsR+0Di7Dzq2aTBGZWH1WqCJedT7U/Yz5dkqtC1d+yrCN+VSTv6SlSF9h
	xXSJR/4cJr4HkjGVC9FEk1SsG+N5z1wT8emgM+rYvacj5hcifmxdCciyOpv4Xg==
Received: from roquette.mug.biscuolo.net (roquette [10.38.2.14])
	by bourrache.mug.xelera.it (Postfix) with SMTP id 90D5C32BFD64
	for <netfilter@vger.kernel.org>; Mon, 27 May 2024 18:27:44 +0200 (CEST)
Received: (nullmailer pid 5314 invoked by uid 1000);
	Mon, 27 May 2024 16:27:43 -0000
From: Giovanni Biscuolo <giovanni@biscuolo.net>
To: netfilter@vger.kernel.org
Subject: connection refused from DNATted host
Organization: Biscuolo Worldwide Network
Date: Mon, 27 May 2024 18:27:42 +0200
Message-ID: <875xuzw77l.fsf@xelera.eu>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-GND-Sasl: giovanni@biscuolo.net

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I'm not subscribed to this list, please keep me in the From:, thanks!

I'm a new nftables user and it's the first time I try to configure a
DNAT rule to "expose" the email ports of a virtual machine on internet.

I'm using libvirt to define and run a guest (IPv4 192.168.133.9) inside
my host, the guest gets network config via DHCP and is able to ping and
curl on the internet, masquerading is running properly... AFAIU the
swws-bridge network bridge is working fine.

I'm using this ruleset (from 'nft list ruleset') to do the DNAT of tcp port
110 from Internet to 192.168.133.9:100

=2D-8<---------------cut here---------------start------------->8---

table ip filter {
        chain input_wan {
                icmp type echo-request limit rate 5/second accept
                icmpv6 type { nd-router-advert, nd-neighbor-solicit, nd-nei=
ghbor-advert } accept
                icmpv6 type echo-request limit rate 5/second accept
                ip protocol . th dport vmap { tcp . 22 : accept, tcp . 53 :=
 accept, udp . 53 : accept }
        }

        chain input {
                type filter hook input priority filter; policy drop;
                ct state established,related accept
                iifname vmap { "lo" : accept, "eno1" : jump input_wan, "sww=
s-bridge" : accept }
        }

        chain forward {
                type filter hook forward priority filter; policy drop;
                ct state established,related accept
                iifname "swws-bridge" oifname "eno1" accept
                iifname "eno1" oifname "swws-bridge" ip daddr 192.168.133.9=
 tcp dport 110 accept
        }

        chain trace_chain {
                type filter hook prerouting priority raw - 1; policy accept;
                ip saddr 93.56.171.217 meta nftrace set 1
        }
}
table ip nat {
        chain postrouting {
                type nat hook postrouting priority srcnat; policy accept;
                ip saddr 192.168.133.0/24 oifname "eno1" masquerade
        }

        chain prerouting {
                type nat hook prerouting priority dstnat; policy accept;
                iifname "eno1" tcp dport 110 dnat to 192.168.133.9
        }
}

=2D-8<---------------cut here---------------end--------------->8---

If from 93.56.171.217 I try to telnet I get:

=2D-8<---------------cut here---------------start------------->8---

$: telnet 162.55.88.253 110
Trying 162.55.88.253...
telnet: Unable to connect to remote host: Connection refused

=2D-8<---------------cut here---------------end--------------->8---

with this trace on the firewall host (using "nft monitor trace | grep
'dport 110'"):

=2D-8<---------------cut here---------------start------------->8---

trace id ff699e27 ip filter trace_chain packet: iif "eno1" ether saddr b4:8=
a:5f:36:a3:0f ether daddr b4:2e:99:c5:cc:1c ip saddr 93.56.171.217 ip daddr=
 162.55.88.253 ip dscp cs0 ip ecn not-ect ip ttl 53 ip id 63915 ip length 6=
0 tcp sport 26971 tcp dport 110 tcp flags =3D=3D syn tcp window 64240=20
trace id ff699e27 ip nat prerouting packet: iif "eno1" ether saddr b4:8a:5f=
:36:a3:0f ether daddr b4:2e:99:c5:cc:1c ip saddr 93.56.171.217 ip daddr 162=
.55.88.253 ip dscp cs0 ip ecn not-ect ip ttl 53 ip id 63915 ip length 60 tc=
p sport 26971 tcp dport 110 tcp flags =3D=3D syn tcp window 64240=20
trace id ff699e27 ip nat prerouting rule iifname "eno1" tcp dport 110 dnat =
to 192.168.133.9 (verdict accept)
trace id ff699e27 ip filter forward packet: iif "eno1" oif "swws-bridge" et=
her saddr b4:8a:5f:36:a3:0f ether daddr b4:2e:99:c5:cc:1c ip saddr 93.56.17=
1.217 ip daddr 192.168.133.9 ip dscp cs0 ip ecn not-ect ip ttl 52 ip id 639=
15 ip length 60 tcp sport 26971 tcp dport 110 tcp flags =3D=3D syn tcp wind=
ow 64240=20
trace id ff699e27 ip filter forward rule iifname "eno1" oifname "swws-bridg=
e" ip daddr 192.168.133.9 tcp dport 110 accept (verdict accept)

=2D-8<---------------cut here---------------end--------------->8---

AFAIU the "ip nat prerouting" rule and the "ip filter forward" rule are
working as expecten and the packet is accepted... but the connection is
refused.

Please could you help me find out what I'm missing?

Happy hacking! Gio'

=2D-=20
Giovanni Biscuolo

=C2=ABSi pu=C3=B2 sperare
 Che il mondo torni a quote pi=C3=B9 normali=C2=BB.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJKBAEBCgA0FiEERcxjuFJYydVfNLI5030Op87MORIFAmZUtH8WHGdpb3Zhbm5p
QGJpc2N1b2xvLm5ldAAKCRDTfQ6nzsw5ErcoD/0d80agx8OIL7dhCjB0OuHUc4rn
OG26dnAcxWzgVUlhCaeaA4DiFjUKn7yoWR7Q+wjVlRmjDlTPWyClEttrMc2pns0C
/rqmofTUpmclNj7qwbNKfn0p6PhN0GsBBG5w7s7JbGSBkuycxlnwceyVu4F4qIeX
VNzunqrhTADKQSXIdYkF/5016/YJr+zzThrkHvvxVjqCgMgp1BtREC8Ds9+xFhNy
HthcdSWhEmj8+nxZZPORa++FMbHFXZgtv//XChfb+1XyW1wJPBxNWc2oq7N6EJAv
SbfrqyEhye++BhImUaK2FmpekL0VzY+B0/y6NilEboPuBXmmFoy0z9tmHWoIwXWc
NEkwmJh65UFGkpNwmqdMTbqgKzSRaIDfYDrU1G6wvG2NVzUwTTjQSxzUDK7JMJb2
eRs9txngfwz9pjm6gk/FkavDpxUnYMm8A3tTfDIK8nLFw89rBwdZQkfPKw6H8egk
kHk0Y3sywfTgcckEE62US1rOxSK4+XELJt/5PEhmFCnjHf2eB9AioPTyFBN9Q6M8
YoRlzR3XPTCoz666gnBtHh5YlEzehRYSXvcIy8wptgGeMhsO7PK1emuBObmXly4w
fHDWyVKusx9RClUnY/qCYOjuiSgmADLQZ/RX56Kgvy7ubcS5WtFTuXA6qWqHyCQk
NEafREkJXqv24cpvWQ==
=n79C
-----END PGP SIGNATURE-----
--=-=-=--
