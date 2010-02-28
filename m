From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: multiport needs `-p tcp', `-p udp' - Why?
Date: Sun, 28 Feb 2010 07:54:55 +0100
Message-ID: <4B8A133F.8030606@chello.at>
References: <4B893433.7020401@gatworks.com> <cfeab66d1002270706m6228860en5d28a2d60a9b311c@mail.gmail.com> <4B894581.10700@gatworks.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B894581.10700@gatworks.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 27.02.2010 17:17, netfilter-owner@vger.kernel.org wrote:
> U'll have to let me know why "-p udp" is needed when the chain can only
> have udp packets, and therefor can only process udp packets.
> 
> I dont want to test over (( and over ) and over ) again when I know that
> the packet is already KNOWN to be from eth1 and of protocol UDP.

now if we add -p icmp -j PRE_UDP,  what should iptables do now?

use 'ferm' if you are too lazy to write iptables rules:
http://ferm.foo-projects.org/

> 
> adding "-p UDP" to multiport does make iptables happy, but appears to be
> a useless test.
> 
> On 02/27/2010 10:06 AM, ratheesh k wrote:
>> Port is in Layer 4 of protocol stack .

Very useless response ...


>>
>>
>> On Sat, Feb 27, 2010 at 8:33 PM, U. George<netbeans@gatworks.com>  wrote:
>>> In order to get to the chain, the protocol, as well as the interface
>>> must
>>> match. PRE_UDP if already filtered for "-p udp" . So why does multiport
>>> require another check for -p udp? Does it really need to have that
>>> option in
>>> order for it to work?
>>>
>>>> + /sbin/iptables -t filter -N PRE_UDP
>>>> + /sbin/iptables -t filter -A INPUT -i eth1 -p udp -j PRE_UDP
>>>> + /sbin/iptables -t filter -A PRE_UDP -m multiport --dport
>>>> 137,138,139,512,514,515,1433,1434 -j DROP
>>>> iptables v1.4.5: multiport needs `-p tcp', `-p udp', `-p udplite', `-p
>>>> sctp' or `-p dccp'
>>>> Try `iptables -h' or 'iptables --help' for more information.


TOP POSTING is <-- censored -->...
