From: "Marc Fargas" <telenieko@telenieko.com>
Subject: RV: POM on Debian PPTP contrack patch
Date: Sun, 1 Feb 2004 23:17:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5BDF4E1253C4@fargas.com>
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
To: netfilter@lists.netfilter.org

Hi, I've been triying to get the contrack pptp patch to work on Debian. 

I've downloaded kernel 2.4.18 sources and uncompressed them, then patched
with POM with no problem, but the pptp patch says I have to recompile
userspace tools so I did an apt-get source iptables to go on with it. The
problem is that when running debian/rules to compile iptables it takes the
.tar.bz2 of the kernel sources from /usr/src and uncompresses it to it's
local folder for doing the iptables binarys, Is there anyway to force
iptables package to compile with the patched kernel sources and not the
compressed original ones???

Thanks for all!!




