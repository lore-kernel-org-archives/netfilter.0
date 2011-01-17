From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: POSTROUTING SNAT only reply packets
Date: Tue, 18 Jan 2011 00:14:23 +1300
Message-ID: <4D34248F.6020408@treenet.co.nz>
References: <4D341710.60509@gmail.com> <4D341C26.2010207@freemail.hu> <4D341F4C.3020002@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D341F4C.3020002@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: GMail Isaac Gonzalez <isaak.gonzalez@gmail.com>
Cc: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>, netfilter list <netfilter@vger.kernel.org>

On 17/01/11 23:51, GMail Isaac Gonzalez wrote:
> Hi,
>
> I know that doing the NAT in the firewall will do the trick, but the
> problem is that the "firewall and webserver" and the load balancer ar=
e
> in differents networks, then the webserver replies only goes through =
the
> firewall, and not though the load balancer. On the other hand the
> loadbalancer isn't a Linux box, then I can't not modify anything abou=
t
> packets, moreover I can't do any kind of routing.


Slow down, read again G=E1sp=E1r response. Think particularly carefully=
=20
about what the SNAT lines are doing there.

I'm fairly sure the LB will be capable of it somehow. If not, you have =
a=20
nice heater to sit your feet on in winter.

As a giant hack you could also do SNAT on the device(s) receiving=20
packets from the LB such that the reply packets get routed back through=
=20
the LB.

>
> El 17/01/11 11:38, G=E1sp=E1r Lajos escribi=F3:
>> Hi,
>>
>> You should do all of the NAT-ing ON THE LOAD BALANCER:
>>
>> iptables -t nat -A PREROUTING -j DNAT -p tcp --dport 80
>> --to-destination WEBSERVER1 (some load balancing options here)
>> iptables -t nat -A PREROUTING -j DNAT -p tcp --dport 80
>> --to-destination WEBSERVER2 (some load balancing options here)
>>
>> iptables -t nat -A POSTROUTING -j SNAT -p tcp --dport 80 -d WEBSERVE=
R1
>> --to-source BALANCER_IP_ON_WEBSERVER1_NET
>> iptables -t nat -A POSTROUTING -j SNAT -p tcp --dport 80 -d WEBSERVE=
R1
>> --to-source BALANCER_IP_ON_WEBSERVER2_NET
>>
>> But some other rules may be in effect....
>>
>> Swifty
>>

AYJ
