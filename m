From: Federico Di Sante <federico.disante@duet.it>
Subject: Re: LOG natted packet.
Date: Wed, 15 May 2013 16:50:11 +0200
Message-ID: <CANQgTcLuxROtwCR26efz_pgc31U3Oo0T_AiZ=4-CG6KrOruRLw@mail.gmail.com>
References: <0c9a093fffc283dd8d4ea216e32a6763@duet.it>
	<5192CD3D.5090500@plouf.fr.eu.org>
	<CANQgTc+SdLpTrF2Ob=_OywDfLZn7UQkMPQHyaRrPngqimqb=vg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CANQgTc+SdLpTrF2Ob=_OywDfLZn7UQkMPQHyaRrPngqimqb=vg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 
Cc: netfilter@vger.kernel.org

Thank you Pascal.

2013/5/15 Federico Di Sante <federico.disante@duet.it>:
> Thank you Pascal.
>
> Federico
>
>
>
> 2013/5/15 Pascal Hambourg <pascal@plouf.fr.eu.org>
>>
>> Hello,
>>
>> federico.disante a =E9crit :
>> >
>> > My question is: why I do not get the log from the nat table in the
>> > PREROUTING chain?
>>
>> Quote from iptables' manpage :
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D
>> nat:
>>      This table is consulted when a packet  that  creates  a  new
>>      connection  is encountered.
>> =3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Obviously, a reply packet does not create a new connection.
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>


2013/5/15 Federico Di Sante <federico.disante@duet.it>:
> Thank you Pascal.
>
> Federico
>
>
>
> 2013/5/15 Pascal Hambourg <pascal@plouf.fr.eu.org>
>>
>> Hello,
>>
>> federico.disante a =E9crit :
>> >
>> > My question is: why I do not get the log from the nat table in the
>> > PREROUTING chain?
>>
>> Quote from iptables' manpage :
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D
>> nat:
>>      This table is consulted when a packet  that  creates  a  new
>>      connection  is encountered.
>> =3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Obviously, a reply packet does not create a new connection.
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
