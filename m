From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: ipt_iplimit - IPtables 1.2.7a - Kernel 2.4.18 Issue Resolved
Date: Sun, 29 Sep 2002 14:22:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D96F09C.3040101@fugmann.dhs.org>
References: <OE29obC32qU4Z5flHgS00004b68@hotmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: hard__ware <hard__ware@hotmail.com>
Cc: netfilter@lists.netfilter.org

hard__ware wrote:
> 
> -------------------------------------------
> + ~src/linux-2.4/net/ipv4/netfilter/Makefile
> +++
> + O_TARGET := netfilter.o
> -+ M_OPJS := ipt_iplimit.o
> 
> #### here is what is used to be ####
> ---
> - O_TARGET := netfilter.o
> -
> ---------------end of patch---------------
> 
> ---------This one goes near of file--------
> + ~src/linux-2.4/net/ipv4/netfilter/ip_conntrack_standalone.c
> +++
> +EXPORT_SYMBOL(ip_conntrack_expected_related);
> +EXPORT_SYMBOL(ip_conntrack_unexpected_related);
> -+EXPORT_SYMBOL(ip_conntrack_find_get);
> +EXPORT_SYMBOL(ip_conntrack_tuple_taken);
> 
> ---
> -EXPORT_SYMBOL(ip_conntrack_expected_related);
> -EXPORT_SYMBOL(ip_conntrack_unexpected_related);
> -EXPORT_SYMBOL(ip_conntrack_tuple_taken)
> --------------------EOP-------------------

I'm not sure how to read this, but I guess that '-+' has a special meaning.

Could you please send a unified diff instead?. To make a diff between 
two files, do:
diff -u <old file> <new file>

(The '-u' is what makes it readable)

Regards
Anders Fugmann


