From: Aravindhan Dhanasekaran <adhanas@ncsu.edu>
Subject: Re: Help: Marking UDP packets in a bridge
Date: Mon, 13 Oct 2014 00:58:42 -0400
Message-ID: <543B5C02.8090906@ncsu.edu>
References: <5437FB00.3030806@ncsu.edu> <543B5046.7000200@atc.tcs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <543B5046.7000200@atc.tcs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vigneswaran R <vignesh@atc.tcs.com>, netfilter@vger.kernel.org

On 10/13/2014 12:08 AM, Vigneswaran R wrote:
> On 10/10/2014 08:58 PM, Aravindhan Dhanasekaran wrote:
>> Hello,
>>
>> I'm trying to mark UDP packets entering (or leaving) a bridge, destined to a
>> particular UDP port on a machine on the other side of the bridge.
>>
>> My simple topology looks like:
>> host1 [eth1] <-----> [s1-eth1] bridge [s1-eth2] <-----> [eth1] host2
>>
>>
>> I've added a rule to the FORWARD chain on the mangle table in the bridge to mark
>> the packets that I require:
>> $ sudo iptables -t mangle -A FORWARD -p udp --dport 9917 -j MARK --set-mark 17
>> $ iptables -L FORWARD -t mangle -v
>> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>>   pkts bytes target     prot opt in     out     source       destination
>>      0     0 MARK       udp  --  any    any     anywhere     anywhere      udp
>> dpt:9917 MARK set 0x11
>>
>>
>> But, looks like none of packets are being marked (counters are all 0s in
>> iptables output as shown above). I have traffic matching the above rule flowing
>> through the bridge which I verified using tcpdump.
>> $ sudo tcpdump -i s1-eth1 udp dst port 9917
>> ...
>> 11:22:14.774417 IP 10.0.0.2.49774 > 10.0.0.1.9917: UDP, length 1470
>> 11:22:14.774597 IP 10.0.0.2.49774 > 10.0.0.1.9917: UDP, length 1470
>> 11:22:14.774731 IP 10.0.0.2.49774 > 10.0.0.1.9917: UDP, length 1470^C
> 
> May be, we should do the packet marking using ebtables (instead of 
> iptables) for Ethernet bridge. I am not sure..

When I added the above rule as a filter to my qdiscs, it worked as expected. So,
I guess my packets were actually marked, just  that the counters were 0.

