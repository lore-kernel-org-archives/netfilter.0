From: Karim Asif <karimas@kfupm.edu.sa>
Subject: Re: accept rule not working.
Date: Wed, 07 May 2008 18:39:36 +0300
Message-ID: <001601c8b058$8f04b480$87035a0a@KarimAsif>
References: <200805071514.m47FEhxC008001@indigo.cs.bgu.ac.il>
 <4821CAD7.5060208@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	reply-type=response"
To: netfilter@vger.kernel.org

Try to use

/sbin/iptables -A INPUT -i eth0 -p tcp -m state --state=20
NEW,ESTABLISHED --sport 80 -s 192.168.113.94 -j ACCEPT

Assuming that by default you are dropping the rest of incoming traffic.

Also, try to check where the communication is blocked. use the followin=
g=20
sniffer command.

# tcpdump -i eth0 ip host 192.168.113.94

----- Original Message -----=20
=46rom: "G=E1sp=E1r Lajos" <swifty@freemail.hu>
To: <eial@cs.bgu.ac.il>
Cc: <netfilter@vger.kernel.org>
Sent: Wednesday, May 07, 2008 6:29 PM
Subject: Re: accept rule not working.


> eial@cs.bgu.ac.il =EDrta:
>> I've created this rule:
>> /sbin/iptables -A INPUT -i eth0 -p tcp -m state --state NEW --sport =
80 -s=20
>> 192.168.113.94 -j ACCEPT
>>
>> but the firewall still blocks it, I guess there is a typo somewhere =
but I=20
>> cant seem to be able to find it
>> any hints?
>>
>>
> No typo... maybe... :D
>
> Please include the output of these commands:
>
> iptables -vnL
> iptables -t nat -vnL
> iptables -t mangle -vnL
> iptables -t raw -vnL
>
> Thanx...
>
> Swifty
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html=20

