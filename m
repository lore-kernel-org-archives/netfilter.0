From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ARP traffic on a large-ish network
Date: Thu, 17 Mar 2005 02:04:06 -0600
Message-ID: <423939F6.3070108@riverviewtech.net>
References: <42B3C34A03A8FC4BB0A80082CE8993F31C1C25@onstopnt.onestop.com>
Reply-To: gtaylor@riverviewtech.net
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Travis Bell <travis@dptexas.net>
Cc: netfilter@lists.netfilter.org

You *might* try inserting a Linux router in the network between your Cisco and all your clients.  The main things this router would do is run the ARPDaemon which implements a LARGE ARP cache in user space.  Thus hopefully you could configure it to hold most if not all of your client's MAC addresses in it's internal tables thus reducing the need to ARP.  The Linux kernel's internal ARP cache maxs out at around 256 entries.  I don't know if this would work at all as all references to ARP Daemon I've seen are early 2.4 but support for it is still suppose to be in the kernel.  I just looked and it is included in 2.6.11 under "Networking Options".  Let me know if you try this and what you find out as I've got a network with about 2048 potential hosts on it that I'm considering using this on.



Grant. . . .

Travis Bell wrote:
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
> 
> Thanks,
> Any advice is appreciated.
> 
> Travis Bell
> 
> 


