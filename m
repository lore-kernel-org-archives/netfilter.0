From: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Subject: Re: Ipset counters question
Date: Thu, 31 Mar 2011 08:42:19 +0200
Message-ID: <4D94224B.4050408@univ-nantes.fr>
References: <4D91B511.3040005@univ-nantes.fr> <alpine.DEB.2.00.1103302215160.12949@blackhole.kfki.hu>
Reply-To: jean-philippe.menil@univ-nantes.fr
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1103302215160.12949@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Le 30/03/2011 22:17, Jozsef Kadlecsik a =E9crit :
> On Tue, 29 Mar 2011, Jean-Philippe Menil wrote:
>
>> basiclly, i'm working on a captive portal, who add some rules in
>> PRE/POSTROUTING mangle table when a user is fully authenticated.
>> $IPTABLES -t mangle -N OUT-AUTH
>> $IPTABLES -t mangle -A PREROUTING -j OUT-AUTH
>> $IPTABLES -t mangle -N IN-AUTH
>> $IPTABLES -t mangle -A POSTROUTING -j IN-AUTH
>>
>> and the following rules are append when an user is authenticate:
>> $IPTABLES -t mangle -A OUT-AUTH -s $IP -m mac --mac-source $IP -j MA=
RK
>> --set-mark 10
>> $IPTABLES -t mangle -A IN-AUTH -d $IP -j ACCEPT
>>
>> I dicovered ipset, and begin to play with it.
>> If my understand of is correct, i can add:
>>
>> ipset -N TEST macipmap --network 192.168.100.0/24
>> $IPTABLES -t mangle -A IN-AUTH -m set --set TEST src,dst -j ACCEPT
>> $IPTABLES -t mangle -A OUT-AUTH -m set --set TEST src,dst -j MARK --=
set-mark
>> 10
> The set match for the bitmap:ip,mac (macipmap) type can check the *so=
urce*
> MAC address only. It is documented in the manpage.
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
Hi,

thanks to clarify this point.
I need to update my rules in consequence, and re-read the manpages.

What about counters?

Regards.

--=20
Jean-Philippe Menil - P=F4le r=E9seau Service IRTS
DSI Universit=E9 de Nantes
jean-philippe.menil@univ-nantes.fr
Tel : 02.53.48.49.27 - Fax : 02.53.48.49.09

