From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: can't patch with patch-o-matic
Date: Tue, 18 Feb 2003 15:37:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030218153758.6e6d806a.arnt@c2i.net>
References: <E131E9F1848D0148813EAF06A846608FD7783B@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E131E9F1848D0148813EAF06A846608FD7783B@w2ks-e2k.iconos.be>
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
To: netfilter@lists.netfilter.org

On Tue, 18 Feb 2003 13:53:15 +0100, 
"Sneppe Filip" <Filip.Sneppe@cronos.be> wrote in message 
<E131E9F1848D0148813EAF06A846608FD7783B@w2ks-e2k.iconos.be>:

> Hi Luis,
> 
> Luis Miguel Cruz Miranda [mailto:luismi@b2bi.es] wrote:
> >
> >I have patch command installed, the problem is: why I  can't use 
> >tcp-window-tracking patch?
> >
> 
> Because you have already applied what is commonly referred to
> (in technical terms) as "a shitload of other netfilter patches".
> :-)
> Come on, the window tracking patch is quite "intrusive" and touches
> a lot of code. You've already included a lot of other netfilter 
> patches. Patches are bound to step on each other that way. 
> 
> Patch-o-matic is cool in that it handles a lot of this
> stuff without problems, but if you are applying too many patches
> on top of each other, you should resolve any conflicts yourself...

..this attitude is not good enough.  As a minimum, all the base patches
should make it into "my" patched kernel, starting from a _clean_ Linus
tree.  The extras etc, should stop and warn that "this" patch does not
"allow" etc "that" patch, "so, you need to choose which you want".  

..preferably, patch-o-matic should also work as good with Red Hat
kernels, up to and including "base", as Red Hat and its derivatives 
are the entry level distros.  From "extra and up", work from the 
vanilla kernel trees.  

..and, I'd like to have Patch-o-matic log what it does, to a file, 
either as the default, or as a suggestion on how to do it from the 
cli, in a readme, as you see, people come here to learn.

> 
> >
> > Already applied: submitted/01_2.4.19
> >                   submitted/02_2.4.20
> >                   submitted/ipt_multiport-invfix
> >                   submitted/ipt_ULOG-mac_len-fix
> >                   pending/01_ip_conntrack_proto_tcp-lockfix
> >                   pending/02_newnat-udp-helper
> >                   pending/03_REJECT-fwspotting-phrack60-fix
> >                   pending/04_ftp-conntrack-msg-fix
> >                   pending/05_ECN-tcpchecksum-littleendian-fix
> >                   base/fuzzy
> >                   base/iplimit
> >                   base/ipt_unclean-ubit
> >                   base/ipv4options
> >                   base/IPV4OPTSSTRIP
> >                   base/mport
> >                   base/NETLINK
> >                   base/NETMAP
> >                   base/nth
> >                   base/pool
> >                   base/psd
> >                   base/quota
> >                   base/random
> >                   base/realm
> >                   base/SAME
> >                   base/time
> >                   base/TTL
> >                   extra/condition
> >                   extra/CONNMARK
> >                   extra/h323-conntrack-nat
> >                   extra/ip_tables-proc
> >                   extra/ipt_TARPIT
> >                   extra/mms-conntrack-nat
> >                   extra/pptp-conntrack-nat
> >                   extra/recent
> >                   extra/ROUTE
> >                   extra/rsh
> >                   extra/string
> >                   extra/talk-conntrack-nat
> >                   extra/tftp-conntrack-nat
> 
> Regards,
> Filip
> 


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



