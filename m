From: Joel Vosu <joel.vosu@mail.ee>
Subject: Re: Change source address on incoming packets
Date: Mon, 10 May 2004 01:31:56 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <409EB15C.3080707@mail.ee>
References: <409EA7A6.8070000@mail.ee> <200405092314.01941.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405092314.01941.Antony@Soft-Solutions.co.uk>
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

Antony Stone wrote:

>On Sunday 09 May 2004 10:50 pm, Joel Vosu wrote:
>
>  
>
>>I would need to be able to change the source address of incouming
>>packets. I have 2 different subnets, but I need the server to see the
>>packes from the 2nd subnet as coming from the 1st.
>>in iptables it would be something like:
>>iptables -A PREROUTING -t nat -s 2nd_subnet -j SNAT --to-source
>>local_machine
>>but this is not possible because SNAT only works for outgoing packets in
>>POSTROUTING.
>>Is there a way to get this to work other than adding a second router box
>>for NAT?
>>    
>>
>
>The only way I can think you'd be able to do this on one box is by hacking 
>around the source for netfilter so you can use SNAT in PREROUTING.   You'd 
>need to be careful about the auto-reverse NAT for reply packets, as well, to 
>make sure they go back to the original machine.
>
>Not impossible, by any means, but it's almost certainly easier to dig up an 
>old 486 or Pentium and run NAT on that.
>
>Regards,
>
>Antony.
>
>  
>
Thanks Antony,
But since I'm not that good at hacking source I hope I'll still find an 
easyer solution. As for the 486 or pentium part... if I cant find 
anything by tomorrow morning I'll have to use that. Right now I'm 
checking proxy applications if they can do what is required.

Joel

