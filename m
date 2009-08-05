From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Firewall Configuration Help
Date: Wed, 05 Aug 2009 16:05:20 +0200
Message-ID: <4A7991A0.8000002@chello.at>
References: <4399fd970907271056m24713eecj5d6f20aed572cc36@mail.gmail.com> <47ae5fdc6d1c4a93d1035f61774996ec@localhost> <4A798712.3040406@chello.at> <248de9c714c7f5a1b003ba7f31325955@localhost>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <248de9c714c7f5a1b003ba7f31325955@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Julien Vehent wrote:
> On Wed, 05 Aug 2009 15:20:18 +0200, Mart Frauenlob
> <mart.frauenlob@chello.at> wrote:
>   
>> Julien Vehent wrote:
>>     
>>> Hello Nicholas,
>>>
>>>
>>> On Mon, 27 Jul 2009 13:56:59 -0400, NICHOLAS KLINE <nkline@kent.edu>
>>> wrote:
>>>   
>>>       
>>>> Hi,
>>>>
>>>> I have a fresh install of Ubuntu 8.x desktop edition running on a
>>>> laptop. Before I plug the laptop into a public network and proceed to
>>>> patch it, I want to make sure I have a secure firewall in place.
>>>>
>>>> This particular system will not be running any server services such as
>>>> HTTPD, SSH, FTP, etc. Inbound traffic should be denied unless an
>>>> outbound connection was first established.
>>>> I will mostly be using a wired internet connection but I might switch
>>>> to wireless once in awhile.
>>>>
>>>> After reading a few Linux security books, I have a decent set of
>>>> firewall rules almost ready to put into place. The only rule
>>>> preventing me from putting the firewall in place is:
>>>>     
>>>>         
>> ...
>>
>>     
>>>> # Set default-deny policies for all chains.
>>>> # User-defined chains cannot be assigned default policies.
>>>> $IPTABLES -P INPUT DROP
>>>> $IPTABLES -P FORWARD DROP
>>>> $IPTABLES -P OUTPUT DROP
>>>>
>>>> $IPTABLES -t nat -P PREROUTING DROP
>>>> $IPTABLES -t nat -P OUTPUT DROP
>>>> $IPTABLES -t nat -P POSTROUTING DROP
>>>>
>>>> $IPTABLES -t mangle -P PREROUTING DROP
>>>> $IPTABLES -t mangle -P OUTPUT DROP
>>>>
>>>>     
>>>>         
>>> I don't like the default policy because you can't log anything in these
>>> rules.
>>> I prefer to put at the end of the ruleset something like
>>> --------
>>>    echo "Default log drop, at the end so we just drop what doesn't
>>>       
> match
>   
>>> the
>>> previous rules"
>>>    $IPT -N LOGDROP
>>>    $IPT -A LOGDROP -j LOG --log-prefix "DROP => " --log-level debug
>>>    $IPT -A LOGDROP -j DROP
>>>
>>>    $IPT -A INPUT -i $NETCARD -j LOGDROP
>>>    $IPT -A OUTPUT -o $NETCARD -j LOGDROP
>>> --------
>>> that allows you to log and then drop, instead of just dropping.
>>>
>>>
>>>   
>>>       
>> Why not just put a log rule as the final rule and let the policy drop 
>> the packet? That way there's less rules and traffic gets logged and
>> dropped.
>>
>>     
>
> You would not log the firewall's decision then. Only the packet details.
>
>   
iptables -A INPUT -j LOG --log-prefix "INPUT_POLICY_DROP: " ...
iptables -A OUTPUT -j LOG --log-prefix "OUTPUT_POLICY_DROP: " ...
iptables -A FORWARD -j LOG --log-prefix "FORWARD_POLICY_DROP: " ...

policies do the rest. IMHO you get to know everything you need.

greets

Mart
