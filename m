From: Jim Gifford <maillist@jg555.com>
Subject: IPTables 1.3.0 on MIPS
Date: Wed, 02 Mar 2005 23:56:42 -0800
Message-ID: <4226C33A.7060109@jg555.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

When I tried to compile iptables 1.3.0 on a MIPS based machine (Cobalt 
RaQ2), I get the following error.

# make BINDIR="/usr/bin" LIBDIR="/usr/lib" MANDIR="/usr/man"
Making dependencies: please wait...
Something wrong... deleting dependencies.
make: *** [cpu-feature-overrides.h] Error 1


Any suggestions

