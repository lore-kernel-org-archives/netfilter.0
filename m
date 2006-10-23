From: "Scot Harkins" <scoth@bigfoot.com>
Subject: Fwd UDP packets to multiple destinations
Date: Mon, 23 Oct 2006 13:09:14 -0700
Message-ID: <013301c6f6df$1d4922b0$640fa8c0@harkinshome>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Howdy,


I am looking for a way to set up a simple trap forwarder that doesn't mess 
with the packets.  I want to have SNMP traps in UDP coming into one 
destination and use perhaps iptables to distribute the traps to multiple 
servers.

I am about to experiment with a few things involving the netfilter tools, 
starting with iptables.

Has this problem already been licked?  Can you point me to the solution?


Thanks!
sh

--
Scot Harkins (KA5KDU)
Greenbank, WA
360-544-8750
877-303-4656
scoth@bigfoot.com
http://www.bigfoot.com/~scoth



