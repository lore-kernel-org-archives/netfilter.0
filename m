From: Nagy Zoltan <kirk@elte.hu>
Subject: vpn problem
Date: Sat, 09 Apr 2005 18:18:39 +0159
Message-ID: <42580075.7050007@elte.hu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


hi

i'm think about how can i set up a vpn on our lan,
and make possible that not all systems are reachable by the connected vpn users
something like that user A have access to our data servers only, but user B can access the database,firewall servers
i'm thinking about that if the clients can login to the vpn gw server i could use gid match to put the clients ip in a recent list,
and i can use the recent lists to mark the packets and filter by that ;)
i'm thinking about that i've missed something...and there is a simpler solution ;)


kirk


