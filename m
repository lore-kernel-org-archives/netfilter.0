From: Chris Lowth <chris@lowth.com>
Subject: How to block Kazaa with IPTables
Date: Fri, 29 Aug 2003 10:11:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308291011.55478.chris@lowth.com>
Reply-To: chris@lowth.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The "p2pwall" project has released a "user mode" add-in for IPTables that 
blocks Kazaa. Recent Kazaas use random ports and encrypted traffic in an 
attempt to "break through" firewalls. P2PWall solves these problems for the 
current Kazaa versions.

P2PWall currently uses the "QUEUE" target of iptables to pass packets to the 
daemon for verification. A future enhancement is planned to bring the logic 
into iptables as kernel "match module".

http://www.lowth.com/p2pwall

Chris
-- 
From Chris Lowth
chris@lowth.com

