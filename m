From: Kevin Mulcahy <k.mulcahy@galleryglobalnetworks.com>
Subject: Re: OUTPUT ACCEPT, but can't see out
Date: Thu, 04 Mar 2004 13:06:40 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40468F30.7010405@galleryglobalnetworks.com>
References: <40468233.1040702@galleryglobalnetworks.com> <200403032023.35644.Alistair Tonner <>>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <>>
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


>>$IPTABLES -A INPUT -i $INTERFACE -p ALL -m state --state
>>ESTABLISHED,RELATED -j ACCEPT
>>#Note - this appears to generate an error
>># iptables: No chain/target/match by that name
>># but would that affect OUTPUT ???
>>$IPTABLES -A INPUT -i $INTERFACE -p ALL -j RETURN
>>
>>$IPTABLES -A OUTPUT -o $INTERFACE -p ALL  -j ACCEPT
> 
> 
> 
> 
> 	Remove the -p ALL from your established related line.
> 	dont put one it ...covers all.

Done. But I still get the error.
I've read that loading in the appropriate module will solve this, but 
unfortunately my hosting company has built their own monolithic kernels 
which don't support loadable modules.
Is there any way around this?

> 	
> 	in answer to the question you commented in there, YES it will ..your policy on 
> 	input is DROP -- thus you are getting out, but nothing is getting BACK to you.
makes perfect sense.

Kev.

