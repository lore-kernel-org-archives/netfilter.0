From: Jason Opperisano <opie@817west.com>
Subject: re: ip_conntrack_max vs ip_conntrack
Date: Mon, 27 Sep 2004 14:04:32 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096308272.16814.48.camel@wolfpack.ljm.dom>
References: <561dc32604092710524f3a8b5b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <561dc32604092710524f3a8b5b@mail.gmail.com>
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

On Mon, 2004-09-27 at 13:52, Jiann-Ming Su wrote:
> I'd like to know what some of these proc paremeters mean as well. 
> What we're experiencing is a SYN flood attack that's filling up the
> connection tables.  What I'd like to do is change the timeout to 5
> seconds, instead of the default 30 seconds.

in the case of a SYN flood attack--you'd probably be better off
utilizing the limit match, rather than mucking with global timeout
values.

in any case--the timeout value you would probably be interested in
changing in the case of a SYN flood attack would be:

sysctl -w net.ipv4.netfilter.ip_conntrack_tcp_timeout_syn_recv=X

where your proposed X=5.

the default i have here for that value is 60 seconds.

-j

-- 
Jason Opperisano <opie@817west.com>


