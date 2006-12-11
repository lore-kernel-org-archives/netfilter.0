From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Iptables Modules
Date: Mon, 11 Dec 2006 13:54:57 +0100 (CET)
Message-ID: <1605.193.173.119.247.1165841697.squirrel@webmail.sterenborg.info>
References: <1538.193.173.119.247.1165839243.squirrel@webmail.sterenborg.info>
	<20061211123916.054C369469@smtp.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061211123916.054C369469@smtp.sterenborg.info>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Mon, December 11, 2006 13:38, Ali Ozaltin wrote:
> Rob,
>
> [root@websrv1 log]# ls
> /lib/modules/2.6.18-1.2798.fc6xen/kernel/net/ipv4/netfilter
> arptable_filter.ko ip_conntrack_proto_sctp.ko  ip_nat_tftp.ko

[....]

> ipt_dscp.ko ipt_REDIRECT.ko
> [root@websrv1 log]# modprobe ipt_hashlimit.ko
> FATAL: Module ipt_hashlimit.ko not found.
> [root@websrv1 log]# modprobe ipt_iprange.ko
> FATAL: Module ipt_iprange.ko not found.
> [root@websrv1 log]#
>
> I cant start modprobe can you pls advise ?

Try without .ko:

# modpobe ipt_hashlimit


Gr,
Rob



