From: =?ISO-8859-1?Q?S=E9bastien_CRAMATTE?= <scramatte@zensoluciones.com>
Subject: Re: layer 7
Date: Fri, 05 Jan 2007 14:27:42 +0100
Message-ID: <459E524E.3050003@zensoluciones.com>
References: <459E48A6.4030206@eccotours.co.za>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040809020609030800090406"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <459E48A6.4030206@eccotours.co.za>
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
To: Brent Clark <bclark@eccotours.co.za>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------040809020609030800090406
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Layer7 requires to patch iptables and kernel
Moreover you must have  ip_conntrack module loaded too else layer7
wouldn't work ...
ipt_layer7 depends of ip_conntrack but doesn't load it automaticaly

Regards

Brent Clark a =E9crit :
> Hey all
>
> Was wondering if someone could please help.
>
> Im trying go get layer7 working, problem is that I dont see it in
> /lib/iptables.
>
> Weird thing is I patched the kernel and its even loaded
>
> root@cptgate:/lib/iptables# lsmod | grep -i layer
> ipt_layer7             10788  0
> x_tables               13252  22
> ipt_layer7,ipt_TOS,ipt_SET,ipt_TARPIT,ipt_ROUTE,ip6t_LOG,ip6_tables,ipt=
_owner,ipt_hashlimit,ipt_SAME,ipt_REDIRECT,iptable_nat,ipt_TCPMSS,ipt_TTL=
,ipt_CLUSTERIP,ip_tables,ipt_LOG,ipt_MASQUERADE,ipt_REJECT,ipt_ULOG,ipt_i=
prange,xt_MARK
>
> root@cptgate:/lib/iptables#
>
> My question is, do I have to get the source and compile iptables its,
> or can have I missed something.
> I comparing from using patchomatic, a part from having the source, not
> much more was needed.
>
> If someone could assist, I would greatfully be appreciated.
>
> Kind Regards
> Brent Clark
>


--------------040809020609030800090406--

