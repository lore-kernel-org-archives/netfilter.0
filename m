From: Shawn <core@enodev.com>
Subject: RE: Is this correct?
Date: 19 Jun 2003 22:10:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056078644.14138.84.camel@localhost>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6F15@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6F15@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

I must apologize, as my original scenario probably is not representative
of the problem.

In my original scenario, hosts trying to reach 10.0.0.1 thought they
were also on the 10.0.0.0/24 network, meaning they think there's no
router involved.

This means their stack tries to ARP for 10.0.0.1 (who has 10.0.0.1 out
onto the wire) and the linux-router would respond with it's MAC for eth0
if I were to bind 10.0.0.1 to eth0 as you suggested. ("ip addr add
10.0.0.1/8 dev eth0")

I wonder if my original scenario would work at all given this problem...

On Thu, 2003-06-19 at 21:39, George Vieira wrote:
> Why/How would the linux box broadcast it's ARP response to 10.0.0.1 when the IP doesn't belong to the firewall.. it just has a rule saying what to do if the packet arrives to it asking it to forward to that host... ARP is on different IP layer to netfilter.
> The rule doesn't make it respond to arp requests.
> 
> Thanks,
> ____________________________________________
> George Vieira
> Systems Manager
> georgev@citadelcomputer.com.au
> 
> Citadel Computer Systems Pty Ltd
> http://www.citadelcomputer.com.au
> 
> Phone   : +61 2 9955 2644
> HelpDesk: +61 2 9955 2698
>  
> 
> -----Original Message-----
> From: Shawn [mailto:core@enodev.com]
> Sent: Friday, June 20, 2003 12:29 PM
> To: George Vieira
> Cc: netfilter@lists.netfilter.org
> Subject: RE: Is this correct?
> 
> 
> I get confused because I picture other 10.0.0.0/24 hosts arping for
> 10.0.0.1 and getting the MAC for linux-router/eth0. How is this not the
> case?
> 
> Thank you all so much for the help!

