From: David Chambers <davidc@ccmi.salk.edu>
Subject: Re: nat "regression" in 2.4.23-pre and 2.5/6
Date: Wed, 24 Sep 2003 12:51:03 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.50.0309241245120.8305-100000@muk.mgl>
References: <200309242047.41774.baldrick@free.fr>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309242047.41774.baldrick@free.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Duncan Sands <baldrick@free.fr>
Cc: netfilter@lists.netfilter.org, Tom Eastep <teastep@shorewall.net>

I also encountered this sort of problem, but in a vanilla shorewall; As 
I recall, it turned out that something is/was  screwy with the way 
modules.dep is created... a lot of the iptables modules became dependent 
on ipchains.o.  I recompiled my kernel without the ipchains and ipfwadm 
modules and things appear to work again.

Note: I only *think* this is what was wrong! :-) :-)

- david


On Wed, 24 Sep 2003, Duncan Sands wrote:

> It used to be possible to use the masquerade target with user
> defined chains in the nat table.  For example, shorewall does
> 
> iptables -t nat -A ppp0_masq -s 192.168.0.0/24 -d 0.0.0.0/0 -j MASQUERADE
> 
> where ppp0_masq is a user defined chain.  This no longer works with the
> 2.4.23-pre kernels (it hasn't worked with 2.5 for a while): iptables: invalid argument.
> 
> All is OK if you substitute POSTROUTING for the user defined chain ppp0_masq.
> The man page for iptables states:
> 
>    MASQUERADE
>        This target is  only  valid  in  the  nat  table,  in  the
>        POSTROUTING  chain.
> 
> So it looks like a check has been put into the netfilter code to enforce what the
> documentation states: only the POSTROUTING chain may be used.
> 
> But why?  Is there any harm in using masquerade with user defined chains?
> 
> Here is a comment from Tom Eastep (shorewall author):
> 
> "It might be worth pointing out that by taking this strict interpretation
> of the documented behavior, user chains in the nat table are rendered
> useless. If the SNAT, DNAT and MASQUERADE targets can only be placed in
> the appropriate netfilter-define chains then there is no conceivable use
> for user-defined chains in that table."
> 
> Duncan.
> 

-- 
------------------------------------------
David Chambers
Core Cytometry and Molecular Imaging
The Salk Institute
10010 North Torrey Pines Road
La Jolla, CA  92037-1099

Tel:	(858) 453-4100 x1728
Fax:	(858) 453-9681
Email:	davidc@ccmi.salk.edu
Web:	http://pingu.salk.edu/~davidc/
------------------------------------------

