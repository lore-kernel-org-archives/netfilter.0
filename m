From: Nguyen Dinh Nam <64vn@cardvn.net>
Subject: Re: problem with connlimit
Date: Tue, 01 Feb 2005 09:06:15 +0700
Message-ID: <41FEE417.2050603@cardvn.net>
References: <41FE3EF3.7020909@fnet.pl> <41FED40B.2040307@cookinglinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <41FED40B.2040307@cookinglinux.org>
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
To: Samuel Jean <sj-netfilter@cookinglinux.org>
Cc: netfilter@lists.netfilter.org, iv <iv@fnet.pl>

No, connlimit still work with 2.6.8.1, it breaks since 2.6.9 you may try 
the lastest version from http://svn.netfilter.org/, I hope they will fix 
it soon. I am missing connlimit as well as connbytes and connrates and 
waiting for them to be available for 2.6.10 too

Samuel Jean wrote:

> No, that's not a bug.. with older kernel. Stuff in patch-o-matic 
> belong to it
> because they are unmaintained to be synced with kernel.
>
> Yes, connlimit is unsynced since 2.6.8.1 IIRC.
>
> Regards,
>
> Samuel


