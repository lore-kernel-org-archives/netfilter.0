From: k.tragant@firemail.de
Subject: Re: disabling connection tracking
Date: Fri, 29 Aug 2003 08:10:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308290810.12734.k.tragant@firemail.de>
References: <1061809936028593@lycos-europe.com> <3F4E9F10.5030403@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F4E9F10.5030403@snapgear.com>
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
To: netfilter@lists.netfilter.org, philipc@snapgear.com

Hi Philip!

> You probably have an ip_conntrack module that it is loading still.
> Do a lsmod to see.  You'll need to delete it (or you might be able
> to add something to /etc/modules.conf).  Look under
> /lib/modules/$(KERNELRELEASE)/kernel/net/ipv4/netfilter/

Thank you for an answer. Unfortunately, this is not correct, because I've=
=20
build a monolithic kernel without module support. These are the netfilter=
=20
compononet, I switched on in the kernel:

# CONFIG_MODULES is not set

#   IP: Netfilter Configuration
CONFIG_IP_NF_IPTABLES=3Dy
CONFIG_IP_NF_MATCH_MULTIPORT=3Dy
CONFIG_IP_NF_FILTER=3Dy
CONFIG_IP_NF_TARGET_REJECT=3Dy
CONFIG_IP_NF_TARGET_LOG=3Dy

Maybe there are other ideas?

Regards
Kurt Tragant


