From: Nick Drage <nickd@metastasis.org.uk>
Subject: failure when using --string
Date: Thu, 26 Aug 2004 23:17:40 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040826221740.GE22322@metastasis.org.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi,

Any ideas why this would be failing?  It's the example straight out of
the documentation:

host# iptables -A INPUT -m string --string 'cmd.exe' -j QUEUE
iptables: No chain/target/match by that name

This is on a Debian Stable box.  Is it possible that "-m string" is
permitted by the userspace tool but the functionality hasn't been
included in the kernel?

-- 
mors omnia vincit

