From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: Patching iptables 1.2.11 and kernel 2.6.10
Date: Fri, 4 Mar 2005 01:56:09 +0200
Message-ID: <fad9d484050303155657737228@mail.gmail.com>
Reply-To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org, GLUG-Chat <glug-chat@linux.org.za>

Guys

I've spend hours trying to figure this, and plenty of Google searches.
If anyone can help it would be greatly appreciated.

I'm trying to get IPP2P and the layer7-filter to work with iptables
1.2.11 and kernel 2.6.10 on Fedora Core 3. The kernel patches cleanly,
compiles just fine and reboots perfectly. The problem is that I can't
get iptables to compile.

I get the same error message every time I run make:

#error including kernel header in userspace; use the glibc headers instead!

One suggestion was to compile iptables against /usr/include/linux
instead of /usr/src/linux. This worked, but none of my new modules
were available. Another suggestion was to edit
/usr/src/linux/includes/linux/config.h and comment out the error line
with the above message. This worked, I got a compiled and installed
iptables, man pages, the works.

Problem is that for every rule I try I get the same response from iptables:

# iptables -A FORWARD -o eth0 -m ipp2p --ipp2p -j DROP      
iptables: No chain/target/match by that name
# iptables -A FORWARD -o eth0 -m ipp2p --ipp2p -j REJECT
iptables: No chain/target/match by that name

When I run:

# iptables -m ipp2p --help

I do get help, leading me to believe that the iptables binary is
screwed in some way. Looking in /lib/iptables I can see
libipt_ipp2p.so and libipt_layer7.so. The modules exists and both can
be loaded.

How would I get iptables to compile with my modules without changing
(and breaking) the kernel source? I know nothing about C, or C++ so I
can't dive in and fix things up myself.

Any help would be appreciated.

-- 

Kenneth Kalmer
kenneth.kalmer@gmail.com
http://opensourcery.blogspot.com

