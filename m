From: "=?ISO-8859-1?Q?Martin_Schi=F8tz?=" <malinux@gmail.com>
Subject: connlimit
Date: Wed, 10 Jan 2007 13:01:09 +0100
Message-ID: <e208f5d10701100401g4a0e8a69g3c6da88724148708@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi

Just installed Fedora Core 6 with:
  kernel-2.6.18-1.2869.fc6
  iptables-1.3.5-1.2.1

I want to use connlimit on a bridge (eth0 and eth1) but it gives me this error:
iptables: Unknown error 4294967295

It looks like connlimit is included in iptables
(/lib/iptables/libipt_connlimit.so) but as remember I also need
'ipt_connlimt.ko' module in the kernel. In older days I think I
compiled the kernel with:
CONFIG_IP_NF_MATCH_LIMIT=m

But when I look at the kernel config for kernel-2.6.18-1.2869.fc6 I
see something like:
CONFIG_NETFILTER_XT_MATCH_LIMIT=m

This is something about xtables - what is xtables?

Which module(s) do I need if I want to use 'connlimit'?

Do I need to patch with patch-o-matic?

:-)
Martin

