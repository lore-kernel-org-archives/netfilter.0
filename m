From: Ben Woodard <ben@zork.net>
Subject: turning on automatic packet reassembly
Date: 07 Feb 2003 20:14:46 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1044677686.3182.52.camel@flix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.samba.org

I know that with the new netfilter code in 2.4, fragments are
automatically reassembled if you have connection tracking on. The thing
that I haven't figured out is how to turn connection tracking on. Do I
just load the ip_conntrack module. I don't need to do anything but
reassemble the fragments. 

Basically, what I need to do is unfragment NFS traffic from a non-jumbo
frame enabled gigabit ethernet to a jumbo frame enabled gigabit. 

-ben


