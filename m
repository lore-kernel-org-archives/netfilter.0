From: Dominic Iadicicco <sctylib2004@yahoo.com>
Subject: Re: Can anyone tell me how to do this?
Date: Wed, 22 Sep 2004 07:45:18 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040922144518.81033.qmail@web51309.mail.yahoo.com>
References: <1095863109.4393.9.camel@coati>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095863109.4393.9.camel@coati>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

Eric:

Where should I put?

  "iptables -A POSTROUTING -t nat -d 172.16.12.212 -p
> tcp --dport 22 \\ 
> -j SNAT --to 172.16.12.130"


Should that command also be executed on the same
machine as the previous?


Thanks

Dom
 
--- Eric Leblond <eric@inl.fr> wrote:

> On Wed, 2004-09-22 at 16:09, Dominic Iadicicco
> wrote:
> > Hello all,
> > My devil-Box is at 172.16.12.130 and I want all
> ssh
> > request to this .130 address, to go to address
> > 172.16.12.212.   
> 
> go to : it's the easy part : 
> iptables -A PREROUTING -t nat -d 172.16.12.130 -p
> tcp -dport 22 \\
> -j DNAT --to 172.16.12.212
> 
> well that's for go to. But let say A try to connect
> to 172.16.12.130 then
> 172.16.12.212 receive a connection from 1 and answer
> to A which wait
> answer from 172.16.12.130. bad day for him.
> The solution is to change source address of packets
> going to
> 172.16.12.212 :
> iptables -A POSTROUTING -t nat -d 172.16.12.212 -p
> tcp --dport 22 \\ 
> -j SNAT --to 172.16.12.130
> 
> thus we have the following :
>  A talks to 172.16.12.130
>  packet arrive to 172.16.12.212 with source
> 172.16.12.130
> packet return to 172.16.12.130
> which reemit to A.
> 
> BR,
> -- 
> Eric Leblond <eric@inl.fr>
> INL
> 
> 



		
_______________________________
Do you Yahoo!?
Declare Yourself - Register online to vote today!
http://vote.yahoo.com

