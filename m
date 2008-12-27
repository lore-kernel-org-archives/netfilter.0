From: Aleksei Bebinov <alex@gipi.kg>
Subject: Re: multiple exclusive DNAT does not work
Date: Sat, 27 Dec 2008 14:19:18 +0600
Message-ID: <4955E506.5060907@gipi.kg>
References: <S1751268AbYLZSRi/20081226181738Z+155@vger.kernel.org> <49552652.1040705@gipi.kg> <49552910.2030503@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49552910.2030503@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?TGVvbmFyZG8gUm9kcmlndWVzIE1hZ2FsaMOjZXM=?= <leolistas@solutti.com.br>
Cc: netfilter@vger.kernel.org

Thanks Leonardo.
It works fine, and its some different than OBSD PF :-)



Leonardo Rodrigues Magalh=C3=A3es =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>
>
> Aleksei Bebinov escreveu:
>> I do so :
>> ---------------
>> cat /etc/config/kg-nets | while read LINE
>> do
>> #iptables -t nat -A PREROUTING -i br-lan -d  !  $LINE -p tcp -m
>> multiport --dports  80 -j DNAT --to-destination pr.oxy.ip:3128
>>
>> done
>> --------------------------------------------
>>
>> My script cat the file line by line and add excluding rules ( with !=
 )
>> of nets that i dont need to redirect.
>> BUT!
>> if only one rule ( for one subnet) persist in table - it works fine,=
 and
>> if i ll add second  - with second net -  all the traffic redirecting=
 to
>> proxy - without any  exclusions.
>>
>>  =20
>
>    wrong rule for your needs. Maybe:
>
> for LINE in `cat /etc/config/kg-nets`; do
>    iptables -t nat -A PREROUTING -i br-lan -d $LINE -p tcp --dport 80
> -j ACCEPT
> done
> iptables -t nat -A PREROUTING -i br-lan -p tcp --dport 80 -j DNAT
> --to-destination pr.oxy.ip:3128
>
>    will do it.
>
>    if someone asks me ONE single tip for making iptables easier, i
> would say "do NOT use negation rules, those with !" ..... they work
> just fine, but people rarely understands that it wont allow multiple
> exclusions and will keep fighting with that. Anyway, anything done
> with negation rules can be written in other single (and easier to
> understood) rules.
>
>
>
>

