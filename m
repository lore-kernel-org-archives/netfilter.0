From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: NAT tables and FILTER tables
Date: Wed, 14 Sep 2005 14:03:58 +0200
Message-ID: <432811AE.6010604@mnemon.de>
References: <43280467.4050801@india.tejasnetworks.com>
	<43280926.5090508@india.tejasnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43280926.5090508@india.tejasnetworks.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Aseem Rastogi wrote:
> in continuation:
> 
> i am actually trying to understand how nat and default filter table work 
> together. my understanding is this:
> 
> when a packet is encountered it is either:
> 
> 1. a new connection creation request packet.
> 
> 2. a packet associated with a connection that has been mangled by NAT 
> earlier.
> 
> 3. a packet assiciated with a connection that has not been mangled by 
> NAT earlier.

Not really. Each packet is one of:

-> NEW packet with SYN set
-> NEW packet without SYN set
-> Part of a connection which has seen at least the SYN packet

Basically, a NEW packet means, that there is no entry in the conntrack 
table.

> Each case goes like this:
> 
> Case 1: NAT table is considerd. Packet passes through PREROUTING chain, 
> routing decision and then POSTROUTING chain.

No. Then filter/INPUT or filter/FORWARD - always.

> Case 1a -- If either of them modified the packet, this packet and all 
> subsequent packets of this connection DO NOT PASS THROUGH FILTER TABLE 
> CHAINS.
> 
> Case 1b -- None of NAT tables modifies packet. It passes through FILTER 
> table chains as usual.

No. See above.

> Case 2: This packet follows the fate of its earlier packets. (PREROUTING 
> AND POSTROUTING NAT table chains BUT NO FILTER table chains)
> 
> Case 3. Passes through FILTER TABLE chains.
> 
> is this correct??

No. It is almost vice-versa. Only NEW packet pass nat table, but all 
packets pass filter table.

If you apply NAT to the first packet, these subsequent packet will be 
NATed automagically, so - in your words - they follow the fate of their 
earlier packet concerning NAT.

HTH and have a nice time,

Joerg

PS: May I recommend Oskar Andreasson's excellent iptables tutorial at 
http://iptables-tutorial.frozentux.net/chunkyhtml/index.html ?

> Aseem Rastogi wrote:
> 
>> Hi,
>>
>> I have a small query.
>>
>> I have read that whenever a packet requesting a connection is 
>> encountered, NAT table is used. My question is : Does it mean that for 
>> new connection request packets ONLY NAT table is considered and not 
>> default FILTER table?


