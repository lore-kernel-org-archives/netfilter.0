From: Scott Hall <halls@aros.net>
Subject: Re: icmp: 10.1.4.50 unreachable - need to frag (mtu 500) [tos 0xc0]
Date: Tue, 13 Jan 2004 01:02:51 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4003A62B.7020108@aros.net>
References: <3FFA5EBD.1000701@aros.net> <1073388187.2047.250.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1073388187.2047.250.camel@grendel>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter@lists.netfilter.org

So the one question that this whole issue raises in my mind is, Isn't 
there anyway to handle the (DF) packets differently?  These packets 
aren't important as far as QoS they just need to be delivered.  I ask 
becuase we have two cisco routers and 6 Adtran routers that handle this 
same scenario quietly.  Does anyone have any idea how they handle the 
"don't frag" packets?  I wonder if there is someway to ignore the DF bit 
and frag the packets anyway. 

Thanks for any suggestions you can offer.

--Scott

Chris Brenton wrote:

>GReets Scott,
>
>On Tue, 2004-01-06 at 02:07, Scott Hall wrote:
>  
>
>>I am using this setup to share a single T1 pipe for both voice (via IP 
>>telephone) and data.  That is the reason for the 500 MTU across the t1 
>>link. 
>>    
>>
>
>You may find you are going to have this problem a bit more often. See
>below.
>
>  
>
>> >>>>> Not sure why I don't see the original request <<<<<<<<
>>    
>>
>
>What do you mean by "original request"? DNS query? TCP three packet
>handshake? Both appear to be missing from your traces. The DNS info
>could have still been in cache however.
>
>  
>
>>16:48:57.275929 Fasttrack2.machinerytrader.com.http > 
>>--PUBLIC_IP--.1308: P 1481515766:1481517126(1360) ack 2518922124 win 
>>65161 (DF)
>>    
>>
>
>ACK packet with absolute sequence numbers tells me we missed the initial
>handshake somehow. From the window size it looks like we are well into
>the data session.
>
>  
>
>>16:48:57.275953 --PUBLIC_IP-- > Fasttrack2.machinerytrader.com: icmp: 
>>10.1.4.50 unreachable - need to frag (MTU 500) [tos 0xc0]
>>    
>>
>
>Two problems here:
>1) A lot of networks, and even some ISP's for that matter, are now
>dropping all ICMP due to some of the Window's worms running around.
>Don't tell me that its a brain dead idea, you are preaching to the
>choir, just letting you know I see people doing it in the wild.
>
>Also, even if the sending system does receive this packet, I'm guessing
>it will pitch it. You are telling the remote Web server that the
>connection to 10.1.4.50 needs to have its traffic fragmented. I'm
>guessing the Web server sees the connection as originating from a public
>address. (the NAT address you are using). Since the payload IP does not
>match, it will disregard the packet as an unsolicited ICMP error.
>
>  
>
>>16:48:57.276111 --PUBLIC_IP--.32769 > ns1.mydomain.com.domain:  25222+ 
>>PTR? 17.164.70.63.in-addr.arpa. (43)  (DF)
>>    
>>
>
>Weird its doing a reverse lookup, but not a problem.
>
>  
>
>>16:59:25.962167 Fasttrack2.machinerytrader.com.http > 
>>--cust-publicIP--.29695: P 308:1668(1360) ack 375 win 65161 (DF)
>>    
>>
>
>OK, completely new session well that's a few packets into the data
>transfer.
>
>  
>
>>16:59:25.962189 --PUBLIC_IP-- > Fasttrack2.machinerytrader.com: icmp: 
>>--cust-publicIP-- unreachable - need to frag (MTU 500) [tos 0xc0]
>>    
>>
>
>There goes our ICMP error with a private address in the payload again.
>:)
>
>  
>
>> >>>> I see this traffic next but the customer side doesn't receive the 
>>packets <<<<<<
>>
>>16:59:33.605043 --cust-publicIP--.29695 > 
>>Fasttrack2.machinerytrader.com.http: R 2681907386:2681907386(0) win 0 (DF)
>>    
>>
>
>OK, something is weird. If the frag info did not get though we should
>have seen the Web site attempt some retransmissions. Also, we're looking
>at absolute sequence numbers. I think we again didn't get to see some of
>the packets in the session. Are you stopping and restarting your packet
>capture?
>
>  
>
>>16:59:38.142184 --cust-publicIP--.29714 > 
>>Fasttrack2.machinerytrader.com.http: S 2689170753:2689170753(0) win 
>>65280 <mss 1360,nop,nop,sackOK> (DF)
>>16:59:38.174050 Fasttrack2.machinerytrader.com.http > 
>>--cust-publicIP--.29714: S 3983995986:3983995986(0) ack 2689170754 win 
>>65535 <mss 1380,nop,nop,sackOK> (DF)
>>16:59:38.178358 --cust-publicIP--.29714 > 
>>Fasttrack2.machinerytrader.com.http: . ack 1 win 65280 (DF)
>>    
>>
>
>WAHOO! A three packet handshake. This time we got in from the beginning!
>:)
>
>  
>
>>16:59:38.181116 --cust-publicIP--.29714 > 
>>Fasttrack2.machinerytrader.com.http: P 1:430(429) ack 1 win 65280 (DF)
>>16:59:38.216940 Fasttrack2.machinerytrader.com.http > 
>>--cust-publicIP--.29714: P 1:241(240) ack 430 win 65106 (DF)
>>    
>>
>
>OK, up to here we are good because your MTU did not get exceeded. 
>
>  
>
>>16:59:38.220596 Fasttrack2.machinerytrader.com.http > 
>>--cust-publicIP--.29714: P 241:1601(1360) ack 430 win 65106 (DF)
>>    
>>
>
>And again, we hit an MTU that exceeds you max, so this is were the
>problems start. I'm guessing after this we had an outbound ICMP frag
>needed, followed by a couple of inbound retransmissions of the above
>packet, but it would have been cool to see it in order to confirm.
>
>HTH,
>C
>
>
>
>  
>


