From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Delay in responding caused by netfilter ?
Date: Mon, 02 May 2005 02:50:06 -0500
Message-ID: <4275DBAE.3040702@riverviewtech.net>
References: <42721F84.6080503@mnemon.de>	<200504290937.49507.Alistair@nerdnet.ca>	<20050429142517.GA1074@bender.817west.com>
	<4273031B.20009@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4273031B.20009@riverviewtech.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> Rather than allowing ident would it be possible to do a REJECT (via 
> iptables -t filter -A OUTPUT -j REJECT) (I'm not sure if this can be a 
> policy or not) that way the ident will fail immediately verses timing 
> out?  That is if you don't want the ident to happen.  Seeing as how a 
> LOT of servers don't even support ident any more this might just as well 
> be an option.

I have written some rules and posted them to the mail list (see https://lists.netfilter.org/pipermail/netfilter/2005-May/060150.html) on how to REJECT Ident (Auth) queries only for systems that you have recently sent SMTP traffic to.  It would be fairly easy to extend it to work for Pop3 as well.  Take a look if you are interested.



Grant. . . .

