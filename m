From: sean darcy <seandarcy2@gmail.com>
Subject: Re: does -p udp --dport 5060 not work with -j LOG?
Date: Thu, 01 May 2008 21:10:37 -0400
Message-ID: <fvdpme$vrl$1@ger.gmane.org>
References: <fvarov$iq2$1@ger.gmane.org>	 <cc86d0010804302023n2b2dbbeu9b7c5f7d80a308cb@mail.gmail.com>	 <fvdk6f$j6a$1@ger.gmane.org>  <05dd01c8abe6$7a65aa50$5000040a@skathlaptop> <1209689109.6381.20.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1209689109.6381.20.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Diego Lacerda wrote:
> On Thu, 2008-05-01 at 16:53 -0700, Steven Kath wrote:
>>> There only one line in my script that uses SIP:
>>>
>>> grep SIP firewall-masq
>>> $IPT -t nat -A PREROUTING -i external -p udp  --dport 5060 -j LOG
>>> --log-prefix "SIP-BEFORE:  "
>>>
>>> And it's run first:
>>>
>>> sh -x firewall-masq
>>> + IPT=/sbin/iptables
>>> + /sbin/iptables -F
>>> + /sbin/iptables -X
>>> + /sbin/iptables -t nat -A PREROUTING -i external -p udp --dport 5060 -j
>>> LOG --log-prefix 'SIP-BEFORE:  '
>>> ...........
>>>
>>>
>>> I don't really understand this output:
>>>
>>> iptables -L -n -v -t nat | grep SIP
>>>      2   262 LOG        udp  --  *      *       0.0.0.0/0
>>> 0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:
>>> '
>>>   144K   24M LOG        udp  --  *      *       0.0.0.0/0
>>> 0.0.0.0/0           LOG flags 0 level 4 prefix `SIP-BEFORE:  '
>>> 41816 5117K LOG        udp  --  external *       0.0.0.0/0
>>> 0.0.0.0/0           LOG flags 0 level 4 prefix `SIP-BEFORE:  '
>>>      0     0 LOG        udp  --  external *       0.0.0.0/0
>>> 0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:
>>> '
>>>      0     0 LOG        udp  --  external *       0.0.0.0/0
>>> 0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:
>>> '
>> ...
>>
>> It looks like your nat table isn't getting flushed.  
>>
>> Have you tried running 'iptables -t nat -F' before firewall-masq or adding
>> that to the start of the script?
> 
> Yeah,
> 
> I think that you really need flush the NAT table before.
> In this case you can see that the second and third rules in you NAT table are logging every UDP packet (you can see that by first and second columns: packets/bytes).
> 
> Regards,
> 

Wow. That worked.

I always thought iptables -F flushed all the tables. Is there a command 
that does flush all the tables? Cleans the slate completely?

sean


