From: "Mike S. Matsumoto" <mikematsumoto@gmail.com>
Subject: This is possible?
Date: Mon, 27 Nov 2006 10:16:17 -0200
Message-ID: <c576e5da0611270416v2baae792v786457639970f83@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

	    		INTERNET
                           /      \
                         /          \
                       /              \
                     /                  \
                   /                      \
                 /                          \
 ------------------------                    	  ----------------------------
|Connection 1  |                     | Connection 2  |
|IP no-dynamic|                     |  Dynamic IP   |
 ---------------------------                       ---------------------------
                   \                        /
                     \                    /
                       \                /
                         \            /
                           \        /
  		 	----------------------
		       | FIREWALL |
	    		----------------------
                          /          \
                        /              \
                      /                  \
                    /                      \
	          /                          \
 -----------------------------                    ------------------------
| DMZ Segment |                 | Internal NET |
| Public ips        |                 | Private ips    |
 ----------------------                        -----------------------


Guys, this is possible?

I have two connections with Internet. And I need that DMZ use
Connection 1 and Internal NET use Connection 2 for access Internet.

So, i will have one default gw for connection 1 and another for connection 2.

How this work? Any tutorial or link for help me?


Thanks.
---
Mike

