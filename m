From: "Brandon Broyles" <netfilter@drbroyles.com>
Subject: Re: Am I making a bone-headed mistake with patch-o-matic ?
Date: Sun, 24 Nov 2002 00:53:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <038e01c2937d$cece8030$4545450a@drbroyles.com>
References: <031e01c2930e$41097800$4545450a@drbroyles.com> <200211241243.59265.fabrice@netfilter.org>
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
To: fabrice@netfilter.org, netfilter@lists.netfilter.org


----- Original Message ----- 
From: "Fabrice MARIE" <fabrice@netfilter.org>
To: <netfilter@drbroyles.com>; <netfilter@lists.netfilter.org>
Sent: Saturday, November 23, 2002 11:43 PM
Subject: Re: Am I making a bone-headed mistake with patch-o-matic ?

> There is a problem though (fixed in the CVS, but not yet updated on the
HTML page..)
> you shouldn't run # make patch-o-matic, but instead from the patch-o-matic
directory,
> you should run the ./runme script with the patch suite you want to apply
as a parameter.
> The corrected SGML source of the document is there :
>
http://cvs.netfilter.org/cgi-bin/cvsweb/~checkout~/netfilter/documentation/H
OWTO/netfilter-extensions-HOWTO.sgml


From what I read in the above link, I think something may be wrong with my
patch-o-matic I got via CVS.  I ran a (./runme base) and I got the following
output.  In this output the only thing that is "Already applied:" is the
first line.  Nothing else seems to be applied after that.  Plus, that link
above references  switches ( Do you want to apply this patch [N/y/t/f/q/?] )
that I am not getting.

*********************************************************************
Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so I don't recommend applying them all!
-------------------------------------------------------
Already applied: submitted/2.4.18
                 submitted/ahesp-static
                 submitted/arptables
                 submitted/config-cleanup
                 submitted/conntrack?helper-unregister
                 submitted/conntrack
                 submitted/dscp
                 submitted/DSCP
                 submitted/ecn
                 submitted/ECN
                 submitted/helper
                 submitted/ip6tables-export-symbols
                 submitted/ip6tables-exthdr-bug-ipv6
                 submitted/ip_conntrack_protocol_destroy
                 submitted/ip_conntrack_protocol_unregister
                 submitted/ip_nat_irc-srcaddr-fix
                 submitted/ipt_MIRROR-ttl
                 submitted/ipt_REJECT-checkentry
                 submitted/ipt_unclean-ecn
                 submitted/ipv6-agr-ipv6
                 submitted/irc-dcc-mask
                 submitted/length-ipv6
                 submitted/local-nat
                 submitted/log-tunnel-fix-ipv6
                 submitted/macro-trailing-semicolon-fix
                 submitted/mangle5hooks
                 submitted/nat-export_symbols
                 submitted/nat-memoryleak-fix
                 submitted/netfilter-arp
                 submitted/ownercmd
                 submitted/pkttype
                 submitted/REJECT-dont_fragment
                 submitted/REJECT_mark
                 submitted/remove_no_version
                 submitted/skb_clone_copy
                 submitted/TOS-oops-fix
                 submitted/ulog-module-unload
                 submitted/ulog-nlgroup-shift-fix
                 submitted/ulog-sparc-bitops-fix
                 submitted/unclean-udpchecksum
                 submitted/z-newnat16
                 submitted/z-newnat_assertfix
                 submitted/z-newnat_changeexpect-lockfix
                 pending/newnat-udp-helper
                 base/ahesp6-ipv6
                 base/frag6-ipv6
                 base/fuzzy
                 base/iplimit
                 base/ipt_unclean-ubit
                 base/ipv4options
                 base/IPV4OPTSSTRIP
                 base/ipv6header-ipv6
                 base/mport
                 base/NETLINK
                 base/NETMAP
                 base/nth
                 base/opts6-ipv6
                 base/pool
                 base/psd
                 base/quota
                 base/random
                 base/realm
                 base/REJECT-ipv6
                 base/route6-ipv6
                 base/SAME
                 base/time
                 base/TTL

-----------------------------------------------------------------
No more patches to apply! Q to Quit or ? for options [Q/a/r/b/?]
Excellent! Kernel is now ready for compilation.
*********************************************************************

I never get a chance to choose which patches I wish to install.  Before I
wrote that first message to this mail list, I had already tried recompiling
the kernel and iptables after I ran (./runme base).  Does it look like my
patch-o-matic is working incorrectly?

Thanks,
Brandon Broyles



