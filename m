From: waltdnes@waltdnes.org
Subject: T-Pot (TCP HoneyPot) idea
Date: Thu, 10 Apr 2003 18:07:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030410220741.GA32442@m1800>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: Netfilter list <netfilter@lists.netfilter.org>

  I'm sure every here has seens lots of SYN-packets in their logs,
trying to connect to various ports they shouldn't be talking to.  I
don't run any public servers, and I use passive ftp, so I simply block
all connection attempts.  The general procedure is to drop the packet,
and ignore it.  What would be the effect of sending back a SYN-ACK
packet (and anything else necessary?) to fake the setting up of a
connection... and then dropping the packet and ignoring it ?

  Would an infected machine scanning the net eventually run into
resource limits and DOS itself ?  I'm sure that professional crackers
can work around this, but if we can make things a bit more painful for
skiddies and automatic worms, then let's do it.

  Can such trickery be pulled off with a current bog-standard iptables,
or does someone need to write a new "target"?

-- 
Walter Dnes <waltdnes@waltdnes.org>
An infinite number of monkeys pounding away on keyboards will
eventually produce a report showing that Windows is more secure,
and has a lower TCO, than linux.

