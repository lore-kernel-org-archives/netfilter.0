From: William Stearns <wstearns@pobox.com>
Subject: Re: iptables log Len ?
Date: Wed, 28 Jan 2004 21:58:12 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0401282155410.28123-100000@sparrow>
References: <20040128190706.50ca9cbd@mgalepc.utilitran.com>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040128190706.50ca9cbd@mgalepc.utilitran.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Gale <michael.gale@utilitran.com>
Cc: ML-netfilter <netfilter@lists.netfilter.org>, William Stearns <wstearns@pobox.com>

Good evening, Michael,

On Wed, 28 Jan 2004, Michael Gale wrote:

> 	When you log a packet entry one of the fields is Len (example
> Len=78). Now does this mean the was was 78 bytes ?

	Yes, the first LEN on the line is the length of the IP header, TCP 
header, and payload.  Some packets have 2 LEN tokens, I believe the second 
is TCP header + payload.  For ICMP error messages where the original 
packet decode is inside [...], the LEN inside the square brackets is the 
length of the packet that elicited the error.
	Cheers,
	- Bill

---------------------------------------------------------------------------
	"Whip me, beat me, make me use ipchains."
	- Paul "Rusty" Russell
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
--------------------------------------------------------------------------


