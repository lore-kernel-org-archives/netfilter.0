From: Carsten Maass <cm@blinkenlichten.de>
Subject: Re: Iptables / KAME IPSec problem: source port information lost
Date: Wed, 10 Mar 2004 15:16:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <404F2329.5040407@blinkenlichten.de>
References: <404DB826.3000709@blinkenlichten.de> <20040309193630.GJ24806@samad.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040309193630.GJ24806@samad.com.au>
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
To: netfilter@lists.netfilter.org

Alexander Samad wrote:
>>My problem is:
>>--------------
>>
>>At some point in the filtering process, the information about the source 
>>ports of the incoming and decrypted packet gets lost, so that the 
>>clients on the localnet don't accept it as one of the established 
>>connection.
>>
>>Here is some example:
>>---------------------
>>
>>The tcpdump was taken on Gateway A, listening on all interfaces.
>>
>>Client 192.168.3.4 on Localnet A tries to establish a http-connection to 
>>client 192.168.0.1 on Localnet B.
>>
>>12:05:48.370984 192.168.3.4.35114 > 192.168.0.1.80: S 
>>3186461765:3186461765(0) win 5840 <mss 1460,sackOK,timestamp 220395665 
>>0,nop,wscale 0> (DF)
>>
>>The initial packet...
>>
>>12:05:48.372462 218.10.35.139 > 146.254.136.108: 
>>ESP(spi=0x0a6825be,seq=0xaf) (DF)
>>
>>...gets correctly encrypted and sent out to Gateway B (146.254.136.108).
>>
>>12:05:48.447361 146.254.136.108 > 218.10.35.139: 
>>ESP(spi=0x03e34241,seq=0xa5) (DF)
>>
>>The encrypted response arrives at Gateway A (218.10.35.139).
>>
>>12:05:48.447361 192.168.0.1.80 > 192.168.3.4.35114: S 
>>969293027:969293027(0) ack 3186461766 win 5792 <mss 
>>1460,sackOK,timestamp 2220996862 220395665,nop,wscale 0> (DF)
> 
> 
> Sorry but isnt this the Sync/Ack packat in response to the sync above

Yes, but did i say anything else?. Maybe my formatting was misleading:

First Line = packet
Next line = description of packet

>>The packet gets decrypted, the source port is correct.
>>
>>12:05:48.448584 192.168.0.1.1 > 192.168.3.4.35114: S 
>>969293027:969293027(0) ack 3186461766 win 5792 <mss 
>>1460,sackOK,timestamp 2220996862 220395665,nop,wscale 0> (DF)
> 
> 
> Isn't this the same packet above but looks NAT'd ? Not sure why it is
> coming from port 1 though.

My guess: As tcpdump was listening on all interfaces, the packet appears 
three times. 1. in encrypted form arriving on inet_iface, 2. in 
decrypted form on inet_iface, 3. as it leaves the box on lan_iface. But 
the question remains: why does the source port change? Is there a way to 
determine at which stage of the filtering chain the change occurs?

>>And here the strange thing apperars: The packet is sent out with a 
>>source port of 1!
>>
>>12:05:48.448816 192.168.3.4.35114 > 192.168.0.1.1: R 
>>3186461766:3186461766(0) win 0 (DF)
>>
>>As it comes from source port 1, the client does not recognize it as a 
>>packet which belongs to the established connection and rejects it.
>>
>>12:05:48.449038 218.10.35.139 > 192.168.0.1: 
>>ESP(spi=0x0a6825be,seq=0xb0) (DF)
>>
>>The reject gets encrypted, sent out over the tunnel and the game starts 
>>over again.
>>
>>Portless connections like ping don't show this behavior and gets 
>>established correctly.

Thank you for your answer,
Carsten.

