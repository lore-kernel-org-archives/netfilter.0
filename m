From: Michael Sconzo <msconzo@net.tamu.edu>
Subject: Re: Odd question with source based blocking
Date: Fri, 27 Aug 2004 13:09:37 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040827130936.K1111@net.tamu.edu>
References: <D5C9032B2B09C64EA2409D6214E91AC906420A@asimail2.alphanumeric.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC906420A@asimail2.alphanumeric.com>;
	from Jopperisano@alphanumeric.com on Thu, Aug 26, 2004 at 06:49:07PM
	-0400
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
To: Jason Opperisano <Jopperisano@alphanumeric.com>
Cc: netfilter@lists.netfilter.org

Hope this provides a bit more Info

On Thu, Aug 26, 2004 at 06:49:07PM -0400, Jason Opperisano wrote:
> 
> you cannot set the "policy" of a custom chain, policies only apply to the built-in chains; i.e., iptables -P FORWARD DROP...etc...so i'm not sure what you mean by this.

That would have been ideal, but I didn't think it was possible either.

> if a packets jumps to a custom chain, and reaches the end of it--it returns to the calling chain where it left off.  in the above example--a packet with a destination ip of 192.168.1.1 and a src ip of 1.2.3.4 would match the second rule; traverse the BLOCKED chain, and if no rule matches return to the FORWARD chain at the next rule.

I don't suspect there is anyway to change this, is there?

> 
> without seeing the output of:
> 
> iptables -vnL && iptables -t nat -vnL && iptables -t mangle -vnL


Chain INPUT (policy ACCEPT 27895 packets, 3015K bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0          multiport ports 67,68 
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0          multiport ports 53 
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          multiport ports 53 
    0     0 BLOCKED    all  --  *      *       0.0.0.0/0            192.168.0.0/16     
    0     0 BLOCKED    all  --  *      *       192.168.0.0/16       0.0.0.0/0          

Chain OUTPUT (policy ACCEPT 27999 packets, 31M bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain BLOCKED (4 references)
 pkts bytes target     prot opt in     out     source               destination         
Chain PREROUTING (policy ACCEPT 512K packets, 702M bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain POSTROUTING (policy ACCEPT 1 packets, 74 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination 


Nothing in the Mangle table, and the nat table only has enteries in it
when the blocked table does


-- 
_
_ Michael J. Sconzo
_ Computing & Information Services, Texas A&M University

The New Testament offers the basis for modern computer coding theory,
in the form of an affirmation of the binary number system.
        But let your communication be Yea, yea; nay, nay: for
        whatsoever is more than these cometh of evil.
                -- Matthew 5:37

