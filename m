From: Philip Craig <philipc@snapgear.com>
Subject: Re: Compiling ip_[conntrack|nat]_pptp
Date: Tue, 20 Apr 2004 15:58:24 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4084BC00.9050509@snapgear.com>
References: <20040420054614.AB314398@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040420054614.AB314398@sterenborg.info>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Sterenborg <rob@sterenborg.info>
Cc: 'Netfilter' <netfilter@lists.netfilter.org>

Rob Sterenborg wrote:
> Hi,
> 
> I compiled kernel 2.4.26 with pom-ng-17042004 and applied (amongst others)
> the pptp patch.
> Everything compiles fine except for that patch.
> 
> When I do a "make modules_install", the last lines are :
> 
> if [ -r System.map ]; then /sbin/depmod -ae -F System.map  2.4.26-4; fi
> depmod: *** Unresolved symbols in
> /lib/modules/2.4.26-4/kernel/net/ipv4/netfilter/ip_conntrack_pptp.o
> depmod:         ip_ct_gre_keymap_add
> depmod:         ip_ct_gre_keymap_destroy
> depmod: *** Unresolved symbols in
> /lib/modules/2.4.26-4/kernel/net/ipv4/netfilter/ip_nat_pptp.o
> depmod:         ip_ct_gre_keymap_change
> 
> I notice in /lib/modules/2.4.26-4/kernel/net/ipv4/netfilter that there are
> ip_conntrack_pptp.o and ip_nat_pptp.o but I don't have a
> ip_conntrack_proto_gre.o which I do have on my "old" iptables box.

This patch should fix that:

http://lists.netfilter.org/pipermail/netfilter-devel/2004-March/014618.html

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


