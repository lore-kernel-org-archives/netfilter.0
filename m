From: "Kevin Smith" <starwatcher22@earthlink.net>
Subject: Dependency Issue..
Date: Mon, 28 Apr 2003 02:24:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001501c30d4e$d756b560$0200000a@workgroup.kev>
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

I was compile a new kernel (2.4.20) mostly to get the ip_nat_cuseeme module
working when I this during the compile:

Circular /usr/src/linux-2.4.20/include/netfilter_ipv4/ip_conntrack.h <-
/usr/src/linux-2.4.20/include/linux/netfilter_ipv4/ipconntrack.helper.h
Dependency Dropped

I Believe this is why the module I'm installing isn't compiling. In my
research, there was info about a patch, but no patch found. I've also
checked bugzilla with no luck.
Can someone give me and idea where to look, or if this is known, where to
get a patch.
I have also applied patch-2.4.20, just incase it would make a diff..which it
didn't.
Any info will be appreciated, or point towards a fix.

Thanks Kev


