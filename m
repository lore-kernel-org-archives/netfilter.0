From: "Michael Flegl" <flegl@fh-telekom-leipzig.de>
Subject: RPC-filtering with iptables
Date: Wed, 5 Feb 2003 09:22:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NGBBIPALJJJFOLMNDLHEMEDDCBAA.flegl@fh-telekom-leipzig.de>
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

Hallo,
is there anybody out there who can me explain the usage of the 
(new) RPC-module. I was able to compile it, the kernelmodules are
loaded and I can use the 'iptables -m rpc --rpcs 100005...' command 
successfuly. But, the ruleset does not work, connections requestet by
a portmapper command are blocked. I guess I do anything wrong, what???
Some iptables command examples would be very helpful.

Michael.

