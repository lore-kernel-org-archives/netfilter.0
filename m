From: Samuel Jean <sj-netfilter@cookinglinux.org>
Subject: Re: problem with connlimit
Date: Mon, 31 Jan 2005 19:57:47 -0500
Message-ID: <41FED40B.2040307@cookinglinux.org>
References: <41FE3EF3.7020909@fnet.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <41FE3EF3.7020909@fnet.pl>
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
To: iv <iv@fnet.pl>
Cc: netfilter@lists.netfilter.org

iv wrote:
> so my question is: did i do anything wrong, or maybe i forgot to do 
> anything, or it is a bug?
> thanks in advance,
> iv
> 
No, that's not a bug.. with older kernel. Stuff in patch-o-matic belong to it
because they are unmaintained to be synced with kernel.

Yes, connlimit is unsynced since 2.6.8.1 IIRC.

Regards,

Samuel

