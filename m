From: Anthony Taylor <ataylor@fallsgeek.com>
Subject: Re: Some oddities while setting up outbound filtering on a web server
Date: Thu, 6 Mar 2014 17:39:32 -0600
Message-ID: <CA+5v4QAeWp6Azau3nYpL2ev-jqstSs+-BGBMuyavbKSK85JiAg@mail.gmail.com>
References: <CA+5v4QC81A2gU8i566G3Nh_dERTv6LbkssZDfSe664BXj=9NEg@mail.gmail.com>
	<5318BDEE.6080606@chello.at>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5318BDEE.6080606@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu, Mar 6, 2014 at 12:26 PM, Mart Frauenlob
<mart.frauenlob@chello.at> wrote:
> On 04.03.2014 17:52, Anthony Taylor wrote:
>>
>> On Sat, Feb 22, 2014 at 4:37 AM, Mart Frauenlob
>> <mart.frauenlob@chello.at> wrote:
>>>
>>>
>>> On 21.02.2014 23:36, Anthony Taylor wrote:
>>>>
>>>>
>>>> I'm attempting to set up outbound filtering on a server to satisfy
>>>> PCI requirements.  Here is what I have so far:
>>>>
>>>> iptables -L OUTPUT -n --line-numbers Chain OUTPUT (policy ACCEPT)
>>>
>>>
>>>
>>> policy of ACCEPT??? where's the filtering?
>>> only ACCEPT rules below, you want logging only?
>>
>>
>> Sorry I didn't explain.  The last rule will be a DROP all, however for
>> now in the interest of not breaking anything I'm logging results
>> instead.
>
>
> no need to put a last drop rule, that's what the policy is for.

So when I'm satisfied with my logs I should just do a:
iptables -P OUTPUT DROP

>>
>>>
>>> use output of iptables -S .... -N is bad formatting for mail. also it
>>> needs -v to be complete like for rule #1 (guess that's for the lo
>>> iface)..
>>
>>
>> Here is the output of iptables -S OUTPUT -v
>>
>> iptables -S OUTPUT -v
>> -P OUTPUT ACCEPT -c 5039 319910
>> -A OUTPUT -o lo -c 294541 22016298 -j ACCEPT
>> -A OUTPUT -m state --state RELATED,ESTABLISHED -c 11077878 13836891689 -j
>> ACCEPT
>> -A OUTPUT -p icmp -m icmp --icmp-type 0 -c 0 0 -j ACCEPT
>> -A OUTPUT -p icmp -m icmp --icmp-type 8 -c 193399 5415172 -j ACCEPT
>> -A OUTPUT -p tcp -m tcp --dport 53 -c 0 0 -j ACCEPT
>> -A OUTPUT -p udp -m udp --dport 53 -c 233937 16828408 -j ACCEPT
>> -A OUTPUT -p tcp -m tcp --dport 43 -c 50 3000 -j ACCEPT
>> -A OUTPUT -p tcp -m tcp --dport 25 -c 344 20640 -j ACCEPT
>> -A OUTPUT -d 74.125.0.0/16 -p tcp -m tcp --dport 80 -c 1319 79140 -j
>> ACCEPT
>> -A OUTPUT -d 66.135.58.62/32 -p tcp -m tcp --dport 80 -c 153 9180 -j
>> ACCEPT
>> -A OUTPUT -d 192.0.80.244/32 -p tcp -m tcp --dport 80 -c 139 8340 -j
>> ACCEPT
>> -A OUTPUT -d 66.135.58.61/32 -p tcp -m tcp --dport 80 -c 112 6720 -j
>> ACCEPT
>> -A OUTPUT -d 192.0.80.246/32 -p tcp -m tcp --dport 80 -c 109 6540 -j
>> ACCEPT
>> -A OUTPUT -d 91.189.92.201/32 -p tcp -m tcp --dport 80 -c 0 0 -j ACCEPT
>> -A OUTPUT -d 91.189.88.149/32 -p tcp -m tcp --dport 80 -c 0 0 -j ACCEPT
>> -A OUTPUT -d 91.189.91.13/32 -p tcp -m tcp --dport 80 -c 3 180 -j ACCEPT
>> -A OUTPUT -d 91.189.92.200/32 -p tcp -m tcp --dport 80 -c 0 0 -j ACCEPT
>> -A OUTPUT -d 91.189.91.14/32 -p tcp -m tcp --dport 80 -c 2 120 -j ACCEPT
>> -A OUTPUT -d 91.189.91.15/32 -p tcp -m tcp --dport 80 -c 7 420 -j ACCEPT
>> -A OUTPUT -d 66.155.40.249/32 -p tcp -m tcp --dport 80 -c 0 0 -j ACCEPT
>> -A OUTPUT -d 66.155.40.250/32 -p tcp -m tcp --dport 80 -c 0 0 -j ACCEPT
>> -A OUTPUT -m state --state INVALID -c 10200 425557 -j DROP
>> -A OUTPUT -c 5039 319910 -j LOG --log-prefix "fw-outbound: "
>>
>>
>>>>
>>>> My problem is I'm seeing some traffic that I'm not sure I should be
>>>> seeing.  I get periodically some traffic from source port 80.  It's
>>>> my understanding that rule 2 above would filter these out.  When I
>>>> try to access the webserver I don't get anything to show up in logs.
>>>> Yet still I'm getting entries like these:
>>>> <snip>
>
>
> bad idea to snip here ;-p
> bad idea also not to allow icmp error messages (type 3).
>
>>>
>>>
>>> -m state --state INVALID -j DROP
>>> look if they still come up...
>>> also this might have influence:
>>
>>
>> I have added this rule as you can see above, and although it seems to
>> have stopped some of it, my 'phantom' traffic with source ports 80,443
>> still continues.
>
>
> do the filtering for state INVALID in INPUT/FORWARD chain!
>
>>
>>>
>>> nf_conntrack_tcp_be_liberal - BOOLEAN
>>>          0 - disabled (default)
>>>          not 0 - enabled
>>>
>>>          Be conservative in what you do, be liberal in what you accept
>>> from others.
>>>          If it's non-zero, we mark only out of window RST segments as
>>> INVALID.
>>>
>>> see:
>>> Documentation/networking/nf_conntrack-sysctl.txt
>>
>>
>>
>> cat /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal
>> 0
>>
>> This appears to be disabled.
>>
>
> Then try to enable it???

echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal
-su: /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal: Permission denied

I have found out something that may be helpful.  I set up a rule to
accept NEW packets with source port 80.  Sure enough that seemed to
clear up my logs.

So now the question is why the heck apache is sending out new packets
on what should be established connections?

Thank you again for your help,

Anthony
