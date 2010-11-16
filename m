From: Ben Pfountz <netprince@vt.edu>
Subject: Re: SFQ flow classifier, works for imq0, not for eth1
Date: Tue, 16 Nov 2010 10:31:08 -0500
Message-ID: <4CE2A3BC.5070008@vt.edu>
References: <4CDD55DE.50003@vt.edu> <4CE15E24.9020409@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CE15E24.9020409@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org



On 11/15/2010 11:21 AM, Patrick McHardy wrote:
> On 12.11.2010 15:57, Ben Pfountz wrote:
>> Hey Everyone,
>>
>> Any direction with this problem would be greatly appreciated.  For some
>> reason when I add a SFQ flow classifier using tc filter, the sfq qdisc
>> stops forwarding packets.  (strangely though, a few packets are
>> forwarded before things stop working)
>>
>> I am working with an openwrt based router, trying to add SFQ flow
>> classifier support to openwrt's qos-scripts.  I have simplified the TC
>> commands down to these to try to find the problem.
>>
>> tc qdisc add dev eth1 root handle 1: htb default 7
>> tc class add dev eth1 parent 1: classid 1:7 htb rate 500mbit ceil
>> 1000mbit prio 3
>> tc qdisc add dev eth1 parent 1:7 handle 10: sfq perturb 10
>> tc filter add dev eth1 protocol ip parent 10: handle 2 flow hash keys
>> src,dst divisor 1024
>>
>>
>>
>> Without the last line, packets flow normally as shown by
>>
>> # tc -s -d qdisc show dev eth1
>> qdisc htb 1: root refcnt 2 r2q 10 default 7 direct_packets_stat 0 ver 3.17
>>   Sent 856 bytes 11 pkt (dropped 0, overlimits 0 requeues 0)
>>   rate 0bit 0pps backlog 0b 0p requeues 0
>> qdisc sfq 10: parent 1:7 limit 127p quantum 1514b flows 127/1024 perturb
>> 10sec
>>   Sent 856 bytes 11 pkt (dropped 0, overlimits 0 requeues 0)
>>   rate 0bit 0pps backlog 0b 0p requeues 0
>>
>>
>> With the last line, I see this
>>
>> tc -s -d qdisc show dev eth1
>> qdisc htb 1: root refcnt 2 r2q 10 default 7 direct_packets_stat 0 ver 3.17
>>   Sent 5019 bytes 53 pkt (dropped 40, overlimits 0 requeues 0)
>>   rate 0bit 0pps backlog 0b 0p requeues 0
>> qdisc sfq 10: parent 1:7 limit 127p quantum 1514b flows 127/1024 perturb
>> 10sec
>>   Sent 5019 bytes 53 pkt (dropped 40, overlimits 0 requeues 0)
>>   rate 0bit 0pps backlog 0b 0p requeues 0
>>
>>
>> I have tried every combination of hash keys and divisor I can think of,
>> but the problem remains.
>>
>> The system is linux 2.6.32.25, iproute 2.6.35, and cls_flow is loaded.
>>
>> Does anyone have any suggestions?
>
> IMQ hooks into the netfilter hooks and thus receives IP packets only.
> On eth0 you have to take care of classifying ARP packets as well,
> otherwise packet flow will stop eventually.

I switched protocol to all, and its working well now.

Thanks!
