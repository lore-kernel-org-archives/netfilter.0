From: Mark <markdv.netfilter@asphyx.net>
Subject: Duplicates in recent module
Date: Sat, 07 Jul 2007 10:29:24 +0200
Message-ID: <1183796964.3647.28.camel@velocity.nl.tiscali.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi,

I'm getting duplicate entries in a "recent" table. E.g.:

# cat banned | grep 193.23.112.133
src=193.23.112.133 ttl: 58 last_seen: 436851854 oldest_pkt: 1 last_pkts: 436851854
src=193.23.112.133 ttl: 58 last_seen: 435101910 oldest_pkt: 1 last_pkts: 435101910
src=193.23.112.133 ttl: 58 last_seen: 435600728 oldest_pkt: 1 last_pkts: 435600728

I took a quick look at the source(*) and I as far as I understand even
if I would "--set" the same IP multiple times it would/should still only
create one entry.

These are the rules I use:
-A in $ETH0_TCP_SYN -m recent --rcheck --seconds 60 --name banned --rsource -j DROP 
-A in $ETH0_TCP_SYN -m recent --remove --name banned --rsource 
-A in $ETH0_TCP_SYN -m hashlimit --hashlimit 5/sec --hashlimit-name accept --hashlimit-htable-max 4096 -j ACCEPT 
-A in $ETH0_TCP_SYN -m hashlimit --hashlimit 5/sec --hashlimit-name drop --hashlimit-htable-max 4096 -j DROP 
-A in $ETH0_TCP_SYN -m recent --set --name banned --rsource -j DROP 

Although this tries to avoid adding the same IP to the list multiple
times I think it is unavoidable that multiple packets could have passed
the initial 'rcheck', and heading towards the final 'set' rule at the
same time. (It's a quad core CPU.)

Is there something I can, or should, do to prevent these dups?

(*)I must admit that the running kernel is a 2.6.17.7 and I looked at
the source of linux-2.6.22-rc5.

Regards,
Mark.



