From: "Aaron Clausen" <techlists@alberni.net>
Subject: Iptables 1.2.8 Compile Errors
Date: Wed,  2 Jul 2003 11:53:28 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307021153.AA850591966@mail.alberni.net>
Reply-To: <techlists@alberni.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

I'm trying to compile Iptables 1.2.8 for a 2.4.21 kernel that has had patch-o-matic-20030107 applied to it.  The kernel compiles fine, but I'm continually getting errors compiling libipt_ROUTE.c.  I realize that the easiest thing to do is to simply not enable this extension in the kernel, and yet turning it off in the config doesn't do anything.  Does anybody have a solution?

-- 
Aaron Clausen

