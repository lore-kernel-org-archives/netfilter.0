From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: Problem with conntrack idle connection timeout
Date: Fri, 4 Nov 2005 17:03:33 +0100
Message-ID: <200511041703.34112@nienna>
References: <436B7BFE.3060807@isotrol.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <436B7BFE.3060807@isotrol.com>
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
Cc: Manuel Marquez <Manuel.Marquez@isotrol.com>


  Hi,

On Friday 04 November 2005 16.19, Manuel Marquez wrote:
> The problem is the use a JDBC connection pool and (I think) the linux
> firewall drops the pool connections after about 600 seconds of idle
> time. They can change the pool to make it reconnect whenever this
> happens, but they are planning to set up another interface (backend
> network) and move the oracle server there. If they did this, sqlplus
> and oracle forms would also get disconnected after this idle period
> (they have made tests with the same results on an oracle server
> connected to the DMZ). It also happens with SSH connections to the
> application (Tomcat 5) server.

  Then there must be some other problem which is not directly related to 
TCP timeout values in Netfilter. If connection tracking is working 
properly, established TCP connections will time out only after five 
days.

  A somewhat more detailed inspection of the firewall ruleset could help 
you identifying the portion of the ruleset where the packets get 
dropped. (A couple of well placed LOG rules can do a wonder.) BTW, you 
did not even mention what version of Linux is running on the firewall.

-- 
 Regards,
  Krisztian Kovacs

