From: Stephen Satchell <list@satchell.net>
Subject: Re: Reload IPtables
Date: Fri, 25 Jun 2021 15:20:54 -0700
Message-ID: <17be70e7-48df-8615-4139-08b711aae973@satchell.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

Look into iptables-restore(8)

Assuming that you have previously used
"iptables-save >/root/iptables.ipv4" and
"ip6tables-save >/root/iptables.ipv6",

then you can reload the tables using
"iptables-restore </root/iptables.ipv4" and
"ip6tables-restore </root/iptables.ipv6"

Note that a save does not save the state of /proc/sys/net variables 
(like /proc/sys/net/ipv4/ip_forward), and consequently restore doesn't 
change the state of /proc/sys/net variables.

When I have written scripts to handle this sort of stuff, I handle 
/proc/sys/net/ipv4/ip_forward and /proc/sys/net/ipv6/conf/*/forwarding 
myself.  To make a reload as atomic as possible, I first turn off 
forwarding, the issue the two restore commands, then set the /proc 
variables to their saved values.

On 6/25/21 2:30 PM, slow_speed@att.net wrote:
> Thank you.
> 
> I do not believe it is something one would use a script for. Rather, 
> there should be a way to reload the information into memory without 
> having to reboot.
> 
> 
> On 6/25/21 4:51 PM, David Hajes wrote:
>> on Debian I flushed all tables including custom tables and used to run 
>> iptables bash script before I moved to nftables. OpenBSD same strategy 
>> - flush and reload pf.conf
>>
>> if that is what you mean by reload.
>>
>> On 25/06/2021 21:24, slow_speed@att.net wrote:
>>> What is the preferred command to reload the current rules for 
>>> iptables? (Please include Debian environment, if distro-specific.)
>>>
> 

