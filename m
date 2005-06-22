From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Fragments and connection tracking
Date: Wed, 22 Jun 2005 14:35:37 -0400
Message-ID: <1119465338.5378.4.camel@jasiiitosh.nexusmgmt.com>
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

We are working to use an iptables based VPN for a client where teh
certificates do not fit into a single packet. Thus we have a
fragmentation problem.  We normally drop all fragments on the Internet
interfaces in our rule sets.  We are a little hesitant to stop doing so.

Does connection tracking make it safe to do so or does it make it more
dangerous? I understand that connection tracking will reassemble the
fragments.  If someone is trying to attack by sending lots of non-head
fragments, will connection tracking drop those as invalid or will this
produce a denial of service attack as connection tracking tries to match
a flood of fragments without first fragments? Thanks - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


