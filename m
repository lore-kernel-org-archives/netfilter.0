From: "Jurrie Overgoor" <jurrie@pcamobile.com>
Subject: VPN masquerade and ftp-multi patches for 2.4.2-2
Date: Thu, 10 Oct 2002 12:24:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF218529EB.946E0C7E-ONC1256C4E.0037BAFE@PCA>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello there,

I'm currently in the proces of recompiling my kernel. It's version 2.4.2-2
(I don't want to upgrade, as I'm afraid it will break stuff).
I want to make a vpn server. Therefore I need the patch to get the
ip_pptp_nat module and the ip_conntrack_pptp module....
Besides that, I also want the ftp-multi patch so I can route ftp ports not
at 21.

But the problem is I cannot find the patches! Can anyone help me? How are
they called, and where can I download them?

I already did this on a 2.4.18-3 kernel with succes. I found the
vpn-masquerade patch for that kenel (it's called
netfilter-pptp-2.4.17-rev2.patch.gz)
I didn't need the ftp-multi patch for that machine... I also tried other
patches for previous and latter versions, but they did not patch 100%, so I
doubt they'll work.

Then there is an other thing I'd like to know: I use iptables v1.2.6a, do I
need to compile iptables also to get support for the ports= command? Or is
recompiling the kernel (and the modules ofcourse) enough?

Greetz -- Jurrie
jurrie@pcamobile.com

Please reply to me, I'm not on the mailing list. Thanks.



