From: Aaron Clausen <maureen-taocow@alberni.net>
Subject: IPTables and 2.4.19 Kernel
Date: Fri, 22 Nov 2002 16:12:50 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0211221609230.279-100000@ts1.alberni.net>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have been running an older version of iptables 1.2.2 under 2.4.9.  I have
been unable to patch this kernel to iptables 1.2.7a, so I downloaded the
2.4.19 source.  I patched this kernel fine, but whether I compile iptables
as modules or right into the kernel, when I boot into 2.4.19, I get the
following errors on most of my rules:

iptable: Invalid argument

When I reboot into 2.4.9, everything works.  I have upgraded the iptables
binary to 1.2.7a, and it works under 2.4.9.  Am I missing something?

-- 
Aaron Clausen


