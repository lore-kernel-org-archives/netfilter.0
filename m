From: Serge Blondin <sergebl@phreaker.net>
Subject: Re: can we shape the kazaa traffic
Date: Thu, 22 May 2003 10:23:53 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3ECCDD79.6050707@phreaker.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6C76@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6C76@wardrive.citadelcomputer.com.au>
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

thx for the info... this project is very similar to the way of Cisco, 
they use something call PDLM, (protocol definition language... something 
like that).

I will make some test to see if its working...




George Vieira wrote:

>You can if you know the ports it uses and if it's like DC++ which you can specify the port, then use a tool which is pretty new which works on a different ip layer. Below is a post recently sent regarding it.
>
>The way it works is that it matches the packets content and pushes that into the shaped pipe, iptables can actually do that too with the "-m string" patch-o-matic module. I'm just not sure what happens after the SYN packet if the connection keeps goign through the shaped pipe or not..
>
>hope this helps...?
>
>
>----------------------------------------------------------------------
>From: arbitrator-linux-admin@lists.sourceforge.net
>[mailto:arbitrator-linux-admin@lists.sourceforge.net]On Behalf Of Art
>Reisman
>Sent: Wednesday, May 14, 2003 9:35 AM
>To: arbitrator-linux@lists.sourceforge.net
>Subject: [Bandwidth/Arbitrator-linux] Adapting Application Level Shaping
>(Kazaa) comments?
>
>
>There is a sourceforge project that has just released
>application shaping tools for TC
>
>http://l7-filter.sourceforge.net/
>
>We are in the process of adapting their "application
>detection code" into the arbitrator..  
>
>Their code works by matching text patterns in data
>packets. If you have any knowledge on this subject
>please share your thoughts experiences.
>
>Art
>-----------------------------------------------------------------------
>
>
>
>
>Thanks,
>____________________________________________
>George Vieira
>Systems Manager
>georgev@citadelcomputer.com.au
>
>Citadel Computer Systems Pty Ltd
>http://www.citadelcomputer.com.au
> 
>
>-----Original Message-----
>From: Serge Blondin [mailto:sergebl@phreaker.net]
>Sent: Thursday, May 22, 2003 6:49 AM
>To: netfilter@lists.netfilter.org
>Subject: can we shape the kazaa traffic
>
>
>I know a way of shapping the traffic with a Cisco Router, but i was 
>wondering.
>
>I will be nice to shape the kazaa 2 traffic on my linux router.
>
>Serge Blondin
>sergebl@phreaker.net
>
>
>
>  
>



