From: Tim Perton <grpanosgr@yahoo.com>
Subject: iptables: hide the real web server from users
Date: Wed, 14 Feb 2007 04:53:30 -0800 (PST)
Message-ID: <354862.54159.qm@web33304.mail.mud.yahoo.com>
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

Dear friends,
I have a web server running on system B. I run my main
services to System B but I do not want my users to
talk to system B directly.
So I have another server (System A) in a differrent
ISP & a completely different C class IP address like
below:

-----------------------------
--- System A (IP=a.b.c.d) ---
-----------------------------

-----------------------------
--- System B (IP=e.f.g.h) ---
-----------------------------

System A runs iptables(redhat EL4).

I want my users to do a request like
http://a.b.c.d/1.php and then machine A to make the
same request to System B, get the results and send
them back to the user transparently.
Practically System A to act as an intermediatery to
the real machine (System B).

Any idea on how to do this?

Regards,
Tim Perton


 
____________________________________________________________________________________
Food fight? Enjoy some healthy debate 
in the Yahoo! Answers Food & Drink Q&A.
http://answers.yahoo.com/dir/?link=list&sid=396545367

