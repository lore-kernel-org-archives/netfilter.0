From: Lopsch <lopsch@lopsch.com>
Subject: Re: semi OT: default route
Date: Wed, 20 Oct 2004 23:05:27 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4176D317.1010004@lopsch.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter-Mailinglist <netfilter@lists.netfilter.org>

I think this is really difficult to solve. Because you will have to bind
a connection to a certain interface and route. For example you start a
connection to a webserver over route A1. The answer will come back over
route A1 but what happens if you answer out again over the route A2 will
the server be able to answer or will it fail? Note the connection
started over A1 so the server will be awaiting packets from the IP of
the interface lying on route A1. So it will be necessary that a
process/connection keeps on one route. On our side where the router is
there is no problem conntrack will keep an eye on it but how will
servers react that get a SYN from an certain adress and then
confirmations on another IP?



