From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Filter all but 1 calss c
Date: Wed, 12 May 2004 23:00:56 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405122300.57052.Alistair@nerdnet.ca>
References: <W123333069650381084412429@webmail2> <002d01c4388e$2e523ef0$3a7b1c0a@Gail>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002d01c4388e$2e523ef0$3a7b1c0a@Gail>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On May 12, 2004 10:01 pm, Scott Miller wrote:
> Hello all,
>
>    I'm failry new to IPChains, and am attempting to block ALL traffic,

	I hope you mean iptables.   Ipchains is a different creature

> except that traffic from my one class c address space.  Everything I've
> attempted so far has basically locked me out of the box, and had to
> physically go to it and remove the changes.
>
>    Is there a down-and-dirty way to block all traffic except from one class
> c address space (or even just a group of IP's?)
	sure -- several different ways to do it ... 
	http://iptables-tutorial.frozentux.net/

	contains several excellent tutuorials on iptables.

	Won't do you much good for ipchains tho .... 

	Alistair

>
> Thanks,
> Scott

