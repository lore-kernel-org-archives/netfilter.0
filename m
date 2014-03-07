From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Some oddities while setting up outbound filtering on a web server
Date: Fri, 07 Mar 2014 05:46:17 +0100
Message-ID: <53194F19.90708@chello.at>
References: <CA+5v4QC81A2gU8i566G3Nh_dERTv6LbkssZDfSe664BXj=9NEg@mail.gmail.com>	<5318BDEE.6080606@chello.at> <CA+5v4QAeWp6Azau3nYpL2ev-jqstSs+-BGBMuyavbKSK85JiAg@mail.gmail.com>
Reply-To: mart.frauenlob@chello.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+5v4QAeWp6Azau3nYpL2ev-jqstSs+-BGBMuyavbKSK85JiAg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anthony Taylor <ataylor@fallsgeek.com>
Cc: netfilter@vger.kernel.org

On 07.03.2014 00:39, Anthony Taylor wrote:
> On Thu, Mar 6, 2014 at 12:26 PM, Mart Frauenlob
> <mart.frauenlob@chello.at> wrote:
>> On 04.03.2014 17:52, Anthony Taylor wrote:
>>>
>>> On Sat, Feb 22, 2014 at 4:37 AM, Mart Frauenlob
>>> <mart.frauenlob@chello.at> wrote:
>>>>
>>>>
>>>> On 21.02.2014 23:36, Anthony Taylor wrote:
[...]

> So when I'm satisfied with my logs I should just do a:
> iptables -P OUTPUT DROP

yep

[...]

>>>
>>>>
>>>> nf_conntrack_tcp_be_liberal - BOOLEAN
>>>>           0 - disabled (default)
>>>>           not 0 - enabled
>>>>
>>>>           Be conservative in what you do, be liberal in what you accept
>>>> from others.
>>>>           If it's non-zero, we mark only out of window RST segments as
>>>> INVALID.
>>>>
>>>> see:
>>>> Documentation/networking/nf_conntrack-sysctl.txt
>>>
>>>
>>>
>>> cat /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal
>>> 0
>>>
>>> This appears to be disabled.
>>>
>>
>> Then try to enable it???
>
> echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal
> -su: /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal: Permission denied
>

strange, don't know what is the problem there...

> I have found out something that may be helpful.  I set up a rule to
> accept NEW packets with source port 80.  Sure enough that seemed to
> clear up my logs.
>
> So now the question is why the heck apache is sending out new packets
> on what should be established connections?

this is what I use:
-A BAD_TCP_PACKETS -p tcp -m tcp --tcp-flags SYN,ACK SYN,ACK -m 
conntrack --ctstate NEW -j REJECT --reject-with tcp-reset
-A BAD_TCP_PACKETS -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m 
conntrack --ctstate NEW -j DROP



