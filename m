From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Sat, 14 May 2005 14:08:25 -0500
Message-ID: <42864CA9.7050802@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>
	<4285C016.2060900@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4285C016.2060900@wp.pl>
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

> I have the 'recent match' compiled into the kernel as a module
> and I had recompiled the kernel and then the iptables, and still the 
> above apears when executing.
> Any ideas to what can be wrong here?
> I'm on a HLFS system (april svn) and my kernel is now 2.6.11.9-grsec,
> as I updated it to see if it's related to the problem.
> The iptables I use was downloaded yesterday via svn

Silly question, have you insmoded or modprobed your recent module in to the kernel?  Do an lsmod to see if you see the recent module the loaded modules list.  Sorry I can't be more specific on this as I run unmodularized kernels for various reasons and thus can't really help all that much with modules.  If you would like I'd be happy to send you a copy of my .config file for you to look at and see the differences.

> Also I understand that a `iptables -N SSH_Brute_Force` is mutedly 
> assumed? or maybe I'm missing something bigger here?

Hmm, I don't know about that.  I do know that I have had to explicitly create new chain(s) any time I wanted to use a user defined chain.



Grant. . . .

