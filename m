From: Filip Sneppe <filip.sneppe@cronos.be>
Subject: Re: Nat problem with GRE
Date: 04 Jun 2003 10:17:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054714668.454.3.camel@xbox>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D9F@wardrive.citadelcomputer.com.au> 
	<005901c32a2d$c661d0e0$fd00a8c0@homes>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005901c32a2d$c661d0e0$fd00a8c0@homes>
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
To: John Paul <john@pinoylinux.sytes.net>
Cc: George Vieira <georgev@citadelcomputer.com.au>, Esteban <esteban@alstec.fr>, netfilter@lists.netfilter.org

On Wed, 2003-06-04 at 02:10, John Paul wrote:
> George, et al.
> 
> I actually have the same problem. I successfully patched my kernel(2.4.20)
> with ip_pptp_conntrack (P-O-M) but after recompiling my kernel, iptables
> doesnt recognize  NAT  anymore. How could this happen?
> 
Hi,

Recompile your iptables userspace program against those
patched kernel sources & reinstall it.

Regards,
Filip


