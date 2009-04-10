From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: iptables - full cone
Date: Fri, 10 Apr 2009 09:57:32 +0200
Message-ID: <49DEFBEC.1030408@chello.at>
References: <47A7F67C62706041BC49DB7822B1C9DB1506FB38FD@INOAVREX11.ptin.corpPT.com> <49DEFA34.6040207@chello.at>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49DEFA34.6040207@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Mart Frauenlob wrote:
> netfilter-owner@vger.kernel.org wrote:
>> Dear all,
>>
>> I'm using iptables 1.3.8, and I need to implement a full cone NAT 
>> which had to be capable of doing the following:
>> 1. A packet is sent from a machine in the LAN from Address1:port100 
>> to a machine in the WAN with Address3:port200, the NAT converts the 
>> local Address1:port100 to Address2:port100 which is the address 
>> assigned to the home router by the ISP. So this packet is sent with 
>> source: Address2:port100 and destination: Address3:port200.
>> 2. The packet received by the machine in the WAN in 1) is processed 
>> and then the answer comes from a different machine with a different 
>> address but using the same ports. So the response packet is sent by 
>> Address4:port200 to Address2:port100. So this packet has source: 
>> Address4:port200 and destination: Address2:port100.
>> 3. When the home router receives the response packet it has to ignore 
>> the sending address in the matching table, so that all traffic 
>> received in Address2:port100 is simply forward to Address1:port100. 
>> This is just a Full Cone NAT.
>>
>> I have read some tutorials about iptables and the only way I have 
>> found to do this is make rule that forwards all traffic that arrives 
>> in Address2:port100 to Address1:port100. This does the work for just 
>> one machine on the LAN which has a static ip and will always contact 
>> the same machine on the WAN.
>> What I really want to do is implement a Full Cone NAT in which a 
>> packet sent from Address1:port100 which is translated to 
>> Address2:port100 by the NAT and goes to Address3:port200, activates 
>> port100 in the home router so that any packets arriving in port100 
>> will be forwarded to Address1:por100. And this would just work for 
>> any number of machines.
>>
>> Is there anyway of doing so in the actual iptables or I will have to 
>> add this feature to iptables?
>>
>> Best Regards
>>
>> Hugo Mendes
>>   
>
> Just for curiosity:
>
> sorry if I write complete nonsense, I've never ever hacked with 
> libnetfilter...
> This is based on the assumption, that it's possible to create 
> conntrack entries from within libnetfilter, which may be completely 
> wrong...
>
> ok trying to figure:
>
> Lan host A1:100 sends packet to WAN host A3:200. packet arriving at 
> the router, it is sent to nfqueue.
> There a conntrack entry is created, to expect the answer from WAN host 
> A4:200.
> The NAT to A3 is still done.
> Packet goes to A3, comes back from A4:200, conntrack sees the entry we 
> created in our nfqueue.
> Now a rule should NAT that packet as coming from A2 (so client A1 will 
> not talk back to A4).
> Finally the packet gets forwarded to the client, which only sees his 
> talking with A2.
> The whole thing iterates again...
>
should be:
Now a rule should NAT that packet as coming from A3 (so client A1 will 
not talk back to A4).
Finally the packet gets forwarded to the client, which only sees his 
talking with A3.
