From: Ray Van Dolson <rayvd@digitalpath.net>
Subject: Re: Kernel options required for ingress policer?
Date: Thu, 27 Jul 2006 09:36:53 -0700
Message-ID: <20060727163653.GA10822@digitalpath.net>
References: <20060726140302.GA15727@digitalpath.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20060726140302.GA15727@digitalpath.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Jul 26, 2006 at 07:03:02AM -0700, Ray Van Dolson wrote:
> Haven't gotten a response for this on the LARTC list... hoping someone here
> may have an answer for me.
> 
> I'm trying to use the ingress policer on a custom kernel as follows, but
> having some problems:
> 
>  # tc qdisc add dev eth1 handle ffff: ingress
>  # tc filter add dev eth1 parent ffff: protocol ip prio 50 u32 match ip src \
>      0.0.0.0/0 police rate 384kbit burst 10k drop flowid :1
>  RTNETLINK answers: Invalid argument
> 
> This is on a Fedora Core 2 based system, with a custom built 2.6.17.7
> kernel.
> 
> The above commands work perfectly on a CentOS 4.x based system with a custom
> built 2.6.16 kernel.  The hardware in both machines are identical and I used
> the 2.6.16 config from the CentOS machine to build the 2.6.17.7 kernel (did
> a make oldconfig).  So the netfilter moudules, etc should be identical.
> 
> The network driver on both is the bcm5700 from HP.
> 
> tc with any egress filtering options works perfectly on the 2.6.17.7 box.
> 
> I can also run the ingress policer commands on identical hardware with
> Fedora Core 1 (using stock kernel).  So I don't believe this is a result of
> the version of the iproute package.
> 
> Does anyone know the exact requirements of the ingress policer as far as the
> kernel is concerned?  Below is my kernel config:

Well, figured out the problem.  The issue was not the kernel, but that the
tools were built against RedHat/Fedora's glibc-kernheaders.  Apparently they
must reference a symbol of some sort that doesn't exist in the stock kernel
(at least in Fedora Core 2).

I modified the iproute RPM .spec file to build against my 2.6.17 kernel
headers instead of glibc-kernheaders and everything is working fine.

Grr!

As an aside, would have loved to stick with the stock kernels (wouldn't have
encountered this issue in that case), but wanted to make use of built-in
MPPE support in the later kernel releases.  Obviously this will never be
backported into FC2's now-maintained-by-fedora-legacy kernel. :)

