From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Cleanest way to deal with loopback interface?
Date: Mon, 18 Apr 2005 15:05:02 -0500
Message-ID: <426412EE.80601@riverviewtech.net>
References: <1113425449.3544.177.camel@seberino.spawar.navy.mil>	<20050413211349.GA31336@bender.817west.com>	<425DC2DA.7010608@riverviewtech.net>	<20050417232709.GA28390@spawar.navy.mil>	<1113782691.22084.23.camel@bodhittsatva>
	<1113854560.3544.215.camel@seberino.spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113854560.3544.215.camel@seberino.spawar.navy.mil>
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
To: Christian Seberino <seberino@spawar.navy.mil>
Cc: netfilter@lists.netfilter.org

> Thomas
> 
> Thanks for the reply.  Jason at beginning of this thread
> surprised all of us by saying that Linux kernel
> drops 127.0.0.1 address from NICs already!?!
> 
> No need to filter it out from Internet traffic!
> 
> Agreed?
> 
> Chris

*nod*  Apparently the Linux kernel does do this.  I personally don't care for this or relying on this default behavior and would still write an IPTables rule to handle this.  But that is just me and my humble opinion.



Grant. . . .

