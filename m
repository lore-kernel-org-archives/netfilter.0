From: "Vincent" <cs83152@csie.chu.edu.tw>
Subject: RE: How to flush the connection state in the linux
Date: Wed, 29 Dec 2004 10:19:24 +0800
Message-ID: <004c01c4ed4c$d6f3b610$aa0ba8c0@l7.com.tw>
References: <cqoos3$4ga$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cqoos3$4ga$1@sea.gmane.org>
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
To: 'Andrew Schulman' <andrex@alumni.utexas.net>, netfilter@lists.netfilter.org

I execute the following commands on the machine
Ifdown eth0
Ifdown eth1
Ifup eth0
Ifup eth1

But the original condition is still existed :(
Do you have any other suggestion?
Sincerely

Vincent

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of 
> Andrew Schulman
> Sent: Monday, December 27, 2004 6:41 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: How to flush the connection state in the linux
> 
> 
> > Does any one know how to flush the connection state in the 
> linux (Not 
> > flush iptables rule -F). I used transparent mode in the linux (use 
> > brctl to bridge eth & eth1). When I tried to use iptables 
> to drop some 
> > specified packet and it was fail.
> > So I doubt there are some established connection state exist in the
> > linux to pass these
> > Forbidden connections.
> 
> ifdown, then ifup?  Brutal, but it should work.
> 


