From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: conntrack records not going away?
Date: Mon, 20 Dec 2004 14:19:24 -0500
Message-ID: <876ef97a041220111947fbeff5@mail.gmail.com>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
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

Hi all,

We have a box running 2.4.26 (from kernel.org) over here that's
serving as a sink for test SMTP traffic. The box sits behind a Linux
box that is doing ProxyARP. The weird thing is, sometimes after
sending tons of traffic to the sink, conntrack records hang around in
the ESTABLISHED state, even though the sink process (the endpoint for
the connections in question) has been shut down. Has anyone ever seen
this before? TIA :)

-- 
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

