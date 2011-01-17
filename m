From: GMail Isaac Gonzalez <isaak.gonzalez@gmail.com>
Subject: Re: POSTROUTING SNAT only reply packets
Date: Mon, 17 Jan 2011 11:51:56 +0100
Message-ID: <4D341F4C.3020002@gmail.com>
References: <4D341710.60509@gmail.com> <4D341C26.2010207@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=HmRNokBOgvLpmY10Om1uTZz+bIWikd4NNIC0+2ODr1M=;
        b=d11bPjApGftz8aMM348/T0/gSJZGoqZwEXzIXg+bR8QD1MNlUKNdVMaTawBU/Pko+w
         qtvN55skYS7aDbg5yfi/brmseVaK/s0B5c41KxKdWfZp0Kz0ndmIgFLMaF6CYAabyHI+
         lNAUsrsNMf8q3dX6fuPM0M3EBp7QM/TjXvvzQ=
In-Reply-To: <4D341C26.2010207@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter list <netfilter@vger.kernel.org>

Hi,

I know that doing the NAT in the firewall will do the trick, but the=20
problem is that the "firewall and webserver" and the load balancer are=20
in differents networks, then the webserver replies only goes through th=
e=20
firewall, and not though the load balancer. On the other hand the=20
loadbalancer isn't a Linux box, then I can't not modify anything about=20
packets, moreover I can't do any kind of routing.

VIP 10.0.0.10 |---LB---| LAN 80.67.12.X <<---ROUTERS---> FW 72.10.10.1=20
--> WS 72.10.10.10


HTTP REQUEST:
CUSTOMER IP 25.0.0.222 --> VIP 10.0.0.10
VIP 10.0.0.10 --> WS 72.10.10.10
WS 72.10.10.10 --> CUSTOMER 25.0.0.222

The CUSTOMER sees ACK that does'n not correspond with the original=20
request (10.0.0.10) then the connection is not established.

I need a FW rule that change to source address of the webservers replie=
s.

WS 72.10.10.10 --> VIP 10.0.0.10

Thanks in advance.


El 17/01/11 11:38, G=E1sp=E1r Lajos escribi=F3:
> Hi,
>
> 2011-01-17 11:16 keltez=E9ssel, GMail Isaac Gonzalez =EDrta:
>> Hi,
>>
>
>> I've doing some testing and seems that iptables only do SNAT on NEW=20
>> connections, and I need to change the ip address of replied packets.=
=20
>> Anybody know some workaround? If anobody do not know some workaround=
=20
>> can you confirm that it's not posible to do this with iptables?
>
> read again the NAT part in the manual:
> man iptables
>
> nat table:
>               nat:
>                   This table is consulted when a packet that creates =
a=20
> new connection is encountered.  It consists of three built-ins:=20
> PREROUTING (for altering packets as soon as they come in), OUTPUT=20
> (for  altering  locally-gener-
>                   ated packets before routing), and POSTROUTING (for=20
> altering packets as they are about to go out).
>
> DNAT target:
>
>    DNAT
>        This  target  is  only valid in the nat table, in the=20
> PREROUTING and OUTPUT chains, and user-defined chains which are only=20
> called from those chains.  It specifies that the destination address=20
> of the packet should be modified
>        (and all future packets in this connection will also be=20
> mangled), and rules should cease being examined.  It takes one type o=
f=20
> option:
>
> SNAT target:
>
>    SNAT
>        This target is only valid in the nat table, in the POSTROUTING=
=20
> chain.  It specifies that the source address of the packet should be=20
> modified (and all future packets in this connection will also be=20
> mangled), and rules  should
>        cease being examined.  It takes one type of option:
>
>
>> I've tried the next ip tables rules and only work when I do NEW=20
>> connections from the web server.
>>
>> -A POSTROUTING -o br0 -s WE_SERVER_ADDR -p tcp -m tcp --sport 80=20
>> --dport 1024:65535 -j SNAT --to-source LOAD_BALANCER_ADDR
>>
>> Thanks in advance.
>>
>> Isaac Gonz=E1lez
>>
>
> You should do all of the NAT-ing ON THE LOAD BALANCER:
>
> iptables -t nat -A PREROUTING -j DNAT -p tcp --dport 80=20
> --to-destination WEBSERVER1 (some load balancing options here)
> iptables -t nat -A PREROUTING -j DNAT -p tcp --dport 80=20
> --to-destination WEBSERVER2 (some load balancing options here)
>
> iptables -t nat -A POSTROUTING -j SNAT -p tcp --dport 80 -d WEBSERVER=
1=20
> --to-source BALANCER_IP_ON_WEBSERVER1_NET
> iptables -t nat -A POSTROUTING -j SNAT -p tcp --dport 80 -d WEBSERVER=
1=20
> --to-source BALANCER_IP_ON_WEBSERVER2_NET
>
> But some other rules may be in effect....
>
> Swifty
>

