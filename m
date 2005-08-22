From: John Kielkopf <john@webifi.com>
Subject: Forward udp and tcp to another external IP address.
Date: Mon, 22 Aug 2005 11:09:21 -0500
Message-ID: <4309F8B1.1060309@webifi.com>
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

We're planning on moving a server to another location and to ease to 
move we'd like to for forward all TCP and UDP traffic coming in on a 
particular IP address at location A to a different address at location 
B.  Note that these addresses are from two different hosts.

Using rinetd I can do this for TCP, but I haven't figured out how to get 
iptables to do this for TCP or UDP.

Anyone?

Thanks,
-John


