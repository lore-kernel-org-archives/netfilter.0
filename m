From: Mogens Valentin <monz@danbbs.dk>
Subject: Re: [ANNOUNCE] IPTState 1.4
Date: Tue, 19 Apr 2005 20:56:03 +0200
Message-ID: <42655443.40405@danbbs.dk>
References: <42621FBB.7080806@ipom.com>
Reply-To: monz@danbbs.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42621FBB.7080806@ipom.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Phil Dibowitz <phil@ipom.com>
Cc: netfilter@lists.netfilter.org

Phil Dibowitz wrote:
> IPTState 1.4 has been released.
> 
> IPTState is a curses application that gives you a real-time, top-like
> view of states across your Netfilter/IPTables firewall.
> 
> New in this release is the ability to filter what is displayed by source
> and/or destination IP, the ability to tag entries where hostnames were
> truncated, the ability to surpress DNS-related entries (useful for
> name-resolution mode), and various code and documentation cleanups.

Nice. Would be even nicer with the ability to toggle options from either 
a menu or a'la top.
Would be nice to be able to do iptstate -S somewhere.net, i.e. use fqdn.
Would also be nice to simply specify some address/fqdn, and show all 
traffic to/from that address, i.e. -D and -S combined.

-- 
Kind regards,
Mogens Valentin


