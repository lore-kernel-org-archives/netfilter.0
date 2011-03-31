From: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Subject: Re: Ipset counters question
Date: Thu, 31 Mar 2011 21:55:03 +0200
Message-ID: <4D94DC17.4040906@univ-nantes.fr>
References: <4D91B511.3040005@univ-nantes.fr> <alpine.DEB.2.00.1103302215160.12949@blackhole.kfki.hu> <4D94224B.4050408@univ-nantes.fr> <alpine.DEB.2.00.1103312005580.16579@blackhole.kfki.hu> <4D94D06C.6070201@univ-nantes.fr> <alpine.DEB.2.00.1103312121170.16841@blackhole.kfki.hu>
Reply-To: jean-philippe.menil@univ-nantes.fr
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1103312121170.16841@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Le 31/03/2011 21:24, Jozsef Kadlecsik a =E9crit :
> On Thu, 31 Mar 2011, Jean-Philippe Menil wrote:
>
>> Let me explain, in iptables, i have this in a mangle chain:
>>
>> Chain WD_BG_Outgoing (1 references)
>>   pkts bytes target     prot opt in     out     source destination
>>   238K   18M MARK       all  --  *      *       192.168.10.255 0.0.0=
=2E0/0
>> MAC F0:7B:CB:8C:6C:6F MARK set 0x2
>>   196K   12M MARK       all  --  *      *       192.168.11.214 0.0.0=
=2E0/0
>> MAC 00:25:00:4E:E3:B7 MARK set 0x2
>>   9436 3210K MARK       all  --  *      *       192.168.10.195 0.0.0=
=2E0/0
>> MAC F0:7B:CB:52:3D:BE MARK set 0x2
>>   289K   68M MARK       all  --  *      *       192.168.11.211 0.0.0=
=2E0/0
>> MAC 00:22:69:3D:4C:13 MARK set 0x2
>>   710K   40M MARK       all  --  *      *       192.168.10.34 0.0.0.=
0/0
>> MAC C8:0A:A9:45:E5:3D MARK set 0x2
>> 1605K   93M MARK       all  --  *      *       192.168.11.155 0.0.0.=
0/0
>> MAC 00:26:6C:5A:0C:0A MARK set 0x2
>> 81534   14M MARK       all  --  *      *       192.168.11.136 0.0.0.=
0/0
>> MAC 00:0F:B0:D6:1D:19 MARK set 0x2
>>   420K   26M MARK       all  --  *      *       192.168.11.149 0.0.0=
=2E0/0
>> MAC 00:24:21:44:FB:40 MARK set 0x2
>> 13128 3437K MARK       all  --  *      *       192.168.10.186 0.0.0.=
0/0
>> MAC 00:26:5E:27:8C:33 MARK set 0x2
>>
>> --snip--
>>
>> If i use ipset, with rules like these:
>> ipset -N WEBAUTHIP bitmap:ip,mac --network 192.168.10.0/24
>> iptables -t mangle -I WD_BG_Outgoing -m set --set WEBAUTHIP src -j A=
CCEPT
>>
>> And add clients with ipset -A WEBAUTHIP ip,mac
>>
>> If i list my mangle chain (WD_BG_Outgoing), i will see only the coun=
ters for
>> the WEBAUTHIP match-set,
>> Chain WD_BG_Outgoing (0 references)
>>   pkts bytes target     prot opt in     out     source destination
>>      111M     475M ACCEPT     all  --  *      *       0.0.0.0/0    0=
=2E0.0.0/0
>> match-set WEBAUTHIP src
>>
>> and i can't anymore check the counters by ip of my clients
>
> The rules are collapsed into a single rule, so there are no more
> individual counters. That's a tradeof and you have to decide which is=
 more
> important: less rules or counters.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>            H-1525 Budapest 114, POB. 49, Hungary
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

That's what i tought, and i needed to be sure.

As i can miss the counters for the moment, i will kept my rules.
But as i'm very intereted by ipset, i will think to do otherwise.

Thanks a lot.

Regards.

--=20
Jean-Philippe Menil - P=F4le r=E9seau Service IRTS
DSI Universit=E9 de Nantes
jean-philippe.menil@univ-nantes.fr
Tel : 02.53.48.49.27 - Fax : 02.53.48.49.09
