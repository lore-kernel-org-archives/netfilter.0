From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: really need your help about iptables
Date: Wed, 26 Aug 2009 17:44:49 +0530
Message-ID: <4A952739.9030605@infoservices.in>
References: <4A93CC1C.3070100@infoservices.in> <33be4bb30908250709i5750f6a6ma86a27dc1f0829fc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <33be4bb30908250709i5750f6a6ma86a27dc1f0829fc@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oskar Berggren <oskar.berggren@gmail.com>
Cc: netfilter@vger.kernel.org

Oskar Berggren wrote:
> Use a higher limit for SYN packets to those services. IIRC your
> ruleset from before.
>
> /Oskar
>   

Hello,

Thanks for your hint. I have  googled based on your hint and found a lot
of solution for rate limit incoming connection. one  ruleset  valid for
me are

````````````````````````
 iptables -I INPUT -p tcp --dport 995 -i eth0 -m state --state NEW -m
recent \
  --set

iptables -I INPUT -p tcp --dport 995 -i eth0 -m state --state NEW -m
recent \
  --update --seconds 60 --hitcount 4 -j DROP
 
 iptables -I INPUT -p tcp --dport 995 -i eth0 -j ACCEPT
`````````````````````````````````

But the problem with my iptables is default policy--> drop.  I have also
tested with

````````````
iptables -A INPUT -i eth0 -m state --state NEW -p tcp --dport 995 -m
limit --limit 1/minute --limit-burst 2 -j ACCEPT
``````````
This works fine and limiting the connection 1/min but  a brute force
attack ( like nmap scan) make the port  not useable any more.

What can be the solution for such an iptables ?

Thanks


>
> 2009/8/25 J. Bakshi <joydeep@infoservices.in>:
>   
>> Dear list,
>>
>> I really really need your help to configure iptables to cope with
>> "connection time out problem"  Here what actually the situation is.
>>
>> I have configured iptables to drop nmap and other port scanning
>> techniques ( collected from internet, like XMAS scan, FIN scan etc...).
>> If I run nmap against the server ( like nmap -P0 <myserver> or nmap -P0
>> -sT <myserver> ) then the firewall successfully dropping the scan
>> packets and  make the nmap scan  to wait for *looooong* .  Good.  But on
>> the other hand  the  http and mail server running on the  server
>> providing "time out error" hence it is not possible to connect the mail
>> /apache and other services running on that  server during port scanning
>> against it. Could any one kindly suggest how to cope with this situiation ?
>>
>> Thanks for your time.
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>     
>
>   

