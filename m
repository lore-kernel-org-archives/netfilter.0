From: Askar <askarali@gmail.com>
Subject: Re: nat:REDIRECT on localhost not working in Kernel 2.6
Date: Sun, 21 Nov 2004 00:55:54 +0500
Message-ID: <a0f69e504112011555167d2ac@mail.gmail.com>
References: <200411191836.07261.su@su2.info>
	<20041119174100.GA20905@bender.817west.com>
	<200411191903.41692.su@su2.info>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200411191903.41692.su@su2.info>
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
To: Stephan Uhlmann <su@su2.info>
Cc: netfilter@lists.netfilter.org

I have the same issue, even though I confirmed that "Device Drivers >>
Networking Support >> Networking Options >> Network
packet filtering >> IP: Netfilter Configuration >> [   ] Nat of local"
has been statically compiled into the kernel (kernel v. 2.6.9 distro
slackware 10, iptables v1.2.11)

I'm running squid on the same box with iptables/gatway and sometime
use this box even for browsing that why I want to redirect the
localhsot traffic to squid.

I tried with setting OUPUT policy to default ACCEPT with no luck.





On Fri, 19 Nov 2004 19:03:41 +0100, Stephan Uhlmann <su@su2.info> wrote:
> On Friday 19 November 2004 18:41, Jason Opperisano wrote:
> > are all kernels in question compiled with:  IP_NF_NAT_LOCAL
> 
> No, all kernels I tested have that option not set. They are default kernels
> from the distributions and that option seems not to be enabled by default.
> 
> Strangely the option is also not set on the kernel 2.4 machine where the
> redirect worked.
> 
> Anyway I guess the problem will go away if I set this option. Thank you for
> the hint and your quick response!
> 
> Cheers,
> Stephan
> 
> 
> 


-- 
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

