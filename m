From: "Laurence J. Lane" <ljlane@nontoxic.org>
Subject: Re: "owner" module fails with patched kernel
Date: Mon, 8 Dec 2003 18:54:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031208235424.GC32366@absolom.libra.net>
References: <OXV7xkMsSQ1$EAc0@rub-al-khali.uninhabited.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OXV7xkMsSQ1$EAc0@rub-al-khali.uninhabited.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

(sorry, meant to reply on-list the first time)

On Mon, Dec 08, 2003 at 11:09:32PM +0000, Roger Hayter wrote:
> This may be a SuSE-specific question but a) no one answered it there, 
> and b) there may be a more general answer.  I just updated to the latest 
> kernel patch on SuSE 8.1. Now using 2.4.21-151-athlon. This is patched 
> for the latest (brk) vulnerability, as well as being a newer kernel.  I 
> think the previous kernel was 2.4.19, also optimised by SuSE for AMD. 
> Iptables rules containing -m owner now give "Invalid Argument" when run. 
> A few experiments suggest this is a general failure of the module, not 
> just a particular filter line.  It is successfully loaded, and gives a 
> different  error message if, for instance, I use --uid-owner with an 
> invalid userid.  Needless to say, this worked before the kernel upgrade. 
> Iptables version is 1.2.7a, as distributed by SuSE. Anyone know why this 
> might be and whether it is better to try a newer version of iptables, or 
> is it likely to need recompiling for some reason?  I presume all the 
> modules are already recompiled by SuSE.

The netfilter kernel headers changed with 2.4.20. Recompile iptables 
with the newer kernel headers.

