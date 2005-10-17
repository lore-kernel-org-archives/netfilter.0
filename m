From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: TPROXY vs REDIRECT
Date: Mon, 17 Oct 2005 16:32:49 +0200
Message-ID: <200510171632.49254@nienna>
References: <20051017140908.B73ED4C11C@lists.balabit.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051017140908.B73ED4C11C@lists.balabit.hu>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


  Hi,

On Monday 17 October 2005 16.08, Andrew Cant wrote:
> I have done some quick searches, and reviewed the TPROXY
> documentation but I have not found an answer to the question of
> whether I should be using the TPROXY target for a simple transparent
> proxy. (i.e., not listening on a foreign address and not reporting a
> foreign address as a source)
>
> Currently, the system that I am working on is using the REDIRECT
> targets to transparently catch port 80 traffic and redirect it
> locally for either caching or authentication. Is there any benefit to
> using the TPROXY target in this case? I have not been able to find
> anything that explains what the differences between the two targets
> would be in this simple case.

  No, you shouldn't. The TPROXY target differs from REDIRECT in the 
following aspects:

* only works in the 'tproxy' table
* saves the original destination address in the IPCB, so that the 
user-space proxy will be able to get this information using recvmsg()
* sets a special status bit in the conntrack so the 'tproxy' match will 
match any packets belonging to that connection

  So, to sum it up, you probably don't want to use TPROXY instead of 
REDIRECT. (Especially if you redirect TCP traffic only, where the 
ip_conntrack provides a getsockopt() to get the original destination 
address.)

-- 
 Regards,
  Krisztian Kovacs

