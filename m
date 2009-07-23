From: "Wilbert J. Rojas O." <sysadmin@ideay.net.ni>
Subject: Re: MASQUERADE MAIL SERVER
Date: Thu, 23 Jul 2009 12:15:51 -0600
Message-ID: <4A68A8D7.1090607@ideay.net.ni>
References: <4A6897BD.8000805@ideay.net.ni> <bf0e93a30907231040r11b3256dr74da9c2e0c91911c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <bf0e93a30907231040r11b3256dr74da9c2e0c91911c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Jorge_D=E1vila?= <jorgedavilalopez@gmail.com>
Cc: netfilter@vger.kernel.org

Thanks but i have only one internet provider. I  was trying with SNAT=20
and DNAT but i failed with this rules:

iptables -t nat -A PREROUTING -p all -d 200.9.190.25 -i eth0 -j DNAT=20
--to 10.24.54.96
iptables -t nat -A POSTROUTING -p all -d 10.24.54.96 -o eth0 -j SNAT=20
--to 200.9.190.25

from mail server enter in my web browser this URL=20
http://www.cualesmiip.com/ and always get out to INTERNET through=20
200.9.190.20 and not through 200.9.190.25.

Any idea ??

Regards

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
Ing. Wilbert Jos=E9 Rojas Ochoa.
Administrador de Sistemas
Ideay ~ Equipos y Sistemas.
Managua, Nicaragua.
Telf. +(505) 2277-4000 Ext: 115.
=46ax   +(505) 2277-4411.
USA:  +(305) 735-8364.
Cel.  +(505) 8883-2877.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D



Jorge D=E1vila escribi=F3:
> Good morning,
>
> You need acomplish something similar to this
>
> http://lartc.org/lartc.html#LARTC.RPDB.MULTIPLE-LINKS
>
> Best regards,
>
> Jorge D=E1vila.
>
> On Thu, Jul 23, 2009 at 11:02 AM, Wilbert J. Rojas
> O.<sysadmin@ideay.net.ni> wrote:
>  =20
>>  Hello,
>>
>> My Network configuration is that:
>>
>>
>> ISP
>> |
>> |
>> |
>> |  *eth0 200.9.190.20* *eth0:1* 200.9.190.21 *eth0:2* 200.9.190.23 *=
eth0:3*
>> 200.9.190.24 *eth0:4* 200.9.190.25
>> LINUX BOX
>> |  *eth1 10.24.54.1/32*
>> |
>> |
>> LAN  10.24.54.0/24  gw 10.24.54.1
>> |
>> |
>> MAIL SERVER 10.54.24.96/32  gw 10.24.54.1
>>
>>
>>
>> All machines to get out to INTERNET through my LINUX BOX included my=
 MAIL
>> SERVER but i want that MAIL SERVER to get out to INTERNET with IP Pu=
blic
>> Address different like 200.9.190.25 and my all rest network get out =
through
>> 200.9.190.20
>>
>> The rules i have applied like this but i don't know how to do that:
>>
>> /sbin/iptables -t nat -A PREROUTING -i eth1 -s 10.24.54.0/255.255.25=
5.0 -d
>> 0/0 -p tcp --dport 80 -j REDIRECT --to-port 8080
>> /sbin/iptables -t nat -A PREROUTING -i eth1 -s 10.24.54.0/255.255.25=
5.0 -d
>> 0/0 -p tcp --dport 8080 -j REDIRECT --to-port 8080
>>
>> /sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>>
>> /sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 -d 200.9.190.20 -=
-dport
>> 25 -j DNAT --to-destination 10.24.54.96:25
>> /sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 -d 200.9.190.20 -=
-dport
>> 110 -j DNAT --to-destination 10.24.54.96:110
>> /sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 -d 200.9.190.20 -=
-dport
>> 143 -j DNAT --to-destination 10.24.54.96:143
>>
>>
>> Any help or suggestions ??
>>
>> Regards.
>>
>>
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> Ing. Wilbert Jos=E9 Rojas Ochoa.
>> Administrador de Sistemas
>> Ideay ~ Equipos y Sistemas.
>> Managua, Nicaragua.
>> Telf. +(505) 2277-4000 Ext: 115.
>> Fax   +(505) 2277-4411.
>> USA:  +(305) 735-8364.
>> Cel.  +(505) 8883-2877.
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>>
>>
>> --
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> Ing. Wilbert Jos=E9 Rojas Ochoa.
>> Administrador de Sistemas
>> Ideay ~ Equipos y Sistemas.
>> Managua, Nicaragua.
>> Telf. +(505) 2277-4000 Ext: 115.
>> Fax   +(505) 2277-4411.
>> USA:  +(305) 735-8364.
>> Cel.  +(505) 8883-2877.
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>    =20
>
>
>
>  =20
