From: Jason Opperisano <opie@817west.com>
Subject: Re: ARP traffic on a large-ish network
Date: Tue, 15 Mar 2005 15:00:08 -0500
Message-ID: <1110916807.4666.12.camel@hubcap.ljm.dom>
References: <42B3C34A03A8FC4BB0A80082CE8993F31C1C25@onstopnt.onestop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <42B3C34A03A8FC4BB0A80082CE8993F31C1C25@onstopnt.onestop.com>
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
To: netfilter@lists.netfilter.org

On Tue, 2005-03-15 at 11:24, Travis Bell wrote:
> I wasn't clear on my question yesterday.  Here's what I'm trying to do:
> 
> We've got a /19 block of public IPs from our provider to give to
> customers.
> Because we want customers to have a public IP, as opposed to NATing a
> private IP, they are essentially just plugged into my switch just on the
> other side of the Cisco router from our T1s.
> 
> Our Cisco router is ARP who-has'ing for the entire block of IPs (as it
> should).
> 
> I'd like to stick something between the Cisco router and the customers
> that keeps them from getting so much ARP traffic.  It seems like it's a
> lot of traffic going through.  Ethereal captured 1260 ARP packets in 10
> seconds.
> 
> So is there anything I can do?  Or is that much ARP traffic reasonable?

to reduce the amount of ARP traffic, you'll have to segment the network
into more than a single layer 2 broadcast domain.  this means creating
layer 2 VLANs.  in order to maintain full connectivity, you'll normally
want to divide your /19 to match up your layer 3 subnets to your layer 2
VLANs.

a /19 is 8190 hosts on a single segment--which is not what i would call
an efficient network design (as it leads to the exact problem you're
seeing).  normally, i won't create a layer 2 broadcast domain with more
than 1024 hosts (/22 subnets at layer 3), even that could be pushing it
(when they're all windows boxes).

stick a robust layer 3 switch between the customers and the cisco
router, create VLAN interfaces on the layer 3 switch for the customers
to use as their default gateways, and use the cisco router as the
default gateway for the layer 3 switch.

-j

--
"It takes two to lie. One to lie and one to listen."
	--The Simpsons


