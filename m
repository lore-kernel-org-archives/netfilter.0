From: Daniel Fenert <daniel@rotfl.linux.krakow.pl>
Subject: Limiting number of connections
Date: Sat, 4 Jan 2003 01:47:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030104004751.GA3308@fenert.net>
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
To: netfilter@lists.netfilter.org

Is there a simple way to limit number of connection coming from particular
client (ip address or subnet)?
I've searched through archive, and found only some patch to CVS version
of netfilter (it was year 2000)...

I've got problem with a few clients, they' are able to make 200+
connections on 128Kbit connection (according to /proc/net/ip_conntrack)

I thought about it today for a few minutes, and came with the idea:
1) Parse /proc/net/ip_conntrack and get clients with more than xxx
   connections
2) Setup rule to DROP NEW,RELATED to force them to close some connections
3) wait a minute, go to 1) checking additionally number of connections
   for blocked IP's. If number drops below xxx, delete rule DROP NEW,...
This is ugly, but possibly will work.

I hope that  there's better way to do it?

-- 
Daniel Fenert                 --==> daniel@fenert.net <==--
==-P o w e r e d--b y--S l a c k w a r e-=-ICQ #37739641-==
Is not that the nature of men and women -- that the pleasure is in the learning
of each other?        -- Natira, the High Priestess of Yonada, stardate 5476.3.

