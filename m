From: Daniel Wittenberg <daniel-wittenberg@starken.com>
Subject: equalize traffic when link is down
Date: 08 Mar 2003 01:06:25 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047107185.2050.62.camel@runabout.noc.starken.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

If you use equalize with 2 default gateways (like 2 ISP's), and one of
them goes down, what happens to the traffic?  Will it automatically go
out the one up link, or will some traffic fail to go out?

Dan


