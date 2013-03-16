From: AZ 9901 <az9901@gmail.com>
Subject: Re: iptables as a protocol demultiplexer
Date: Sat, 16 Mar 2013 18:25:24 +0100
Message-ID: <3206069C-4429-4819-BF78-B0CC5D989EA7@gmail.com>
References: <E7857ABB-9A3D-4FB2-AFA9-B282454FC070@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:content-type:mime-version:subject:from:in-reply-to:date
         :content-transfer-encoding:message-id:references:to:x-mailer;
        bh=K9maQ5jl3GuWQANGRI0xoSzgg35CJ1MkqjiApSULOZs=;
        b=rvnot69RTRZowljCHp3Yi+jN4EZ72dCZW8XDD+FoPaYqogXJCTjRrMu4VZmi2damz3
         3u36BtotL+Z0ajNHdlIMuLMOZlnUCNYAnhhzx1br0CNGgf8X8hFxQx7JIa+6R/6pfHr1
         5Vf+jgORTGW6aOW2t1OmUC5MVpoOT+o3Efk5flgrCEhfU4A494hEPkMe6sjwNsKSkYya
         evJ2BDowSZL+bn3Sls+P6GjuKWd6Sr1V3r2rwtjw9amVWPI3jFuMH4U/UlPVI01l2p3L
         YjmKv+KksY7ej3vEs6mP4ukvcPXz6Hr/LcM7BT7z0bptcqpm0L5931bVjPfCFW4Dwdpo
         /6gA==
In-Reply-To: <E7857ABB-9A3D-4FB2-AFA9-B282454FC070@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Le 12 mars 2013 =E0 19:09, AZ 9901 a =E9crit :
> Hello,
>=20
> sslh (http://www.rutschle.net/tech/sslh.shtml) works as a protocol de=
multiplexer, it allows to separate SSH and HTTPS streams which arrive o=
n the same port (443 for instance).
> I would like to do the same thing but with iptables only.
> Is it possible ?
> I think that using PREROUTING, string, conntrack... it could be.
> I tried but I did not manage to make it work.
>=20
> Could you help me ?
>=20
> Thank you very much for your support !
>=20
> Best regards,
>=20
> Ben
>=20

Hello,

Any help ? :-)

Thank you very much !

Best regards,

Ben

