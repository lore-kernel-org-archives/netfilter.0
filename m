From: "Thomas Ruecker" <mls@fl-base.de>
Subject: First masqueraded Connection Error
Date: Wed, 27 Nov 2002 15:18:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GEEAJNIDCCJEAICPEENHMEGKDHAA.mls@fl-base.de>
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
To: netfilter@lists.netfilter.org

Hi,
I'm new to iptables and got a small problem with masquerading.
I'm using most parts of the iptables-script from TLDP.org. The masquerading
ist work fine, but if I start the first connection to a host, like ssh, I
get an error. If I try it again, everything works fine. This happen to all
hosts, I'm trying to connect.
This connection is not a connection to the internet, it's just for
administrating some host with dialin, but I have to masquerade my network.

Thomas

--
Linux is like a wigwam - no windows, no gates, apache inside.



