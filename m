From: Marcel Pol <mpol@gmx.net>
Subject: extensions/libipt_NETLINK.c doesn't get built
Date: Tue, 17 Dec 2002 19:51:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021217195128.5c745d30.mpol@gmx.net>
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
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org


Hello,
I have patched my 2.4.19-1mdk kernel with NETLINK, iplimit and string from
pom-cvs from yesterday.
For userspace iptables I use an unpatched 1.2.7a.
The problem I run into is that the NETLINK library doesn't get built. When I
run the testscript .NETLINK.test, it detects the .c file in my sourcetree, but
it doesn't get built when I run make. There's no build error, it just doesn't
try to compile it.
I'm not sure where it goes wrong.
The string and iplimit libraries get built fine.

It's listed as optional in the Makefile. I assume that if the test runs ok,
then it should get built. right? I'm not that good at reading Makefiles, but I
didn't think there was an option needed with running make. If there is, please
inform me :-)
I'm building it on an Alpha AXPpci 166 ev4.

Greetings,
--
Marcel Pol

Linux 2.4.20-0.4mdk.ringworld.1, up 10 days, 23:07
Registered User #163523


