From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: stop uptime and name + version querying
Date: Tue, 12 Apr 2005 15:11:20 +0200
Message-ID: <425BC8F8.5060905@eccotours.dyndns.org>
References: <425B9FCE.7050105@eccotours.dyndns.org>
	<20050412124818.GA26130@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050412124818.GA26130@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Jason Opperisano wrote:

> 
> just a stab in the dark, but what does:
> 
>   sysctl net.ipv4.tcp_timestamps
> 
> have to say?

[root@ns modules]# sysctl net.ipv4.tcp_timestamps
net.ipv4.tcp_timestamps = 1
[root@ns modules]#

Why
Is this something I can learn from (HOPE SO).

Thanks
Brent Clark

P.s. How do I do this (sysctl net.ipv4.tcp_timestamps)  on a Debian box

