From: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Subject: Re: connlimit problem
Date: Fri, 09 Sep 2011 11:25:27 +0200
Message-ID: <4E69DB87.6040601@univ-nantes.fr>
References: <4E69C831.4050004@univ-nantes.fr> <alpine.DEB.2.00.1109091110100.18593@blackhole.kfki.hu> <4E69DA81.3060206@univ-nantes.fr> <alpine.DEB.2.00.1109091122060.18593@blackhole.kfki.hu>
Reply-To: jean-philippe.menil@univ-nantes.fr
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1109091122060.18593@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Le 09/09/2011 11:22, Jozsef Kadlecsik a =E9crit :
> On Fri, 9 Sep 2011, Jean-Philippe Menil wrote:
>
>> Le 09/09/2011 11:12, Jozsef Kadlecsik a =E9crit :
>>> On Fri, 9 Sep 2011, Jean-Philippe Menil wrote:
>>>
>>>> I try to limit the connection per ip with connlimit in addition to=
 the
>>>> socket
>>>> match, with the following rule:
>>>> $IPTABLES -t mangle -A PREROUTING -s $LAN -p tcp --syn --dport htt=
p -m
>>>> socket
>>>> -m connlimit --connlimit-above 0 -j DIVERT
>>>>
>>>> But as you can see, theses rules  never match:
>>>>
>>>>       0     0 DIVERT     tcp  --  *      *       192.168.100.0/24
>>>> 0.0.0.0/0
>>>> tcp dpt:80flags: 0x17/0x02 socket #conn src/32>   1
>>>>       9  3030 DIVERT     tcp  --  *      *       192.168.100.0/24
>>>> 0.0.0.0/0
>>>> tcp dpt:80 socket
>>>>       5   216 TPROXY     tcp  --  *      *       192.168.100.0/24
>>>> 0.0.0.0/0
>>>> tcp dpt:80 TPROXY redirect 0.0.0.0:50080 mark 0x1/0x1
>>>>       0     0 DIVERT     tcp  --  *      *       192.168.100.0/24
>>>> 0.0.0.0/0
>>>> tcp dpt:3128flags: 0x17/0x02 socket #conn src/32>   1
>>>>       6  2491 DIVERT     tcp  --  *      *       192.168.100.0/24
>>>> 0.0.0.0/0
>>>> tcp dpt:3128 socket
>>>>      19   800 TPROXY     tcp  --  *      *       192.168.100.0/24
>>>> 0.0.0.0/0
>>>> tcp dpt:3128 TPROXY redirect 0.0.0.0:50080 mark 0x1/0x1
>>>>
>>>> Is this an expected behaviour, or a problem in my rules?
>>> You use the socket match from the PREROUTING chain, where it'll nev=
er
>>> match: it's before routing, so the the system could not associate t=
he
>>> packet to a socket yet.
>>>
>>> Best regards,
>>> Jozsef
>> Ok, i see.
>> So, if my understand is correct, it will be better to do like this:
>>
>> $IPTABLES -t mangle -A PREROUTING -s $LAN -p tcp --dport http -m soc=
ket -j
>                           ^^^^^^^^^^                             ^^^^=
^^^^^
> Here again....
>
> Best regards,
> Jozsef
> -
No, it's working as expected.
I have just followed the documentation in:
Documentation/networking/tproxy.txt

Regards.

--=20
Jean-Philippe Menil - P=F4le r=E9seau Service IRTS
DSI Universit=E9 de Nantes
jean-philippe.menil@univ-nantes.fr
Tel : 02.53.48.49.27 - Fax : 02.53.48.49.09

