From: Jochen Vogel <jvogel@it-sec.de>
Subject: AW: AW: GRE/PPTP and modules
Date: Thu, 29 Apr 2004 17:33:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D3DD55FDB74AD511BA5100500416368053E890@ORION>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Received: **stripped**
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
Cc: netfilter@lists.netfilter.org

http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-pptp-conntra
ck-nat

> What should i do to get the modules?

1. get iptables 1.2.9, patch-o-matic-ng and kernel sources (you can use
   Fedora SRPM package)
2. patch kernel sources using patch-o-matic-ng (see README)
3. configure, build and install pacthed kernel (you should be able to
   create a new RPM package, see RedHat documentation)
4. build and install iptables


Thx for the instructions.

Is it possible to get the modules precompiled?
For a lazy bugger ;)


