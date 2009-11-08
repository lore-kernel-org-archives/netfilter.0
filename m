From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Forward Chain: is Inbound traffic on eth0 not also Outbound depending
 	on your view?
Date: Sun, 08 Nov 2009 13:00:11 +0100
Message-ID: <4AF6B2CB.5090100@chello.at>
References: <ac5c74140911080311g21df128fte32b05d90b233a33@mail.gmail.com> <4AF6B16C.506@chello.at>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AF6B16C.506@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Mart Frauenlob wrote:
> paddy joesoap wrote:
>> Dear Experts
>>
>> I am curious to know more about what FORWARD chain inbound and
>> outbound actually mean.
>>
>> Example firewall set-up below:
>>
>> Internet --- Firewall --- PC
>>
>> Firewall has 2 interfaces: eth0 = External and eth1 = Internal
>>
>> >From what I can gather from the Netfilter website, all I need to do is
>> create are inbound and outbound rules on the FORWARD chain.
>>
>> To allow inbound Internet access, I specify:
>>
>> FORWARD -i eth0
>>
>> To allow outbound PC access, I specify:
>>
>> FORWARD -o eth1
>>
>> The question is from whose perspective do you view what is inbound and
>> what is outbound?
>>
>> For example, in the case of the Internet client, traffic flowing
>> towards the firewall is indeed Inbound so naturally "FORWARD -i eth0"
>> is required. However, isn't it also Outbound on eth1, given that it
>> leaves interface eth1 to get to PC?
>>
>> Similarly, clients on the internal network think of their traffic as
>> being outbound only, but when traffic is being "forwarded" from eth1
>> to eth0 heading for the Internet, isn't that traffic classed as
>> Inbound on eth0?
>>
>> Do I need to create rules for this scenario also or is Netfilter
>> handling these implied situations?
>>
>> Beginner questions so apologies in advance.
>> Paddy.
>>   
> Please read this carefully and if you still have questions, ask them 
> afterwards:
>
> http://www.frozentux.net/iptables-tutorial/iptables-tutorial.html#TRAVERSINGOFTABLES 
>
> http://jengelh.medozas.de/images/nf-packet-flow.png
>
> but in short:
> INPUT chain = packets destined to your host
> OUTPUT chain = source of packets is your host
> FORWARD chain = source is external - destination is external address 
> (forwarded, routed)
>
forgot to mention, it's your choice and may depend how exactly you 
need/want a match, to specify either one or two interfaces in a FORWARD 
chain rule. i.e.

iptables -A FORWARD -i eth1 -o eth0 ....

if you have only one LAN, a -o eth0 may be sufficient, but if you have 
more than one LAN, you might prefer to use -i eth1 -o eth0.

regards

Mart
