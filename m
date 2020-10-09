From: <paul.guijt@gmail.com>
Subject: Newbie: IPv6 equivalent of 192.168.178.0/24
Date: Fri, 9 Oct 2020 14:49:59 +0200
Message-ID: <021101d69e3a$b2ce88e0$186b9aa0$@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding:thread-index:content-language;
        bh=l6sHYZjuR/wXYHBxfdazOYm8ThL1WLOBgyg4zQWRZwo=;
        b=OcmQ1Q2U8JmaHyDsoimvht3TqmfVdLo69DFP46kiYrXMgrYKIYGUZ3Oi/iMJN09I/0
         joxQhPgOFNRqMJOAJEY2BgmfrEhl64yY2MuiES0ASjo/uR1dcvPgNhGEryDvvsmA+w4j
         1h/KQVd+O70gqWmslMRnoxf6rCi2bAufVSO7GZ3S5YjitIDrFz4YaNPwu54UxZBTUn+J
         nZU7vRgHPrecJHxbKgLuhUmsrExrO+HIS+SasdX8EO0xisASXOeW3X+SoN03aNCj9F4o
         zItlg7FhWCv11GkyuGMUjrDeCtGpbP1Sap/DHZpyP8Hpt9UDqXykrWJQlKvltNPgMx9p
         6WZQ==
Content-Language: nl
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; boundary="----=_NextPart_000_0209_01D69E4B.40511600"; charset="utf-8"
To: netfilter@vger.kernel.org

I had
	add rule  inet filter input ip   saddr 192.168.178.0/24         jump =
LocalIN
	add rule  inet filter input ip6 saddr fe::/10                           =
  jump LocalIN
to divert all packets coming from my private network to rules in the =
LocalIN chain.=20

Nftables converts the second line into =E2=80=9Cip6 saddr c0::/10 jump =
LocalIN=E2=80=9D. FE into C0.=20
Will that do what I intended? If not, what rule do you prefer?=20

Regards,
Paul Guijt=20


