From: Askar <askarali@gmail.com>
Subject: packets traverse on proxy/firewall
Date: Tue, 11 Jan 2005 10:37:10 +0500
Message-ID: <a0f69e5050110213739cef613@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

hello masters im configuring firewal + proxy/cache server "squid" both
on the same machine for our client. I gota few question regarding
traverse of packet in this scenrio
Proxy is transparent (interception)

1) packets (port 80 requests) from client will traverse INPUT chain
not FORWARD chain right?

2) squid will fetch the content on behalf of the clients packet leave
cache/firewall machine via OUTPUT chain right?

3) which chains packets will travers when response coming back from
Internet that is Internet ----> Cache --->Clients

Default policies for INPUT, OUTPUT , FORWAD will be DROP in which
chains i have to do filtering in either case i-e
Clients ----->Firewal/cache-----Internet and 
Internet --->Firewall/cache----->Clients

regards

Askar

-- 
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

