From: ard-netfilter@kwaak.net
Subject: DNAT and accounting
Date: Wed, 20 Nov 2002 19:56:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021120185637.GD7487@kwaak.net>
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

Hi,
I did not really find it yet (yes, I am a louse searcher) in the
archive, but does anybody know if it is possible to get
accounting statistics from a DNATted network?
I mean:
iptables -t nat --append PREROUTING --destination 192.168.1.0/24 \
  --jump DNAT --to-destination 192.168.1.1

How can I get accounting statistics for all the ip addressess
that are in that range?
Something like
iptables -t mangle --append PREROUTING --source 192.168.1.4
or:
iptables -t mangle --append POSTROUTING --source 192.168.1.4

As I can see it: there is no table that is able to see the
un-DNATted version of the returning packet.
In other words: if I have set up a connection to 192.168.1.4, it
will be a DNATted connection to 192.168.1.1 . But now I want to
have statistics about how much 192.168.1.1 sends back in name of
192.168.1.4 . As far as I can see, all the tables only see
192.168.1.1 as the sender of the reply packets.
-- 
mail          up    4+07:59,     4 users,  load 0.00, 0.02, 0.00
mistar1       up    1+21:11,     6 users,  load 0.00, 0.00, 0.00
Let your government know you value your freedom: sign the petition:
http://petition.eurolinux.org


