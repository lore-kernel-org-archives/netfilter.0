From: Carlos Mtz-Troncoso <cmartinez@uninorte.edu.co>
Subject: Re: Port forwarding problem
Date: Sat, 16 Oct 2010 08:19:37 -0500
Message-ID: <4CB9A669.7020008@uninorte.edu.co>
References: <4CB9A03C.7020700@uninorte.edu.co> <4CB9A4FE.1050905@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CB9A4FE.1050905@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Thanks Pascal for your answer.

I had that rule but I deleted, I just add again

iptables -A FORWARD -p tcp -i eth0 -d 10.1.1.7 --dport 80 -j ACCEPT

but it doesn't work.



On 10/16/2010 08:13 AM, Pascal Hambourg wrote:
> Hello,
>
> Carlos Mtz-Troncoso a =E9crit :
>>
>> My server has 2 network cards, eth0 is for Internet with an IP addre=
ss
>> fixed, and eth1, 10.1.1.1/16 is for local network (10.1.0.0/16). In =
this
>> server I have OpenVPN working well and the is used as gateway.
>>
>> My script worked well and the last change was to add a port forwardi=
ng:
>> the traffic from IP public port 2020 is sent to a internal web sever
>> 10.1.1.7:80. The internal server has as gateway 10.1.1.1 (my Linux
>> IPTables box).
>>
>> My problem is that the port forwarding is not working, here is my sc=
ript.
> [...]
>> Where is my error?
>
> IMO the rule in FORWARD accepting the port-forwarded packets is missi=
ng.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
