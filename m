From: mourik jan c heupink <heupink@intech.unu.edu>
Subject: Re: Bridging firewall with iptables
Date: 08 Oct 2002 20:29:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034101748.2072.3.camel@suse8>
References: <sda1ab7e.047@hiway.springisd.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <sda1ab7e.047@hiway.springisd.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Pete Davis <peted@springisd.org>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

did you get any responses already...?

i'm not much i a guru myself, but i have gotten this to work, and it
works beautifully here...

maybe i can be of assistance..?

outside to inside doesn't work, you say. the other way does? inside to
outside..?

mj

On Mon, 2002-10-07 at 22:42, Pete Davis wrote:
> I have been trying to get a bridging firewall setup with iptables.  The
> iptables part, by itself, is not an issue.  I can get it done.  My
> question is: has anyone here ever gotten the bridging + iptables
> firewall to work?
> 
> I am using 2.4.19 (I never get anything but 2.4.19 with dmesg or uname
> -a) with bridge-nf-0.0.7-against-2.4.19.diff for the bridging patch.  I
> am following the documentation provided on bridge.sourceforge.org.
> 
> I d/l'ed the 2.4.19.  Patched with bridge patch above.  Made the kernel
> with iptables support (most options as modules), "8021.d Ethernet
> bridging" and "netfilter (firewalling) support" included.  Everything
> compiled and installed without errors.  I added the interfaces to the
> bridge interface per the directions.  Set all ip addresses to 0.0.0.0
> promisc per the directions in the documentation.  The default rules for
> iptables are allow for input, output and forward (forward is the only
> one of importance).
> 
> At this point, I cannot get any devices on the 'outside' of the
> firewall to reach anything 'inside' the firewall.  Since all the rules
> are accept, it should work.  I get the feeling the problem may be with
> the bridging portion.
> 
> Anyone gotten this bridge + firewall to work?
> 
> Thanks,
> Pete



