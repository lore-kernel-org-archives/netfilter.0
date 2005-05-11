From: Pete Toscano <pete-netfilter@verisignlabs.com>
Subject: Re: SSH Brute force attacks
Date: Wed, 11 May 2005 15:30:16 -0400
Message-ID: <42825D48.2060003@verisignlabs.com>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<42825732.8010206@verisignlabs.com>
	<428259CE.3080708@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <428259CE.3080708@riverviewtech.net>
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
To: iptables <netfilter@lists.netfilter.org>

Taylor, Grant wrote:

> recent v1.3.1-20050422 options:
> [!] --set                       Add source address to list, always matches.
> [!] --rcheck                    Match if source address in list.
> [!] --update                    Match if source address in list, also
> update last-seen time.
> [!] --remove                    Match if source address in list, also
> removes that address from list.
>    --seconds seconds           For check and update commands above.
>                                Specifies that the match will only occur
> if source address last seen within
>                                the last 'seconds' seconds.
>    --hitcount hits             For check and update commands above.
>                                Specifies that the match will only occur
> if source address seen hits times.
>                                May be used in conjunction with the
> seconds option.
>    --rttl                      For check and update commands above.
>                                Specifies that the match will only occur
> if the source address and the TTL
>                                match between this packet and the one
> which was set.
>                                Useful if you have problems with people
> spoofing their source address in order
>                                to DoS you via this module.
>    --name name                 Name of the recent list to be used. 
> DEFAULT used if none given.
>    --rsource                   Match/Save the source address of each
> packet in the recent list table (default).
>    --rdest                     Match/Save the destination address of
> each packet in the recent list table.
> ipt_recent v0.3.1: Stephen Frost <sfrost@snowman.net>. 
> http://snowman.net/projects/ipt_recent/

Freaky.  My output is the same as yours with the exception of the 1.2.11
string.

recent v1.2.11 options:
<snip same stuff that you have>
ipt_recent v0.3.1: Stephen Frost <sfrost@snowman.net>.
http://snowman.net/projects/ipt_recent/

I'm a little confused about the difference between "recent v1.2.11" and
"ipt_recent v0.3.1"  Is one a kernel component and the other the
userspace part?

I'm also a little confused about p-o-m.  Is this something I can apply
without recompiling my (modular) kernel?  Are there any good docs on how
to use p-o-m?  I didn't see any immediately obvious on the netfilter
site and the p-o-m section seems to end mid-

;)

Thanks,
pete

