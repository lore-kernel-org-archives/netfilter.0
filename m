From: Tom Fischer <tom.fischer@ebuz.de>
Subject: Re: DNAT-Problem
Date: Thu, 9 Sep 2004 12:29:31 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040909122931.3e8b4903@nixe>
References: <20040909041047.7f8457cf@nixe>
	<1094696804.1739.7.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094696804.1739.7.camel@wolfpack.ljm.dom>
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

On Wed, 08 Sep 2004 22:26:44 -0400
Jason Opperisano <opie@817west.com> wrote:

> On Wed, 2004-09-08 at 22:10, Tom Fischer wrote:
> > Hi,
> > 
> > i have a problem with DNAT. We have to move some services for a few
> > days on another machine. So we want do DNAT on incoming Packets. I
> > set
> > 
> > iptables -A PREROUTING -t nat -s 0/0 -d xxx.xxx.xxx.xxx -p tcp
> > --dport 9000-j DNAT --to xxx.xxx.xxx.xxx
> 
> since you didn't provide your rules, i'm gonna haveta ask a really
> stupid question...
> 
> did you execute that command with the old DNAT rule in place?  if
> so--the new rule got appended to the end of the PREROUTING chain of
> the nat table, after the old rule; therefore, will never get matched.
> 
> it would be helpful for us list-types to see the output of:
> 
>         iptables -t nat -vnL

This is the only rule.

[root@server4 root]# iptables -t nat -vnL
Chain PREROUTING (policy ACCEPT 645K packets, 35M bytes)
 pkts bytes target     prot opt in     out     source              
destination             2   120 DNAT       tcp  --  *      *      
0.0.0.0/0            oldmachine       tcp dpt:9000 to:newmachine

Chain POSTROUTING (policy ACCEPT 62473 packets, 3966K bytes)
 pkts bytes target     prot opt in     out     source              
destination         

Chain OUTPUT (policy ACCEPT 62441 packets, 3964K bytes)
 pkts bytes target     prot opt in     out     source              
destination         

>         
> another thought--NAT happens first (PREROUTING), then filter rules. 
> you will need to edit your filter rule to allow traffic to
> "newserver's" actual IP instead of "oldserver's" actual IP.
> 

There are no Filterrules installed at the moment.

Tom

