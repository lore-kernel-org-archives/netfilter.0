From: Jim Gifford <maillist@jg555.com>
Subject: Use of Kernel Headers
Date: Tue, 17 Aug 2004 13:40:54 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41226D56.3080800@jg555.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

I have been asked this question a lot of times, and I think it should be 
asked here for an official answer.

It has been stated numerous times that userspace programs should not be 
compiled against raw kernel headers, but iptables does compile against 
userspace headers and breaks this rule. With the advent of the 
linux-libc-headers package, should iptables be compiled against the 
linux-libc-headers or the raw kernel headers since iptables is a user 
space program?

Should patch-o-matic update the headers in the proper location, 
/usr/include/linux/netfilter_ipv4 etc?

----
Jim Gifford
maillist@jg555.com


