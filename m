From: Jason Opperisano <opie@817west.com>
Subject: Re: DNAT-Problem
Date: Thu, 09 Sep 2004 07:38:26 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094729906.1897.2.camel@wolfpack.ljm.dom>
References: <20040909041047.7f8457cf@nixe>
	<1094696804.1739.7.camel@wolfpack.ljm.dom>
	<20040909122931.3e8b4903@nixe>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040909122931.3e8b4903@nixe>
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
To: netfilter@lists.netfilter.org

On Thu, 2004-09-09 at 06:29, Tom Fischer wrote:
> This is the only rule.
> 
> [root@server4 root]# iptables -t nat -vnL
> Chain PREROUTING (policy ACCEPT 645K packets, 35M bytes)
>  pkts bytes target     prot opt in     out     source              
> destination             2   120 DNAT       tcp  --  *      *      
> 0.0.0.0/0            oldmachine       tcp dpt:9000 to:newmachine
> 
> Chain POSTROUTING (policy ACCEPT 62473 packets, 3966K bytes)
>  pkts bytes target     prot opt in     out     source              
> destination         
> 
> Chain OUTPUT (policy ACCEPT 62441 packets, 3964K bytes)
>  pkts bytes target     prot opt in     out     source              
> destination         
> 
> >         
> > another thought--NAT happens first (PREROUTING), then filter rules. 
> > you will need to edit your filter rule to allow traffic to
> > "newserver's" actual IP instead of "oldserver's" actual IP.
> > 
> 
> There are no Filterrules installed at the moment.
> 
> Tom

what are the IP addresses of $oldmachine and $newmachine (obfuscate the
first two octets if you must)?

are you trying to DNAT from one machine on the local network to another
machine on the local network?  what network is the client traffic
sourcing from?  is it the same network?

-j

-- 
Jason Opperisano <opie@817west.com>


