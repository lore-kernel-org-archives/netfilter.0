From: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Subject: GRE problem
Date: Thu, 13 Jan 2005 10:13:17 +0100
Message-ID: <200501131013.17416.marcin.giedz@eulerhermes.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hello all,

I've posted this message on several news groups without any results, maybe 
here someone can help me...

I still have problem with GRE through Linux router and Win2k clients but
additional information have occured. Let's start from the beginning:

My subnet is as follows:
192.168.49.0 ----- linux router ------ 172.19.1.0 ------> Win2k clients

When first client is trying to connect to VPN server out side our office all
packets are sent through "linux router". When he finishes the connection
and second client wants to make a new connection no GRE packets are sent
through router. If I down and up interfaces on "linux router" everything
works OK as earlier - GRE packets are transmitted through router. If I
don't down and up interfaces but wait eg. for next day everything also
works OK. It seems for me that some "timeout" variable is set on my linux
router but I didn't set anything. 

Can you tell me where I can change this "timeout" on my router? For me it
should stay in /proc/xxxx? but what next?

Thanks,
Marcin

