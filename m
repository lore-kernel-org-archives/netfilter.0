From: Ralph Blach <rblach@intrex.net>
Subject: Re: correct net fitler rule
Date: Sat, 31 Oct 2009 15:37:01 -0400
Message-ID: <4AEC91DD.7040009@intrex.net>
References: <4AE7C1CF.2070807@gmail.com> <4AE820AF.70109@chello.at>	 <4AE83DCE.5080102@gmail.com> <56378e320910280553o7e7f246fk8f3dbe5f6f7fb5c8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56378e320910280553o7e7f246fk8f3dbe5f6f7fb5c8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Horton <richard.horton@solstans.co.uk>
Cc: netfilter@vger.kernel.org

I am not so good at writing what I wish to accomplish

I am often not at home and wish to access my system.  That means when I 
ssh into my machine, it will be from
a ip address of a hotels or other ISP network.

Internternet             
linksys                                              10.0.0.0/255.255.255.0
-------------------| firewall with portt 22 forwarded | 
----------------|linux server|------------

For my home machine, I wish to block traffic from network which I see in 
my /var/log/secure file have attached my machine.
( By now I have a long list, I anybody wants it)
But for certain well know address, like the 10.0.0.0/255.255.255.0 and 
the nameserver addresses, I just wish to accept those
There seens to be a never ending stream of break in attempts.

in sshd, I have all  dened all uses  except a 2 users with Complex names 
and passwords.

so allow the internal local network.
allow the nameservers.
deny attacking networks.



Richard Horton wrote:
> 2009/10/28 Ralph Blach <rcblach@gmail.com>:
>   
>> Ok,
>>
>>     
> [snip]
>   
>> Since I get attached, I want to drop and log from any attaching network.
>>
>> This happens on a daily bassis, so I am constally updating the list.
>>
>> What is the best set of rules to accomplish this
>>     
>
> If you only wish to allow traffic from your internal network and the
> external nameservers then its simple.
>
> set your iptables policies, as said earlier, to DROP.
>
> Then create explicit rules to accept the traffic you want in each
> chain as needed.
> If you want to log any DROP traffic then just make the LAST rule in
> each chain a logging rule...
>
> If you use DROP as a policy and only allow specific traffic you will
> not have to keep updating your rule set to block additional networks.
>
>
>   

