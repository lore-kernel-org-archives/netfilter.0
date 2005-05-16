From: =?ISO-8859-2?Q?=A3ukasz_Hejnak?= <sziftgroup@wp.pl>
Subject: Re: SSH Brute force attacks
Date: Mon, 16 May 2005 10:16:56 +0200
Message-ID: <428856F8.60706@wp.pl>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>
	<42864CA9.7050802@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42864CA9.7050802@riverviewtech.net>
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

>> I'm on a HLFS system (april svn) and my kernel is now 2.6.11.9-grsec,
> Silly question, have you insmoded or modprobed your recent module in to 
> the kernel?  Do an lsmod to see if you see the recent module the loaded 
> modules list. 
Yes it is loaded, and partly works fine (I described it below)

> If you would like I'd be happy to send you a 
> copy of my .config file for you to look at and see the differences.
If You can, please do so, cause I'm in a '-j TARPIT' here myself ;]

I mean now I know a bit more, but still some bits are missing.
I found info on the TARPIT, and it seems that it's not fully supported 
in the 2.6.x kernels yet. So here I'm left with DROP.
But as for the recent module itself it's a werid one, cause it looks 
like my iptables don't accept lines like
`iptables -m recent ... -m recent ...`
I mean no matter what I put after the second -m recent, it get's 
rejected with a 'Unknown arg' msg, altrough the first one works fine :\
Can't figure this one out, anybody has an idea?

Szift

