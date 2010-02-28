From: Nemeth Denes <nemeth.denes@iit.bme.hu>
Subject: Re: Howto match the 3rd packet in the 3way handshake
Date: Sun, 28 Feb 2010 12:03:36 +0100
Message-ID: <4B8A4D88.5060901@iit.bme.hu>
References: <4B8A3E21.3050708@iit.bme.hu> <4B8A44FE.7010202@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B8A44FE.7010202@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dear All

This is a good idea,

"But I think you could construct something that matches those hosts which
sent a SYN and continue with INVALID state traffic.

1: put tcp syn into a recent set.
2: match for hosts in the set with state INVALID."

, but the real question is what does INVALID mean, because if it will
also match case where Y!=A+1, than it will allow an attacker to
perform a DoS by easily spoofing valid IP addresses, which will get
dropped (sitewide)

Best wishes,
Denes

Mart Frauenlob wrote:
> On 28.02.2010 10:58, netfilter-owner@vger.kernel.org wrote:
>   
>> Dear All,
>>
>> The situation is the following: We have two host A and B, A sends B a
>> SYN packet with a spoofed IP address,
>> since the source IP is spoofed B will not receive the 2. packet of the
>> handshake, but is able
>>     
>
> it think you mean A?
>   
yes sorry typo
>> to send back the 3rd: an ACK packet with an invalid acknowledgement
>> number. How is it
>> possible distinguish connections in which the source IP is spoofed in
>> this way.
>>
>> 1. A ->B : SYN(IP_X, seq(A))
>> 2. B ->A : SYN_ACK(IP_X, ack(A), seq(B))
>> 3. A ->B : ACK(IP_X. seq(A+1), ack(Y))
>>
>> How is it possible to match the 3rd packet if Y=A+1, and Y!=A+1?
>>
>> I would like to use this for the following. Let us assume that port 222
>> is a normally closed port, and
>> B executed a port scan on that port.
>>
>> iptables -A INPUT -p tcp --dport 222 -match <connections in which source
>> IP can be spoofed> -g DROP
>> iptables -A INPUT -p tcp --dport 222 <execute site wide preventive
>> actions against the IP address: iptables -I INPUT -src THISSRC -j DROP>
>>
>> Thanks Denes
>>     
>
>
> I do not think it is possible to match on spoofed IP addresses.
> But I think you could construct something that matches those hosts which
> sent a SYN and continue with INVALID state traffic.
>
> 1: put tcp syn into a recent set.
> 2: match for hosts in the set with state INVALID.
>
> Questioning it all:
> A simple -m state --state INVALID -j DROP should silently discard all those.
>
> Best regards
>
> Mart
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   

