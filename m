From: Martijn Lievaart <m@rtij.nl>
Subject: Re: syn DDoS attack solution
Date: Fri, 01 Jun 2007 23:34:02 +0200
Message-ID: <466090CA.2050806@rtij.nl>
References: <465EF582.4070904@bgs.hu>
	<015e01c7a3bf$64fbe7e0$2ef3b7a0$@COM>	<465FEA82.709@bgs.hu>
	<007101c7a45d$bc50e380$34f2aa80$@COM>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <007101c7a45d$bc50e380$34f2aa80$@COM>
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
To: Ric Messier <kilroy@WasHere.COM>
Cc: netfilter@lists.netfilter.org

Ric Messier wrote:
> Bgs writes:
>   
>> Some more info about the attack: All IPs were real IPs otherway the tcp
>> handshake wouldn't have made it. The attacker IPs were also consistent.
>> They also new about the blocked IPs as after a new bunch of blocked IPs
>> we fared OK then they added another bunch new IPs... we played this for
>> quite some time...
>>
>> All connections were in the ESTABLISHED state.
>>
>>     
>
> Then your original description was incorrect or at least inadequate. It has
> nothing to do with SYN as originally suggested since an ESTABLISHED
> connection has blown past SYN, through SYN/ACK and by ACK. It has completed
> the TCP handshake, as you note above. A SYN attack/flood would stop after
> sending the initial SYN and leave the connection half-open to exhaust the
> half-open buffers.
>   

An connection is in the ESTABLISHED state once a packet has been seen. 
So once the SYN is seen, the state is ESTABLISHED.

M4


