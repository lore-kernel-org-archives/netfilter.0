From: Aaron Clausen <maureen-taocow@alberni.net>
Subject: H.323 Patch
Date: Tue, 19 Nov 2002 11:06:14 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0211191105100.14950-100000@ts1.alberni.net>
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

I am trying to patch the 2.4.5 kernel for H.323 connection tracking, but
this is what I get:

Testing patch extra/h323-conntrack-nat.patch...
   Placed new Config.in line
   Placed new Config.in line
   Placed new Configure.help entry
   Placed new Makefile line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
TEST FAILED: patch NOT applied.

Is there some previous patch I am supposed to apply?

-- 
Aaron Clausen


