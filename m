From: =?ISO-8859-1?Q?Remzi_AKY=DCZ?= <linuxliste@gmail.com>
Subject: Re: How to debug RST filter ?
Date: Mon, 01 Feb 2010 10:05:54 +0200
Message-ID: <4B668B62.1090200@gmail.com>
References: <LB95CFD713BF44ce1B06C76BE068BFE90.1265010613.scalix01.aarboard.ch@MHS>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=HPc47z1IXdRHI3UlUIRW5louHDySIgYwG0PvDm5WvkI=;
        b=ByMcq7uihmA6WhDLSLO2XfPALNrM34l9tOULE+fEmuvM8Zy4sWs8eBNpzVHXbgyaeB
         Njsur2mQr5+/37RNQqaz5uEDBDzyMIUyiPwTNoXXA3Lfi+Uvj53+5fjr3OAlbGYBOC0X
         yBud0ZzmzecI0pQBPlw7ykKVsT3H//4L2bCsY=
In-Reply-To: <LB95CFD713BF44ce1B06C76BE068BFE90.1265010613.scalix01.aarboard.ch@MHS>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andre Schild <a.schild@aarboard.ch>
Cc: netfilter@vger.kernel.org

Hello,

Can you see "RULE 17"?

Andre Schild wrote:
> Hello,
>
> we are using Debian 2.6.26-2-amd64 with a database server listening o=
n=20
> tcp port 2638.
> Usually everything works just fine, but sometimes we get connection=20
> errors on the server, and then, each time we see firewall entries lik=
e=20
> this in the syslog:
>
>
> Feb  1 07:41:26 sv16 kernel: [34944777.631090] RULE 17 -- DENY IN=3D=20
> OUT=3Dlo SRC=3D188.myip DST=3D188.myip LEN=3D40 TOS=3D0x00 PREC=3D0x0=
0 TTL=3D64 ID
> =3D0 DF PROTO=3DTCP SPT=3D41562 DPT=3D2638 SEQ=3D1506091366 ACK=3D0 W=
INDOW=3D0=20
> RES=3D0x00 RST URGP=3D0
> Feb  1 07:41:29 sv16 kernel: [34944786.286850] RULE 17 -- DENY IN=3D=20
> OUT=3Dlo SRC=3D188.myip DST=3D188.myip LEN=3D40 TOS=3D0x00 PREC=3D0x0=
0 TTL=3D64 ID
> =3D0 DF PROTO=3DTCP SPT=3D41562 DPT=3D2638 SEQ=3D1506091366 ACK=3D0 W=
INDOW=3D0=20
> RES=3D0x00 RST URGP=3D0
>
> In the firewal we even have a rule which allows everything in/out on =
the=20
> lo interface.
>
> It looks like there are some timeouts or state filters which do not w=
ork=20
> as intended by us.
>
> Any ideas how I can debug this ?
> I can't trace all the traffic on the lo interface, because there is=20
> quite heavy load/traffic
> on that interface.
>
> Andr=E9
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  =20

