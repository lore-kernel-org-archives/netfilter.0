From: "Nick Edens" <nedens@checkerdist.com>
Subject: iptables 1.2.9 not loggin on forward chain
Date: Tue, 30 Mar 2004 13:06:52 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <34654.63.100.187.60.1080670012.squirrel@webmail.checkerdist.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I could really use some help here. I upgraded to iptables 1.2.9 by
recompiling it. I used patch-o-matic to update my kernel source to include
the ability to tarpit. After recompiling my kernel, then compiling
iptables, the log target does not work for the forward chain. It does work
for INPUT, OUTPUT, and NAT chains however. Is this maybe a bug in the
TARPIT? I am nating the address from the internal to the external.

Any help would be greatly appreciated as I need to figure this out before
putting this live.


- Nick Edens
  Checker Distributors
  400-B W. Dussel
  Maumee, OH
  43537



