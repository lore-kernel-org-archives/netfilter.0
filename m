From: Steve M Bibayoff <smb23@csufresno.edu>
Subject: Using an device alias?
Date: Fri, 03 Jan 2003 11:07:25 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <b365eb2330.b2330b365e@cvip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Content-language: en
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
To: netfilter@lists.netfilter.org

Is it possible to use iptables with a device alias
(ex.. eth0:1)? I tries to add a filter rule and got
an error:
% iptables -t filter -I INPUT -i eth0:1 -j ACCEPT
Warning: wierd character in interface `eth0:1' (No
aliases, :, ! or *).

If i list the rules, it's listed, but it doesn't
appear to be working. I was wondering if someone had
a definite answer.

TIA

Steve


