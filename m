From: "U. George" <netbeans@gatworks.com>
Subject: Re: multiport needs `-p tcp', `-p udp' - Why?
Date: Sat, 27 Feb 2010 11:17:05 -0500
Message-ID: <4B894581.10700@gatworks.com>
References: <4B893433.7020401@gatworks.com> <cfeab66d1002270706m6228860en5d28a2d60a9b311c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1002270706m6228860en5d28a2d60a9b311c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

U'll have to let me know why "-p udp" is needed when the chain can only 
have udp packets, and therefor can only process udp packets.

I dont want to test over (( and over ) and over ) again when I know that 
the packet is already KNOWN to be from eth1 and of protocol UDP.

adding "-p UDP" to multiport does make iptables happy, but appears to be 
a useless test.

On 02/27/2010 10:06 AM, ratheesh k wrote:
> Port is in Layer 4 of protocol stack .
>
>
> On Sat, Feb 27, 2010 at 8:33 PM, U. George<netbeans@gatworks.com>  wrote:
>> In order to get to the chain, the protocol, as well as the interface must
>> match. PRE_UDP if already filtered for "-p udp" . So why does multiport
>> require another check for -p udp? Does it really need to have that option in
>> order for it to work?
>>
>>> + /sbin/iptables -t filter -N PRE_UDP
>>> + /sbin/iptables -t filter -A INPUT -i eth1 -p udp -j PRE_UDP
>>> + /sbin/iptables -t filter -A PRE_UDP -m multiport --dport
>>> 137,138,139,512,514,515,1433,1434 -j DROP
>>> iptables v1.4.5: multiport needs `-p tcp', `-p udp', `-p udplite', `-p
>>> sctp' or `-p dccp'
>>> Try `iptables -h' or 'iptables --help' for more information.
>>
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
