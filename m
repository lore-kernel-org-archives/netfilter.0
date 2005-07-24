From: Vlada Macek <tuttle@bbs.cvut.cz>
Subject: Accounting using conntrack
Date: Sun, 24 Jul 2005 19:39:09 +0200
Message-ID: <42E3D23D.20000@bbs.cvut.cz>
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

I'm facing the problem of having to obtain the stats of long-time
transfer between the corporate LAN and the Internet based on many
factors. My NATting box uses Linux netfilter.

I've been googling for some solution, but those like iptraf or existing
patches against nf (e.g. "account") seem suboptimal to me, since they
make additional hooks and run tasks similar to what in-kernel
netfilter's connection tracker already does. It IMHO causes needless
overhead.

AFAIK, the connection tracking works like this: 1) For every packed
going thru the nf must find proper item in some hashtable of existing
connections OR create such item. 2) For every connection there is a
point in time when it is discarded.

How difficult would it be to add small accounting code (conn.numpackets
+= 1, conn.numbytes += packet.payloadsize for each direction) for (1),
provided it's not already there (for which I'm unaware) AND for the
closing moment (2), dump short statistics to kernel log (together with
more info about the connection - e.g. timeout or FIN, etc.)? Did anyone
make such changes already?

Advantages:

    - No standalone ever-running daemon that must be monitored.

    - There is no redundance with processing same information to similar
result data.

    - IMHO the least possible overhead, just dumping the data that are
already created.

    - The data may be taken away from the firewalling box and summarized
somewhere else afterwards.

    - Connection end will be logged with timestamp, which may help
service problems debugging when paired with usual -j LOG && -j ACCEPT
log message.


What do you think?

Please let me express my gratitude for such great piece of software the
netfilter is.

-- 

\//\/\
(Sometimes credited as 1494 F8DD 6379 4CD7 E7E3 1FC9 D750 4243 1F05 9424.)



