From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: Re: DNAT and SNAT
Date: Thu, 4 Sep 2008 12:41:29 +0200 (CEST)
Message-ID: <5931cc50f0304d7280998c0bd32d065a.squirrel@www.arcoscom.com>
References: <43d295de0809030702i1d42b404w36483608498a6fcc@mail.gmail.com>
    <43d295de0809030743m30964ac8o66194e2b4aed1f6@mail.gmail.com>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <43d295de0809030743m30964ac8o66194e2b4aed1f6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

The solution is not to "allow all" in "forwading" in your router.

Think how the tables work:
   * The nat is for the NAT operations.
   * The filter is for filter operations.

If you are not allowing all forwarding traffic, then you need to put
analogous rule to your NAT rule in your nat table into your filter tabl=
e.

=46or example, if you want to redirect 50002 from external to internal,=
 you
must allow this in filter table, something as:

iptables -t filter -A FORWARD -p tcp -m tcp --dport 50002 -d 192.168.1.=
3
-j ACCEPT

Perhaps you need more rules, for example one to delimite the input and
another for the output, because you are using diferent ports in externa=
l
interface and destination host.

The idea is only allow the things you need.

Regards

El Mie, 3 de Septiembre de 2008, 16:43, Fabrizio Regalli escribi=F3:
> I've found the right rules:
>
> iptables -t nat -A PREROUTING -p tcp -m tcp --dport 50002 -j DNAT
> --to-destination 192.168.1.3:22
>
> iptables -t nat -A POSTROUTING -p tcp -m tcp -d 192.168.1.3 --dport 2=
2
> -j SNAT --to-source 192.168.1.2:50002
>
> iptables -P FORWARD ACCEPT
>
> Now works.
>
> Thanks.
> Fabrizio
>
> 2008/9/3 Fabrizio Regalli <fabreg@gmail.com>:
>> Hi list.
>>
>> I have a router "closed" and I can't using PAT but I need to forward
>> the ssh port to another external port (50002)
>> My router is 192.168.1.1
>> My server is 192.168.1.2
>> My client is 192.168.1.3
>> In other words I need to forward the ssh port of 192.168.1.3 to serv=
er
>> ip:50002
>>
>> For PREROUTING rule I suppose this is right:
>>
>> iptables -t nat -A PREROUTING -p tcp -m tcp --dport 50002 -j DNAT
>> --to-destination 192.168.1.3:22
>>
>> For POSTROUTING rule, I need an help. I'm trying in this way:
>>
>> iptables -t nat -A POSTROUTING -p tcp -m tcp -d 192.168.1.2 --dport =
22
>> -j SNAT --to-source 192.168.1.2:50002
>>
>> But unfortunately it doesn't work.
>>
>> Could please someone give me a suggest for POSTROUTING rule?
>>
>> Thanks in advance.
>>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


