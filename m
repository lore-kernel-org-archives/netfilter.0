From: Jason Opperisano <opie@817west.com>
Subject: Re: extension modules in patch-o-matic
Date: Mon, 31 Jan 2005 11:15:33 -0500
Message-ID: <20050131161533.GA24914@bender.817west.com>
References: <20050130203332.0F16066E@mail.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050130203332.0F16066E@mail.817west.com>
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

On Sun, Jan 30, 2005 at 09:38:56PM +0100, Seferovic Edvin wrote:
> Hi all,
> 
> I am kinda new to extension modules, but I could really use some of them (
> ip_limit, accounting etc ). The problem I have is following.. after I
> download patch-o-matic and try to implement it I cannot find e.g. ip_limit
> module :-( where did it go? Is it already in iptables? I cannot find it
> there neither... 
> 
> I use iptables 1.2.9 / kernel 2.6.5 ( Suse Lin 9.1 x86-64 )!

make sure you are following this process:

cd /path/to/patch-o-matic
KERNEL_DIR=/usr/src/linux-$VER IPTABLES_DIR=/path/to/iptables-src ./runme
[select desired patches]
recompile kernel
recompile iptables
reboot with new kernel
ensure that your PATH points you to your new iptables binary and not
some distro-provided iptables

HTH...

-j

--
"Poor predictable Bart, always picks rock.
 Good ol' rock, nothing beats that.
 Rock.
 Paper.
 D'oh!"
        --The Simpsons

