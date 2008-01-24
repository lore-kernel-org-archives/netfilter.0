From: mouss <mouss@netoyen.net>
Subject: Re: iptables block samba or not?
Date: Thu, 24 Jan 2008 21:16:26 +0100
Message-ID: <4798F21A.8070107@netoyen.net>
References: <200801212233.m0LMXQqO006594@indigo.cs.bgu.ac.il> <4797B8FC.8080308@bspu.unibel.by>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4797B8FC.8080308@bspu.unibel.by>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

Dzianis Kahanovich wrote:
> Eial Czerwacki wrote:
>
>> -A INPUT -p tcp -m state --state NEW --dport 135 -s 132.72.144.0/20 
>> -j ACCEPT
>> -A INPUT -p tcp -m state --state NEW --dport 139 -s 132.72.144.0/20 
>> -j ACCEPT
>> -A INPUT -p udp -m state --state NEW --dport 137:138 -s 
>> 132.72.144.0/20 -j ACCEPT
>> -A INPUT -p tcp -m state --state NEW --dport 426 -s 132.72.144.0/20 
>> -j ACCEPT
>> -A INPUT -p tcp -m state --state NEW --dport 445 -s 132.72.144.0/20 
>> -j ACCEPT
>>
>> -A INPUT -p tcp -m state --state NEW --dport 135 -s 192.168.114.0/24 
>> -j ACCEPT
>> -A INPUT -p tcp -m state --state NEW --dport 139 -s 192.168.114.0/24 
>> -j ACCEPT
>> -A INPUT -p udp -m state --state NEW --dport 137:138 -s 
>> 192.168.114.0/24 -j ACCEPT
>> -A INPUT -p tcp -m state --state NEW --dport 426 -s 192.168.114.0/24 
>> -j ACCEPT
>> -A INPUT -p tcp -m state --state NEW --dport 445 -s 192.168.114.0/24 
>> -j ACCEPT
>>
>> # up to 5 Bit-torrent connections
>> -A INPUT -p tcp -m state --state NEW --dport 6881:6886 -j ACCEPT
>>
>> #else
>> -A INPUT -j REJECT --reject-with icmp-port-unreachable
>
> You ACCEPTing only NEW connection state - initial packets for every 
> session.
> Remove "-m state -- state NEW".
>
>

or at least add stateful rules for output. but it is true that managing 
state in this case is cumbersome at best.

Another thing is that he is no allowing ICMP. It may be just me, but I 
tend to consider a machine as disconnected if it does not respond to 
ping... and while it be argued that this is helpful to protect winboxes, 
I would be frightened if this argument applied to a (not too old) linux 
or bsd ;-p

Finally, adding a rule to log rejected packets would help debugging 
whatever issues happen.


