From: Askar <askarali@gmail.com>
Subject: patch not applied
Date: Mon, 8 Nov 2004 12:45:38 +0500
Message-ID: <a0f69e504110723453eb7117c@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

hi 
I am trying to apply pom to my kernel 2.6.9 but I don't know why I
only getting "TEST FAILED: patch NOT applied." for every patch.

here what I follow
1) download pom via cvs
2) export KERNEL_DIR=/home/askar/linux-2.6.9

then cd ~/netfilter/patch-o-matic and finally
./rume extra 
I also tried ./runme base , but with no success

here is the single interaction with pom bitch...

Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] y
Testing patch extra/condition.patch...
Warning - no help text file could be found in either
/home/askar/linux-2.6.9/net/ipv4/netfilter/Config.help
or /home/askar/linux-2.6.9/Documentation/Configure.help
fgrep: /home/askar/linux-2.6.9/net/ipv4/netfilter/Config.in: No such
file or directory
Could not find place to slot in Config.in line
TEST FAILED: patch NOT applied.

I am getting the same message for every patch

regards
askar

-- 
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

