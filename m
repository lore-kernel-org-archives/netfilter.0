From: pauloric@contatogs.com.br
Subject: Re: [nftables] xtables-addons - GeoIP/ASN filter and lscan
 replicable?
Date: Thu, 6 Feb 2020 08:51:10 -0200 (BRST)
Message-ID: <147904727.45.1580986270280.JavaMail.zimbra@contatogs.com.br>
References: <80253ddd-a2ea-3fdb-2612-6ed7c4d68abd@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 mercurio.contatogs.com.br 88B94400BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=contatogs.com.br;
        s=547D7A06-2322-11E9-835A-A37390E63B7D; t=1580986274;
        bh=6dyXNyA+EsevMxdPFKd2EAj0fqqID3bjtU8r2/zf7kw=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=HwJaVZrBVFqqqWZeUz6UKTtSaSRoT/+Y/b/NdWc7T0kJyJICL3GZlDaRIftSmGcv6
         w0WcszP3haDQmnJfAeWsC05bAW2s9PttJwnFy9pV+0mhl/ljhdSyp9BPqYU/wHX5nY
         cUgFFSIO9rV1o+BqDyFmxR7bORlToN4nMifJiMlbhOS9FAgNyidyUK2f3ddcSbNcnH
         jfI5t5U3Z812rUKS/1kfGy8AICxcqT9ZtmW0KyzMO/ubo26IHprPGfAubh7Pj7z+nS
         YfYuzsT/A1z0NgS36S/VUCLEdo+SGH0A26TAlApRX0zhH9j4/E5E6kfF+GZ1Hd+Ysl
         LOCfTPEN0PPCA==
In-Reply-To: <80253ddd-a2ea-3fdb-2612-6ed7c4d68abd@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: vtol@gmx.net
Cc: netfilter@vger.kernel.org

Geoip:

https://github.com/chr0mag/geoipsets

best regards

----- Mensagem original -----
De: "=D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0" <vtol@gmx.net>
Para: netfilter@vger.kernel.org
Enviadas: Quarta-feira, 5 de fevereiro de 2020 23:27:16
Assunto: [nftables] xtables-addons - GeoIP/ASN filter and lscan replicable?

From what I was able to gather xtables-addons are not available for nft?

Is there any way to

* achieve GeoIP (country | residential)=C2=A0 | ASN filtering?
* replicate lscan?
--=20
Paulo Ricardo Bruck consultor=20
tel 011 3596-4881 011 98140-9184(TIM/Whats)=20
[ http://www.contatogs.com.br/ | http://www.contatogs.com.br ]=20
gpg AAA59989 at wwwkeys.us.pgp.net=20
skype: suportecontatogs
