From: Jason Opperisano <opie@817west.com>
Subject: Re: Can anyone tell me how to do this?
Date: Thu, 23 Sep 2004 10:55:55 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095951354.1750.36.camel@wolfpack.ljm.dom>
References: <20040923132216.67295.qmail@web51303.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040923132216.67295.qmail@web51303.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-09-23 at 09:22, Dominic Iadicicco wrote:
> ok, I have another one for all.
> 
> I have now been tring to do this:
> 
> I have an IP, 10.0.0.1 on eth1 and an IP 172.16.12.130
> at eth0. And heres were things get fun.  I want all
> ssh requests that go to 10.0.0.1 to get routed to
> 172.16.12.130 just like it worked when we did it from
> .130 to .212.  (if anyone is new and doesn't what was
> discussed yesterday, please let me know I will post
> it.)

are 10.0.0.1 and 172.16.12.130 on the same physical machine?

-j

-- 
Jason Opperisano <opie@817west.com>


