From: Jason Opperisano <opie@817west.com>
Subject: Re: How to use netfilter to do static IP mapping?
Date: Sat, 25 Sep 2004 22:24:05 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096165445.16814.7.camel@wolfpack.ljm.dom>
References: <20040925014043.62520.qmail@web51807.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040925014043.62520.qmail@web51807.mail.yahoo.com>
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

On Fri, 2004-09-24 at 21:40, Patrick Dung wrote:
> By the way, for my case, do I also need to add this
> rule:
> 
> iptables -t nat -A POSTROUTING -o eth0 -s 10.1.1.2 --j
> SNAT --to 1.1.1.2
> ..etc..
> 
> Regards
> Patrick

yes, if you want outbound requests initiated by 10.1.1.2 to be
translated to 1.1.1.2, you do.

-j

-- 
Jason Opperisano <opie@817west.com>


