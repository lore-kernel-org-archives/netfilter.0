From: "Alec Matusis" <alecm@chatango.com>
Subject: RE: "distributed router" question
Date: Sat, 24 Feb 2007 13:31:30 -0800
Message-ID: <47965.8371689313$1172352756@news.gmane.org>
References: <200702241418.22551.silvio@pizzaroot.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200702241418.22551.silvio@pizzaroot.com.br>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: 'Silvio Fonseca' <silvio@pizzaroot.com.br>

Hi Silvio,

Thanks for your response. 

I still do not understand why SNATting in B to public IP of box A would not
work?
By this I mean the following:

1) Client sends packet to box A ( src: 9.10.11.12 dst: 1.2.3.4 )
2) Box A does DNAT (PREROUTING) to box B ( src: 9.10.11.12 dst: 10.0.0.2 )

Box B receives the packet and replies directly to the client:
1) Box B does SNAT (POSTROUTING) using box A WAN as source (src: 1.2.3.4
dst: 9.10.11.12)

There are two reasons why I'd like to implement it this way:

a) Reduce the load on box A so that the packets from B go directly to the
client 9.10.11.12, bypassing A.
b) The server on box B must log the IPs of all clients (i.e. log the
original client IP  9.10.11.12) 

Thank you,

Alec Matusis


>-----Original Message-----
>From: Silvio Fonseca [mailto:silvio@pizzaroot.com.br] 
>Sent: Saturday, February 24, 2007 8:18 AM
>To: netfilter@lists.netfilter.org
>Cc: Alec Matusis
>Subject: Re: "distributed router" question
>
>Hello Alec,
>
>In this situation you have to SNAT on box A before sending the 
>packet to box 
>B:
>
>1) Client send packet to box A ( src: 9.10.11.12 dst: 1.2.3.4 )
>2) Box A does DNAT (PREROUTING) to box B ( src: 9.10.11.12 
>dst: 10.0.0.2 )
>3) Box A does SNAT (POSTROUTING) using box A LAN as source ( 
>src: 10.0.0.1 
>dst: 10.0.0.2 )
>
>Box B receives the packet and reply:
>
>1) Box B reply to box A ( src: 10.0.0.2 dst: 10.0.01 )
>2) Box A revert the SNAT ( src: 10.0.0.2 dst: 9.10.11.12 )
>3) Box A revert the DNAT ( src: 1.2.3.4 dst: 9.10.11.12 )
>
>Asymmetrical routing, using box A WAN to receive and box B WAN 
>to send, won't 
>work because you will need to SNAT to the public IP address of 
>B before 
>sending to the public network (source will be 5.6.7.8) while 
>the client is 
>expecting A public address (source 1.2.3.4).
>
>Hope that helps.
>
>Silvio Fonseca
>
>> I am wondering if I am doing something legitimate, or it's 
>against TCP/IP
>> (I am a physicist by education, so I do not know):
>>
>> I have box A that has one connection to WAN and one 
>connection to LAN. On
>> box A, eth0 has a public ip 1.2.3.4 and eth1 has a private 
>ip 10.0.0.1
>>
>> I have box B that also has one connection to WAN and another 
>one to the
>> same LAN. On B, eth0 has a public ip 5.6.7.8 and eth1 has a 
>private ip
>> 10.0.0.2
>>
>> I configured iptables in box A to forward packets destined 
>for 1.2.3.4:3000
>> to the destination 10.0.0.2:3000 , i.e. to box B. This part works, I
>> checked with tcpdumps.
>>
>> Now, the box B after receiving a SYN packet via box A on 
>eth1, sends an ACK
>> packet directly through its WAN interface eth0 to the 
>client. If I do not
>> configure POSTROUTING SNAT , those ACK packets appear to 
>originate from
>> 10.0.0.2, so they are rejected by the client.
>> My question is: if I configure SNAT on box B so that ACK 
>packets appear to
>> come from box A (i.e. from 1.2.3.4), would this be a legitimate
>> configuration?
>>
>> In other words, a SYN packet is sent to one machine, 
>forwarded via LAN to
>> another machine, and the ACK packet is sent from the second 
>machine having
>> the source ip of the first machine. For that matter, all 
>incoming packets
>> from the client are received by A, then forwarded to B, and 
>all response
>> packets are sent directly from B to the client. Is this a legitimate
>> configuration?
>


