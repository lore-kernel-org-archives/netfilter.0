From: Ben Russo <ben@umialumni.com>
Subject: Re: how to forward packets to another gateway, if i'm one
Date: 17 Dec 2002 10:16:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1040138207.8941.9.camel@ben.mis.tnsi.com>
References: <ISPFE7vXn10A5fpk965000657df@mail.takas.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ISPFE7vXn10A5fpk965000657df@mail.takas.lt>
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
To: Saulius Menkevicius <razzmatazz@mail.lt>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Fri, 2002-12-06 at 12:28, Saulius Menkevicius wrote:
>   Is there any way of forwarding packets to another gateway, which, 
> besides, is on the same network. Say, I'm on IP 10.0.0.2, and I act 
> as a gateway (ADSL, really) for a number of machines on the same LAN. 
> And there's another such gateway, hooked to another ADSL, which 
> handles connections for another bunch of machines. Essentially the 
> hosts 10.0.0.1 and 10.0.0.2 are identic and perform the same 
> function.
> 
If both 10.0.0.1 and 10.0.0.2 are on the same subnet then just find 
the client machines that you want to use 10.0.0.1 as their gateway
and change their default route. No changes at all would be required
on either gateway.


