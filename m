From: "Logu" <logumail@gmx.net>
Subject: Re: -L for LAGG
Date: Tue, 17 Sep 2002 11:50:12 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00c501c25e12$684352a0$5f0110ac@kovaiteam.com>
References: <3D85E320.93CDA560@sympatico.ca>
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
To: Jimmy James <jamesstickland@sympatico.ca>, netfilter@lists.netfilter.org

It might be trying for name lookup.  So try with iptables -t filter -L -n.
This will speed up the listing but in numerical format.

-Logu

> when i do iptables -t filter -L there is a lot of lag to preceed the
> output.  I know there is a way to speed this output up (was reading it
> somewhere), but i never had this problem before i got new kernel source
> and patched it for ipt1.2.7.
>
> please help.



