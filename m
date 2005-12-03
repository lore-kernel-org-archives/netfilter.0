From: stefanb@zitmail.uni-paderborn.de
Subject: Fwd: NAT not working
Date: Sat,  3 Dec 2005 14:40:14 +0100
Message-ID: <1133617214.4391a03e73dfb@zitmail.uni-paderborn.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Sorry for the repost, but I accidentally posted with different From-address than
the one I used to subscribe to the list.

----- Forwarded message from stefanb@zitmail.uni-paderborn.de -----
Hello!

I have a problem with NAT on my sparc64 system. Apparently, inbound packets do
not have their addresses translated, therefore all machines behind my routing
machine do not get any replies to their messages.

The latest kernel which worked for me is 2.6.8.1, starting with 2.6.9 NAT broke
for me. I think it is the kernel version which first introduced
/proc/net/ip_conntrack_expect, which is always empty on my machine. I am not
sure whether it is supposed to be empty. I just tried kernel 2.6.14.3 but the
problem still persists. Any attempted connections appear as [UNREPLIED] in
/proc/net/ip_conntrack.

I believe this could be a bug. A filed a bug report in the Kernel's Bugzilla a
long time ago, but I didn't receive any feedback so far.

I hope anyone can help me with this.

Regards,
Stefan Boettner

----- End forwarded message -----



