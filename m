From: Noah <sitz@onastick.net>
Subject: CVS Respository failures
Date: Sun, 3 Nov 2002 13:51:22 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211031349230.20957-100000@stanis.onastick.net>
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

Just tried to d/l the latest ipfilter from CVS, and got the following
error:

sitz@uberwench:~/src/tmp$ cvs -d
:pserver:cvs@pserver.netfilter.org:/cvspublic co netfilter/userspace
can't create temporary directory /tmp/cvs-serv32524
No space left on device

I'm thinking that since there's space on /my/ system, that the cvs server
is having space issues? =)

--n


