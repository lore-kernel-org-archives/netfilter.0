From: "Vincent" <cs83152@csie.chu.edu.tw>
Subject: RE: How to flush the connection state in the linux
Date: Wed, 29 Dec 2004 10:14:12 +0800
Message-ID: <004b01c4ed4c$19e25fe0$aa0ba8c0@l7.com.tw>
References: <1104164548.6322.20.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1104164548.6322.20.camel@hubcap.ljm.dom>
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
Content-Type: text/plain; charset="us-ascii"
To: 'Jason Opperisano' <opie@817west.com>, netfilter@lists.netfilter.org

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of 
> Jason Opperisano
> Sent: Tuesday, December 28, 2004 12:22 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: How to flush the connection state in the linux
> 
> 
> On Mon, 2004-12-27 at 02:26, Vincent wrote:
> > Hello,
> > 
> > Does any one know how to flush the connection state in the 
> linux (Not 
> > flush iptables rule -F). I used transparent mode in the linux (use 
> > brctl to bridge eth & eth1). When I tried to use iptables 
> to drop some 
> > specified packet and it was fail.
> > So I doubt there are some established connection state exist in the
> > linux to pass these
> > Forbidden connections.
> > 
> > My enviroment
> > Linux 2.4.25
> > Iptables 1.2.11
> 
> you need to remove the "ip_conntrack" module.
> 
> in order to do that--you need to remove all the modules that 
> use it (like 'iptable_nat' etc).

Can I remove ip_conntrack in one command? If it can be, how to do it?
I try the command "modprobe -r ip_conntrack", but it seems not worked.

Besides, I tried to remove ip_conntrack and its dependency module
manually.
But the forbidden packet is still pass through. Is there any other
solution??
Thanks for your assistance

Vincent

> 
> -j
> 
> --
> "'Nuke the whales?' You don't really believe that, do you?
>  I dunno. Gotta nuke something."
> 	--The Simpsons
> 


