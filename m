From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Modify packet without NAT
Date: Sun, 18 Jun 2023 17:55:37 +0200
Message-ID: <1a493dfb-54cf-7b1f-52da-f6335bb8f654@thelounge.net>
References: <GYTTaXkbSkEr3VAyArWUUy2ZOCgqBJ91AiJN2WBVdBUQrUJaHAUkn42u5EVDlPZXwlUJW49u1XMxGnJku_TPIRqLB4KXyBWUsEnw2LWef-k=@proton.me>
 <68081ede-21a0-48be-aecc-d959f317bcb5@thelounge.net>
 <Yx2SfoKfezY0BYo1HR62Qk9XK3cFc2OmDz23H29qQEJiSjDuWurALweCqK8aup09tG3q59mUU6_8UFBYCXMC3Y3GMQsqvqhiBaFgYVGZDQY=@proton.me>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <Yx2SfoKfezY0BYo1HR62Qk9XK3cFc2OmDz23H29qQEJiSjDuWurALweCqK8aup09tG3q59mUU6_8UFBYCXMC3Y3GMQsqvqhiBaFgYVGZDQY=@proton.me>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: public1020 <public1020@proton.me>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

that below is from our public firewall for a /24 company newtork hosting 
email and websites (besides the usual internal stuff)

current memory usage: 231 MB

the defaults are for single nodes with no real network traffic to avoi 
duseless memory allocation on your notebook out-of-he-box i would say

Am 18.06.23 um 16:34 schrieb public1020:
> The system is IPv4 and intranet only, suppose I'm going to increase the hash size,
> 
> 1. What is the potentially maximum size needed?
> 2. How much kernel memory is needed accordingly?
> 
> ------- Original Message -------
> On Sunday, June 18th, 2023 at 5:14 PM, Reindl Harald <h.reindl@thelounge.net> wrote:
> 
> 
>>
>> Am 17.06.23 um 05:22 schrieb public1020:
>>
>>> I have a simple nat configuration to forward certain access to a gateway:
>>>
>>> iptables -t nat -A PREROUTING -p tcp -m set --match-set http_port dst,dst -j DNAT --to-destination XXX:80
>>> iptables -t nat -A POSTROUTING -j MASQUERADE
>>>
>>> Can I do that without nat? Just trying to avoid the "conntrack table full" issue.
>>> Is there a non-stateful solution?
>>
>>
>> conntrack don't depend on NAT at all but nearly any useful setup depends
>> on conntrack
>>
>> i can't think of a useful ruleset without RELATED,ESTABLISHED rules and
>> ctstate is conntrack
>>
>> in other words: without explicit "CT notrack" in the RAW-table there is
>> always conntrack
>>
>> fix your config instead trying to work aorund it
>>
>> [root@firewall:~]$ cat /etc/modprobe.d/iptables-conntrack.conf
>> options nf_conntrack hashsize=524288 expect_hashsize=2048
