From: =?ISO-8859-1?Q?Jorge_D=E1vila?= <jorgedavilalopez@gmail.com>
Subject: Re: MASQUERADE MAIL SERVER
Date: Thu, 23 Jul 2009 11:40:27 -0600
Message-ID: <bf0e93a30907231040r11b3256dr74da9c2e0c91911c@mail.gmail.com>
References: <4A6897BD.8000805@ideay.net.ni>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=pF3Xmczj+HwSn3lGmRgG+rTkPqEarYMoCJxQJzCRJvE=;
        b=DOAhix0Zcc4+p784RoT7q8fLSdm6bofHdxlqeOP+wtWJDtXnmCD/6L9A4g7YSnRVEG
         9ET+TAoJ72a6z286SM9xlLUxy392n5cwtXlrOKQRBZABiR9/FLi1BDRgNCgjim6Oy06L
         DhSx8jAH/U04Fs99isMiGtNoTvzJKGRg6r9jk=
In-Reply-To: <4A6897BD.8000805@ideay.net.ni>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Wilbert J. Rojas O." <sysadmin@ideay.net.ni>
Cc: netfilter@vger.kernel.org

Good morning,

You need acomplish something similar to this

http://lartc.org/lartc.html#LARTC.RPDB.MULTIPLE-LINKS

Best regards,

Jorge D=E1vila.

On Thu, Jul 23, 2009 at 11:02 AM, Wilbert J. Rojas
O.<sysadmin@ideay.net.ni> wrote:
> =A0Hello,
>
> My Network configuration is that:
>
>
> ISP
> |
> |
> |
> | =A0*eth0 200.9.190.20* *eth0:1* 200.9.190.21 *eth0:2* 200.9.190.23 =
*eth0:3*
> 200.9.190.24 *eth0:4* 200.9.190.25
> LINUX BOX
> | =A0*eth1 10.24.54.1/32*
> |
> |
> LAN =A010.24.54.0/24 =A0gw 10.24.54.1
> |
> |
> MAIL SERVER 10.54.24.96/32 =A0gw 10.24.54.1
>
>
>
> All machines to get out to INTERNET through my LINUX BOX included my =
MAIL
> SERVER but i want that MAIL SERVER to get out to INTERNET with IP Pub=
lic
> Address different like 200.9.190.25 and my all rest network get out t=
hrough
> 200.9.190.20
>
> The rules i have applied like this but i don't know how to do that:
>
> /sbin/iptables -t nat -A PREROUTING -i eth1 -s 10.24.54.0/255.255.255=
=2E0 -d
> 0/0 -p tcp --dport 80 -j REDIRECT --to-port 8080
> /sbin/iptables -t nat -A PREROUTING -i eth1 -s 10.24.54.0/255.255.255=
=2E0 -d
> 0/0 -p tcp --dport 8080 -j REDIRECT --to-port 8080
>
> /sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>
> /sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 -d 200.9.190.20 --=
dport
> 25 -j DNAT --to-destination 10.24.54.96:25
> /sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 -d 200.9.190.20 --=
dport
> 110 -j DNAT --to-destination 10.24.54.96:110
> /sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 -d 200.9.190.20 --=
dport
> 143 -j DNAT --to-destination 10.24.54.96:143
>
>
> Any help or suggestions ??
>
> Regards.
>
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Ing. Wilbert Jos=E9 Rojas Ochoa.
> Administrador de Sistemas
> Ideay ~ Equipos y Sistemas.
> Managua, Nicaragua.
> Telf. +(505) 2277-4000 Ext: 115.
> Fax =A0 +(505) 2277-4411.
> USA: =A0+(305) 735-8364.
> Cel. =A0+(505) 8883-2877.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Ing. Wilbert Jos=E9 Rojas Ochoa.
> Administrador de Sistemas
> Ideay ~ Equipos y Sistemas.
> Managua, Nicaragua.
> Telf. +(505) 2277-4000 Ext: 115.
> Fax =A0 +(505) 2277-4411.
> USA: =A0+(305) 735-8364.
> Cel. =A0+(505) 8883-2877.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Jorge Isaac D=E1vila L=F3pez
+505 8430 5462
jorgedavilalopez@gmail.com
---
Esta tierra es Linux. En las noches calladas puede escucharse a las
m=E1quinas Windows re-inici=E1ndose...
