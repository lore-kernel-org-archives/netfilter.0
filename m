From: Josh Howlett <josh.howlett@bristol.ac.uk>
Subject: linux-2.4.22, iptables-1.2.9, imq
Date: 12 Nov 2003 15:56:09 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068652569.27810.450.camel@cumulus>
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
Cc: Josh.Howlett@bristol.ac.uk

Hi,

I am trying to get IMQ working with Linux 2.4.22 and iptables-1.2.9.

I have patched the kernel with the IMQ patch. No problem.

I then patched the latest patch-o-matic with the IMQ patch. No problem.

I then ran P-o-M against my kernel tree, and selected IMQ. No problem.

I then selected the IMQ target (module) and device (module) options in
the kernel configuration and compiled it. No problem.

I then compiled iptables against the kernel (statically). No problem.

When I run iptables I get: "Couldn't find target `IMQ'".

I assume that the IMQ stuff isn't getting linked into iptables. Where
have I gone wrong? I don't seem to have patched anything directly
against the iptables source...

many thanks, josh.

-- 
-----------------------------------------------------------
Josh Howlett, Networking & Digital Communications,
Information Systems & Computing, University of Bristol, U.K.
'phone: 0117 928 7850 email: josh.howlett@bris.ac.uk
------------------------------------------------------------


