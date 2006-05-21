From: "TechMan" <techman@clickasun.net>
Subject: Port Redirection with Load balancing
Date: Sun, 21 May 2006 12:27:37 +0330
Message-ID: <200605210857.k4L8vbqk026796@Mail.clickasun.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Dears,

I have a server that runs 10 copies of a service on TCP ports 1000, 2000,
3000 . 10000. 
I would like to have clients connect to a single IP at TCP port 500 and have
a load balancer distribute the incoming requests across ports 1000 ... 10000
at the same machine. 
I don't want any of the servers have more than 100 concurrent connections. 
I want to use iptables port redirection with load balancing.
How can I do that?
 

Regards,
-Mahmood




