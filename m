From: "Maciej Soltysiak" <solt@dns.toxicfilms.tv>
Subject: Re: --reject-with icmp-admin-prohibited
Date: Mon, 2 Feb 2004 16:57:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00a801c3e9a5$46b3a5c0$0e25fe96@pysiak>
References: <04e501c3e95a$e0674aa0$c2bf09ca@huecal> <04fd01c3e963$20fea7e0$c2bf09ca@huecal> <1075718155.22226.41.camel@ssatchell1.pyramid.net>
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
To: Iptables Mailing List <netfilter@lists.netfilter.org>

Hi,

> I finally looked in the source and found "icmp-admin-prohibited" but
> when I tried it with 1.2.7 it didn't work.
In order to have it working you need, iptables-1.2.8+ and kernel
2.4.22+ (i think it was around 2.4.21 when it was accepted)

These two contain the correct code for this option to work.
You are encouraged to use the latest iptables package and 2.4.22+
kernel, because with previous kernels this would not work,
using this option would result in a plain DROP instead of sending icmp.

Please use the most up2date sources. If you do not want to change
for some reason your 1.2.7 code, you would still need to patch your
kernel code to update the ipt_REJECT module, and patch your
iptables-1.2.7 sources to update libipt_REJECT userspace module.

So you'd be better of using 1.2.9 and 2.4.22+
No patching with those two running.

Regards,
Maciej
(the author of admin-prohib patch)


