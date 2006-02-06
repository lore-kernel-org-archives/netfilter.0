From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: PMTU-D and conntrack
Date: Mon, 06 Feb 2006 00:47:38 -0500
Message-ID: <1139204858.2549.5.camel@localhost>
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
To: Netfilter users list <netfilter@lists.netfilter.org>

Are the ICMP Destination Unreachable-Fragmentation Needed and DF Set
(type 3, code 4) packets sent in response to a TCP packet doing PMTU
discovery considered RELATED or does one need to allow NEW connections
for such packets?

By the way, is there a way to specify code number in the --icmp-type
match? I think one can do -p 1 --icmp-type fragmentation-needed but I
usually use the numbers to avoid lookups, e.g., -p 1 --icmp-type 8.
Thanks - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


