From: perillamint <perillamint@gentoo.moe>
Subject: GPL violation in Ahnlab Online Security.
Date: Tue, 11 Aug 2015 20:01:07 +0900
Message-ID: <55C9D5F3.4000002@gentoo.moe>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=gentoo.moe; s=tengwa;
	t=1439290811; bh=iwq0tifEPXNKEIiSCIeaA6u+jpPtYv+yn2psSlx5hEM=;
	h=To:From:Subject:Cc:Date:From;
	b=fY+TYztFNUc6W7bcuBObGhO1zcgZEkZZAHrQM4OUKFYXFKFpN5w0secBG1SoTBJa5
	 AC69dqeDbt/ry5PsIlwvkiD51fU8uwO3RL2oJVayj3XFXgt1Ed+Hu37pC1uN+RhdbB
	 lh2N228YElhQ72006kjzuKBrIYeNgLQW9wJSwVys=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=gentoo.moe; s=tengwa;
	t=1439290809; bh=iwq0tifEPXNKEIiSCIeaA6u+jpPtYv+yn2psSlx5hEM=;
	h=To:From:Subject:Cc:Date:From;
	b=GiXhQzz3lkEuyZ4cfAWsxhU34oSsjZV/u1Xpc/8WwTmv99Hjbt+J75ABZdFFp/Jqb
	 4qRbLIHv1oQu+51tfe4BMjzEQ/IRk26IqZbDtTo8uxQAc5UNjDKOMdluD2qqY5MF9E
	 mBvUzHHeyQJLbPXSSVHyCJmMjwJkvoeLL5zNkd1c=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: licensing@fsf.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello, I found Ahnlab Online Security is using libnfnetlink and
libnetfilter_conntrack and I think they are violating GPL license.

They are distributing that application on this page (Hana bank online
banking site. They are only providing korean version of that page.)

https://open.hanabank.com/common/installSecurityModule.jsp#//HanaBank

In this page, there are not mentioning about they are using
libnfnetlink and libnetfilter_conntrack

However, in debian package file, libnflink.so.0.2.0 and
libnetfilter_conntrack.so.3.1.3 exists in
/opt/Ahnlab/ASP/Firewall/lib/Netfilter/

and there are copyright notice in
/usr/share/doc/ahnlab-online-security-firewall/copyright but they are
not mentioning about they are using netfilter library and GPL notice.
(And it is proprietary licensed software)

So I think they are violating GPL.

Additionally, here is contact information of AhnLab Inc.

Webpage : http://ahnlab.com
Tel     : +82 31 722 8000
Fax     : +82 31 722 8901
Email   : global.sales@ahnlab.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVydXwAAoJEAnN7LS7JtQ97CoP/idk/HuNB4Sd+HyptS9K9acT
uD8FdHTQTGIhOpJy3vnhV9z1JZph2kXT1ljeJW1kVn9a9TkN/ZAV0GEsOmn/RSBM
GNG8kkIuGqmkXYSiFCP37ux3ClCSdAZefNiaWYciVwTwX3WYysCYEVt2dXK2GxX6
mKmpYWokqATulFIaKwWyN+cky/H0y7PlNu34Y3VKTv2yJBuvmhYHlgUVsyRPkee3
Hhxmcjv2QdtTyG1uNOgS4QMl9gd82tbZXWQ95eP1Y4p8AlNw/CWcaKvaVvHScySq
w6Tw2I9SMO093sS7pK1Qgq2yAGk0lR39vO7aL33mGtvvCZm4bt+iebPi91M5d545
4xdDpdrdjUQDlaY5qqF0xvgB/A7dB3nIQ0ZEhABHyyNiMBHajT1tX/nln6VTkccR
9Mb3W9q1g4Vr/10Usg+0CoF5O75vd4Fs5TparPpziaaBaJwGZbyQnQ5/uA4zmhz/
m51wkbJJWlN4YLoUR4OZiPJ9XhKS0KszddoTaiyVecD4Dywhz2FLyl23VnVgO7kV
jJPp1Bf158eMbOC8WZDCVDjWofMuTqc18a7zkfHjUuYfl4OD0oCT6xkj70rnI4/n
VcwpidseEq9S+03N+k63YTvNoBvRE9+Y1j4/0vu8wt/ohdmNukTTbRIy32z1bVKy
3l9kjNSOalKvkKFR7ev6
=/AMQ
-----END PGP SIGNATURE-----
