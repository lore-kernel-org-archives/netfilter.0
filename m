From: Piotr Chytla <pch@packetconsulting.pl>
Subject: Re: where is u32 matching module?
Date: Sun, 27 Aug 2006 12:01:32 +0200
Message-ID: <20060827100132.GA11078@packetconsulting.pl>
References: <44EDF972.3010105@vlab.mb.jhu.edu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <44EDF972.3010105@vlab.mb.jhu.edu>
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
To: pub@vlab.mb.jhu.edu
Cc: netfilter@lists.netfilter.org

On Thu, Aug 24, 2006 at 03:09:38PM -0400, pub@vlab.mb.jhu.edu wrote:
> Hello,
> 
> I am trying to match the receive window size in the incoming packets.
> What I can think of is using u32 module to match any 4 bytes of data.
> However, the iptables manual in fedora core 5 mentioned to look for
> details in kernel module, while the u32 module is not in my kernel
> source tree apparently. Is this module being replaced by something
> else I am not aware of? Is there any alternative to match the window size?
>
u32 match is in path-o-matic-ng,

http://svn.netfilter.org/netfilter/trunk/patch-o-matic-ng/ 

you must apply u32 patch to your kernel , and rebuild everything.

/pch

-- 
Dyslexia bug unpatched since 1977 ...
exploit has been leaked to the underground.

