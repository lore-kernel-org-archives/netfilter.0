From: "U. George" <netbeans@gatworks.com>
Subject: Re: multiport needs `-p tcp', `-p udp' - Why?
Date: Sat, 27 Feb 2010 12:28:53 -0500
Message-ID: <4B895655.90005@gatworks.com>
References: <4B893433.7020401@gatworks.com>	 <cfeab66d1002270706m6228860en5d28a2d60a9b311c@mail.gmail.com>	 <4B894581.10700@gatworks.com> <cfeab66d1002270846q65493ac2y57ef59ca1eb2c650@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1002270846q65493ac2y57ef59ca1eb2c650@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

source      port offset for udp and tcp are both at  0 for IPv4
destination port offset for udp and tcp are both at 16 for IPv4


On 02/27/2010 11:46 AM, ratheesh k wrote:
> port offset may be differ  based on which layer 4 protocol , you are
> using . If u dont specify protocol ( layer 4 ) , netfilter dont know
> this .
>
>
> Please find below some code sinppet from  xt_multiport.c .
>
>
> 113  pptr = skb_header_pointer(skb, protoff, sizeof(_ports), _ports);
> 114         if (pptr == NULL) {
> 115                 /* We've been asked to examine this packet, and we
> 116                  * can't.  Hence, no choice but to drop.
> 117                  */
> 118                 duprintf("xt_multiport: Dropping evil offset=0
> tinygram.\n");
> 119                 *hotdrop = 1;
> 120                 return 0;
> 121         }
> 122
> 123         return ports_match(multiinfo->ports,
> 124                            multiinfo->flags, multiinfo->count,
> 125                            ntohs(pptr[0]), ntohs(pptr[1]));
>
> thanks,
> Ratheesh
>
>
>
> On Sat, Feb 27, 2010 at 9:47 PM, U. George<netbeans@gatworks.com>  wrote:
>> U'll have to let me know why "-p udp" is needed when the chain can only have
>> udp packets, and therefor can only process udp packets.
>>
>> I dont want to test over (( and over ) and over ) again when I know that the
>> packet is already KNOWN to be from eth1 and of protocol UDP.
>>
>> adding "-p UDP" to multiport does make iptables happy, but appears to be a
>> useless test.
>>
>> On 02/27/2010 10:06 AM, ratheesh k wrote:
>>>
>>> Port is in Layer 4 of protocol stack .
>>>
>>>
>>> On Sat, Feb 27, 2010 at 8:33 PM, U. George<netbeans@gatworks.com>    wrote:
>>>>
>>>> In order to get to the chain, the protocol, as well as the interface must
>>>> match. PRE_UDP if already filtered for "-p udp" . So why does multiport
>>>> require another check for -p udp? Does it really need to have that option
>>>> in
>>>> order for it to work?
>>>>
>>>>> + /sbin/iptables -t filter -N PRE_UDP
>>>>> + /sbin/iptables -t filter -A INPUT -i eth1 -p udp -j PRE_UDP
>>>>> + /sbin/iptables -t filter -A PRE_UDP -m multiport --dport
>>>>> 137,138,139,512,514,515,1433,1434 -j DROP
>>>>> iptables v1.4.5: multiport needs `-p tcp', `-p udp', `-p udplite', `-p
>>>>> sctp' or `-p dccp'
>>>>> Try `iptables -h' or 'iptables --help' for more information.
>>>>
>>>>
>>>>
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
>
