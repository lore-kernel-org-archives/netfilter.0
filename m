From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: RE: Static compile issues
Date: 29 May 2003 14:54:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054212845.749.37.camel@tux.rsn.bth.se>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D2D@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D2D@wardrive.citadelcomputer.com.au>
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
Cc: Cory Visi <merlin@phear.lwz.org>, Netfilter <netfilter@lists.netfilter.org>

On Thu, 2003-05-29 at 01:10, George Vieira wrote:
> No, don't enable it.. why bother.
> 
> I've noticed that there are more and more people with problems on 2.4.20 kernel. Not sure the reason behind it or if it's the kernel or netfilter causing it.. but so far my 2.4.19 is fine.. not that it helps you...

Why oh why can't anyone use google or read through an archive of this
list? I've helped _lots_ of people with this problem.

The solution is _very_ simple.

Recompile iptables against your new kernel and it _will_ work again.

-- 
/Martin

