From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: RE: Kernel 2.6.18 and quota match
Date: Mon, 25 Sep 2006 10:50:00 +0200
Message-ID: <BAY103-F260770D20AB6DE0A57B3BB2240@phx.gbl>
References: <BAY108-F265310C9580392B774E0A3BC240@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY108-F265310C9580392B774E0A3BC240@phx.gbl>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: uncystu@hotmail.com
Cc: netfilter@lists.netfilter.org

Stuart Clouston wrote:

>With kernel 2.6.18, should I still need patch-o-matic-ng to get the quota 
>match?

No, don't patch your kernel sources, nor iptables sources.
Try this procedure.
Untar linux kernel 2.6.18 source wherever you want
(for example under /usr/src/linux-2.6.18) and build
it. Then untar iptables snapshot, 'cd' to iptables
snapshot sources and run:

make KERNEL_DIR=/usr/src/linux-2.6.18



