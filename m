From: Greg Wilson-Lindberg <gwilson@spacex.com>
Subject: Re: Multiple interfaces with the same IP address
Date: Wed, 7 Oct 2009 16:00:59 -0700
Message-ID: <4ACD1DAB.6070102@spacex.com>
References: <4ACCEDDA.9020508@spacex.net> <4ACCF3F0.5040703@hp.com>		<4ACCFF8F.1010000@spacex.net> <4ACD04EA.5040303@hp.com>	<33be4bb30910071421s3410e8e4jdadedbc216de958a@mail.gmail.com> <4ACD0ED9.10601@spacex.com> <4ACD1941.8000805@hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ACD1941.8000805@hp.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

The 'broadcasts' are just to allow us to get to a subset of the machines on the HDLC nets.  I 
suppose that they could be called IP multicasts, although the are not using the traditional 
multicast addresses.  The broadcasts addresses should never be generated outside of the 'gateway' 
(we actually call these machines proxies).  The gateway is actually used as a proxy for some 
services, hence the need to be able to broadcast packets to some subset of the devices on the HDLC 
nets (commands for a class of machines).  The traffic that goes between the HDLC nets and the 
ethernet is (at this point) all initiated from the machines on the HDLC nets, things like NFS 
mounts.  As I stated in a previous email, we have contemplated using the iptable NETMAP target to 
directly map something like 10.192 on the ethernet WAN to 172.16 on the HDLC nets.  But this will be 
for the convenience of being able to then directly telnet into the machines on the HDLC nets, not 
for sending 'broadcasts'.

Greg

Rick Jones wrote:
> Greg Wilson-Lindberg wrote:
>> Ok, I can use route to add the various IP addresses that are on each 
>> HDLC channel to the routing tables.  There are a lot of machines, but 
>> because the addresses are well known/formatted, generating the scripts 
>> automatically won't be to bad.  But how do I handle broadcast addresses 
>> such as 172.16.255.255, 172.16.128.255, or 172.16.129.15 that need to go 
>> out all of the HDLC channels?
> 
> How are those going to appear on the gateway's 10net interface in the first 
> place?  I thought stuff like "directed broadcast" was verboten these days and 
> essentially unsupported by any stack.  That is why I was asking if these were to 
> be broadcasts or perhaps IP multicasts - where IP multicasts *can* and do get 
> routed.
> 
> Please don't take this the wrong way, but on the surface, the setup you've 
> described sounds terribly kludged and so very brittle, and given the domain of 
> your email and a bit of reader imagination that is, well, troubling :)
> 
> rick jones
> 
>> Oskar Berggren wrote:
>>
>>> 2009/10/7 Rick Jones <rick.jones2@hp.com>:
>>>
>>>> Greg Wilson-Lindberg wrote:
>>>>
>>>>> Rick Jones wrote:
>>>>> ...
>>>>>
>>>> I have not fully parsed the manpage for the ip command, but it does have
>>>> tidbits which suggest being able to specify interfaces by name when
>>>> manipulating routing tables.  If that is correct you should be able 
>>>> to add
>>>> specific host routes pointing-out specific interface names if you are 
>>>> indeed
>>>> forced to put assign the same IP address to each of the HCLC 
>>>> interfaces on
>>>> the "gateway."
>>>>
>>> Yes,
>>>
>>>   ip route add x.x.x.x/x dev eth1
>>>
>>> or similar works fine.
>>>
>>> If you like, you can also use ip addr add x.x.x.x/32 dev eth1 to set
>>> an ip-address without having the kernel automatically install a subnet
>>> route. Then manage the routing tables complete by yourself.
>>>
>>> /Oskar
>>> -- 
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
