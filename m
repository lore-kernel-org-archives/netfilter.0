From: Aseem Rastogi <aseem@india.tejasnetworks.com>
Subject: Re: NAT tables and FILTER tables
Date: Wed, 14 Sep 2005 17:51:15 +0530
Message-ID: <432815BB.1000808@india.tejasnetworks.com>
References: <43280467.4050801@india.tejasnetworks.com>	<43280926.5090508@india.tejasnetworks.com>
	<432811AE.6010604@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from localhost (unknown [127.0.0.1])
	by anche.india.tejasnetworks.com (*****) with ESMTP
	id 512337393C; Wed, 14 Sep 2005 12:10:06 +0000 (UTC)
Received: from india.tejasnetworks.com (aseem.india.tejasnetworks.com
	[192.168.0.38]) by anche.india.tejasnetworks.com (*****) with ESMTP
	id 058257394F; Wed, 14 Sep 2005 17:40:04 +0530 (IST)
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Cc: netfilter@lists.netfilter.org

thanks joerg. this infact was the second line of thought that i had in=20
mind. i just posted the first one :-).

J=F6rg Harmuth wrote:

> Aseem Rastogi wrote:
>
>> in continuation:
>>
>> i am actually trying to understand how nat and default filter table=20
>> work together. my understanding is this:
>>
>> when a packet is encountered it is either:
>>
>> 1. a new connection creation request packet.
>>
>> 2. a packet associated with a connection that has been mangled by NAT=20
>> earlier.
>>
>> 3. a packet assiciated with a connection that has not been mangled by=20
>> NAT earlier.
>
>
> Not really. Each packet is one of:
>
> -> NEW packet with SYN set
> -> NEW packet without SYN set
> -> Part of a connection which has seen at least the SYN packet
>
> Basically, a NEW packet means, that there is no entry in the conntrack=20
> table.
>
>> Each case goes like this:
>>
>> Case 1: NAT table is considerd. Packet passes through PREROUTING=20
>> chain, routing decision and then POSTROUTING chain.
>
>
> No. Then filter/INPUT or filter/FORWARD - always.
>
>> Case 1a -- If either of them modified the packet, this packet and all=20
>> subsequent packets of this connection DO NOT PASS THROUGH FILTER=20
>> TABLE CHAINS.
>>
>> Case 1b -- None of NAT tables modifies packet. It passes through=20
>> FILTER table chains as usual.
>
>
> No. See above.
>
>> Case 2: This packet follows the fate of its earlier packets.=20
>> (PREROUTING AND POSTROUTING NAT table chains BUT NO FILTER table chain=
s)
>>
>> Case 3. Passes through FILTER TABLE chains.
>>
>> is this correct??
>
>
> No. It is almost vice-versa. Only NEW packet pass nat table, but all=20
> packets pass filter table.
>
> If you apply NAT to the first packet, these subsequent packet will be=20
> NATed automagically, so - in your words - they follow the fate of=20
> their earlier packet concerning NAT.
>
> HTH and have a nice time,
>
> Joerg
>
> PS: May I recommend Oskar Andreasson's excellent iptables tutorial at=20
> http://iptables-tutorial.frozentux.net/chunkyhtml/index.html ?
>
>> Aseem Rastogi wrote:
>>
>>> Hi,
>>>
>>> I have a small query.
>>>
>>> I have read that whenever a packet requesting a connection is=20
>>> encountered, NAT table is used. My question is : Does it mean that=20
>>> for new connection request packets ONLY NAT table is considered and=20
>>> not default FILTER table?
>>
>
>
>


--=20
The end is always good. If it's not good, it's not the end.




