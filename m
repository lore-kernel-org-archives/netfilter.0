From: "Venkatesh. K" <venkatesh@cbayscribe.com>
Subject: Re: Generate a unified patch for source RPM
Date: Sat, 4 Oct 2003 06:01:47 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01b601c38a0e$eb0d79d0$2800a8c0@karu>
References: <003a01c3837f$e482d2d0$2800a8c0@karu> <20031003105021.GE5758@sunbeam.de.gnumonks.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: "Netfilter@Lists.Netfilter.Org" <netfilter@lists.netfilter.org>

Thanks a lot.

I had tried the same command line except the full path to the patch :(

Venkatesh K

----- Original Message ----- 
From: "Harald Welte" <laforge@netfilter.org>
To: "Venkatesh. K" <venkatesh@cbayscribe.com>
Cc: <>
Sent: Friday, October 03, 2003 4:20 PM
Subject: Re: Generate a unified patch for source RPM

On Thu, Sep 25, 2003 at 09:42:48PM +0530, Venkatesh. K wrote:
> Hi,
>
> I want to patch the RedHat Kernel RPM.
>
> How do I generate a single patch file from patch-o-matic which can be
> applied to an src.rpm ?

# pom2patch - create a normal unified diff (patch) from patch-o-matic

included in the patch-o-matic directory

syntax is:

pom2patch my_kernel_source_dir submitted/00_foo.patch

(you have to run it seperately for every patch-o-matic patch)

> Venkatesh K
-- 
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
============================================================================
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie


