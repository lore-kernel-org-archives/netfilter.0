From: "Joe Wright" <joe.wright@noventech.com>
Subject: Ip Forwarding
Date: Thu, 28 Oct 2004 12:23:50 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1CNE0g-0006CA-00@deer.gmane.org>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi, I'm new to iptables and am trying to set up a firewall for my hosting
company. We have a block of 128 public ips starting at 207.145.24.128 with a
mask of 255.255.255.192. I have a redhat 9 box set up with 2 nics. My goal
is to have it between the router and my network. It should allow connections
to port 80 for all ips behind it and I would also like to specify certain
ports for certain ips for dns, ftp, remote desktop, etc. I've found tons of
info on using iptables with nat but not much on just blocking ports for ips
passing through it. I'm also not quite sure of how to configure the second
nic that connects to my internal network. Any help would be greatly
appreciated.

 

Joe

