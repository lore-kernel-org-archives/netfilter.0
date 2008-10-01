From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Something weird
Date: Wed, 01 Oct 2008 09:13:24 -0500
Message-ID: <48E38584.60704@riverviewtech.net>
References: <200810010834.51705.mveloso@tecnologiaip.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200810010834.51705.mveloso@tecnologiaip.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/01/08 06:34, Marcio Veloso Antunes wrote:
> Can you bring me some light on why packets from 172.18.0.13 are 
> crossing ppp0 whithout being masqueraded?

I can't tell for sure (you did not provide your IP addresses per say) 
but it looks like the traffic is from your internal network and headed 
for your external ppp0 interface its self.

Seeing as how you did not actually provide your IPs I'm guessing based 
on the fact that you have a route of 200.198.184.204/32 on your ppp0 
interface that said IP is bound to said interface.  If this is the case, 
it is possible that the traffic is entering the kernel and going up the 
network stack directly rather than being forwarded like you would expect.

I believe this is coming back to the fact that IPs are not bound to an 
interface per say, but rather the computer and that in some situations 
any interface in the system will take the traffic and pass it up in to 
the network with out forwarding it over to the interface that it is 
bound to before it takes the traffic and passes it higher in the 
networking stack.



Grant. . . .
