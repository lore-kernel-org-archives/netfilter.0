From: "Sebastian" <netfilter@basti79.de>
Subject: CONNMARK Target Problem
Date: Thu, 25 Mar 2004 16:07:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000501c4127a$f6338c60$0200a8c0@basti79>
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
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>

Hi List...

I tried to insert a rule using the CONNMARK-Target:
# iptables -t mangle -A OUTPUT -j CONNMARK --set-mark 1
iptables: Invalid argument

Dmesg say's: 
CONNMARK: targinfosize 8 != 12

Kernel is 2.4.25 with pom snapshot 20040319.
Iptables is debian package 1.2.9-6:
# iptables --version
iptables v1.2.9

Any suggestions what i can do to get the CONNMARK target working?

Greets
  Sebastian.


