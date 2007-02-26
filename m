From: "Christopher Wallin" <walle@dawe.se>
Subject: iptables <= 1.3.7
Date: Mon, 26 Feb 2007 17:11:44 +0100
Message-ID: <027301c759c0$cf2352a0$6b0a0bc1@Walle>
Reply-To: walle@dawe.se
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

Hi,
I've tested to upgrade my iptables and i think that i have made it but maby
not to 100%.
It seems that my iptables is blocking my inbounds generated connection, so
when i have -P INPUT DROP, my traffic goes from my pc and to the server but
iptables is blocking them when the replies from the server comes to my PC.

So how do i get iptables to accept my own generated traffic?
Any suggestions of what is wrong?

/Walle



