From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: Re: Unable to apply pptp patch
Date: Wed, 3 Jul 2002 09:22:46 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <002901c22262$6e42b4c0$153fa8c0@hslbrabantzuid.nl>
References: <000c01c2222e$157ed9b0$0a02a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

----- Original Message -----
From: "Rowan Reid" <rreid@studio3arc.com>
To: <netfilter@lists.samba.org>
Sent: Wednesday, July 03, 2002 3:08 AM
Subject: Unable to apply pptp patch

> Has anyone been able to apply the pptp patch to a 2.4.4 or above kernel
> I've used rusties patch-o-matic with the make pending-pom_patches
> Whenever I get to the pptp patch it fails. Several others fail too.  I
> tried on a 2.4.8 and a 2.4.4 kernel.
>
I think there are multiple PPTP patches available.
I got mine from http://www.impsec.org/linux/masquerade/ip_masq_vpn.html and
it works like a charm.
There are patches for 2.4.12, 2.4.15 and 2.4.17.

The Netfilter website says that the PPTP patch that can be downloaded on
their site has a limitation so you can only make one pptp connection to one
host - not stopping you to make another connection to another host.
I don't know if the one I use has the same limitation.

I have it up and running with the 2.4.17 kernel.
No problems encountered here (yet). Just patched the kernel and recompiled
it.
Then I compiled a new iptables and it worked.

Rob


