From: "Anthony Sadler" <anthonys@faredge.com.au>
Subject: Limiting connections per IP per port
Date: Fri, 20 May 2005 14:37:47 +1000
Message-ID: <14501.524080015$1116590388@news.gmane.org>
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

Hey

First post :D

I have a linux mail server that is getting spammed and mail bombed. In an
attempt to control this, we are trying to limit the amount of connections to
the server on port 25. 
Now we don't want to limit the total connections that are allowed to
connect, we would like to say that IP 1.2.3.4 can only have 4 sessions open
to us. 

I've been looking at the IP_LIMIT module for iptables, but it seems I can
only either limit total connections, or do it on a per IP basis (which would
be impossible).

So to summarise, I want as many separate hosts to connect, but only to be
allowed, say, 4 concurrent connections. 

Thanks!

Anthony Sadler


