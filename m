From: meridian@zipworld.com.au
Subject: PSD and bitmasks
Date: Wed, 3 Nov 2004 15:51:36 +1100 (EST)
Message-ID: <Pine.LNX.4.44.0411031547310.15644-100000@zeus.zipworld.com.au>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Is there any way to match scans with Portscan Daemon (PSD) based on a
bitmask other than 255.255.255.255? Currently PSD only matches scans from
a single host. I would like to be able to set a mask for PSD to use to see
if scans are coming from a certain range. I can't see any current feature
in patch-o-matic that would allow this to be done with PSD short of adding
it directly to the PSD module.  I think this would be a neat-o (tm)
feature

Regards
Stephen


