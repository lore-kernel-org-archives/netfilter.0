From: mouss <mouss@netoyen.net>
Subject: Re: iptables block samba or not?
Date: Thu, 24 Jan 2008 22:13:22 +0100
Message-ID: <4798FF72.2020609@netoyen.net>
References: <200801242017.m0OKH0lJ011470@indigo.cs.bgu.ac.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200801242017.m0OKH0lJ011470@indigo.cs.bgu.ac.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Eial Czerwacki wrote:
> I've got this too has part of the rules
>
> -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>   

but not for output. what if your linux box initiates the connection?

Also, as I said before, allow for icmp (echo if you add a stateful 
accept for output icmp's if you don't have the stateful rule).
>
> On Thu 24 Jan 0:00 2008 Dzianis Kahanovich wrote:
>   
>> Eial Czerwacki wrote:
>>
>>     
>>> -A INPUT -p tcp -m state --state NEW --dport 135 -s 132.72.144.0/20 -j ACCEPT
>>> -A INPUT -p tcp -m state --state NEW --dport 139 -s 132.72.144.0/20 -j ACCEPT
>>> -A INPUT -p udp -m state --state NEW --dport 137:138 -s 132.72.144.0/20 -j ACCEPT
>>> -A INPUT -p tcp -m state --state NEW --dport 426 -s 132.72.144.0/20 -j ACCEPT
>>> -A INPUT -p tcp -m state --state NEW --dport 445 -s 132.72.144.0/20 -j ACCEPT
>>>
>>> -A INPUT -p tcp -m state --state NEW --dport 135 -s 192.168.114.0/24 -j ACCEPT
>>> -A INPUT -p tcp -m state --state NEW --dport 139 -s 192.168.114.0/24 -j ACCEPT
>>> -A INPUT -p udp -m state --state NEW --dport 137:138 -s 192.168.114.0/24 -j ACCEPT
>>> -A INPUT -p tcp -m state --state NEW --dport 426 -s 192.168.114.0/24 -j ACCEPT
>>> -A INPUT -p tcp -m state --state NEW --dport 445 -s 192.168.114.0/24 -j ACCEPT
>>>
>>> # up to 5 Bit-torrent connections
>>> -A INPUT -p tcp -m state --state NEW --dport 6881:6886 -j ACCEPT
>>>
>>> #else
>>> -A INPUT -j REJECT --reject-with icmp-port-unreachable
>>>       
>> You ACCEPTing only NEW connection state - initial packets for every session.
>> Remove "-m state -- state NEW".
>>
>>
>> -- 
>> WBR,
>> Denis Kaganovich,  mahatma@eu.by  http://mahatma.bspu.unibel.by
>>
>> -
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>     
>
>
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   

