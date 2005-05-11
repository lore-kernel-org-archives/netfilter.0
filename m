From: Jason Opperisano <opie@817west.com>
Subject: Re: SSH Brute force attacks
Date: Wed, 11 May 2005 16:34:52 -0400
Message-ID: <20050511203452.GA13902@bender.817west.com>
References: <427B93EE.3030905@eccotours.dyndns.org>
	<427C4EA3.5090501@riverviewtech.net>
	<4281FC1A.8090000@eccotours.dyndns.org>
	<42824D1E.7040508@riverviewtech.net>
	<42825732.8010206@verisignlabs.com>
	<428259CE.3080708@riverviewtech.net>
	<42825D48.2060003@verisignlabs.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42825D48.2060003@verisignlabs.com>
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
To: iptables <netfilter@lists.netfilter.org>

On Wed, May 11, 2005 at 03:30:16PM -0400, Pete Toscano wrote:
> Freaky.  My output is the same as yours with the exception of the 1.2.11
> string.
> 
> recent v1.2.11 options:
> <snip same stuff that you have>
> ipt_recent v0.3.1: Stephen Frost <sfrost@snowman.net>.
> http://snowman.net/projects/ipt_recent/
> 
> I'm a little confused about the difference between "recent v1.2.11" and
> "ipt_recent v0.3.1"  Is one a kernel component and the other the
> userspace part?

yes, ipt_recent == kernel module.  the 1.2.11 is the version of the
iptables userspace utility.

> I'm also a little confused about p-o-m.  Is this something I can apply
> without recompiling my (modular) kernel? 

no.

> Are there any good docs on how
> to use p-o-m?  I didn't see any immediately obvious on the netfilter
> site and the p-o-m section seems to end mid-

basic recipe:

- download/extract kernel src
- download/extract iptables src
- download/extract p-o-m
- apply patches from p-o-m
- recompile kernel
- recompile iptables
- reboot, rinse, repeat.

-j

--
"Stewie: Soooo Broccoli, mother says you're very good for me. But I'm
 afraid I'm no good for you."
        --Family Guy

