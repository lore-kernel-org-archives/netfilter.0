From: "Jason H. Zalmanowitz" <jason@skbhosting.com>
Subject: Gobbling my bandwidth?
Date: Sun, 29 Dec 2002 17:10:28 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.0.20021229165840.00b088c0@mail.zalnet.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,

I've scoured the mailing list and can't find anything, so I figure I'll 
start a new topic...

I'm running a Debian GNU/Linux box for a router / firewall at home.  Using 
a 2.4.19 customed kernel, Pentium MMX, IPTables 1.2.6a, and Narc 
auto-configuration script for IPTables.  I've got the same configuration 
running on a webhosting box, except its running a p4 1.5.

My problem is that intermittently (and only as of lately) has my connection 
been dropping to ~4000ms for a roundtrip... and after 15-20 minutes it 
resumes back to its normal ~80ms.  Does anyone know whats causing this?

Logging is off, and afaict the rules are optimized.  When I stop IPTables 
and just try pinging google, my ping time returns to 80... but as soon as I 
fire IPTables up again, it raises the ping time to ~4000ms.

Theres nothing listing in my processes (ps aux or top) that indicate 
anything related to IPTables or narc... I am absolutely stumped - as this 
has only happened in the past 2 days after 3 months of running solid.

Any and all help is greatly appreciated.

Jason Zalmanowitz
-www.zalnet.net


