From: Luis Miguel Cruz Miranda <luismi@b2bi.es>
Subject: RE: can't patch with patch-o-matic
Date: Tue, 18 Feb 2003 16:37:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.2.20030218163537.01c473e8@172.26.0.8>
References: <E131E9F1848D0148813EAF06A846608FD7783B@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Sneppe Filip <Filip.Sneppe@cronos.be>, netfilter@lists.netfilter.org

Ok,

I deleted /usr/src/linux at all.
I use the original 2.4.19 source code and I still can't apply=20
tcp-window-tracking patch :(


At 13:53 18/02/2003 +0100, you wrote:

>Hi Luis,
>
>Luis Miguel Cruz Miranda [<mailto:luismi@b2bi.es>mailto:luismi@b2bi.es] =
wrote:
> >
> >I have patch command installed, the problem is: why I  can't use
> >tcp-window-tracking patch?
> >
>
>Because you have already applied what is commonly referred to
>(in technical terms) as "a shitload of other netfilter patches".
>:-)
>Come on, the window tracking patch is quite "intrusive" and touches
>a lot of code. You've already included a lot of other netfilter
>patches. Patches are bound to step on each other that way.
>
>Patch-o-matic is cool in that it handles a lot of this
>stuff without problems, but if you are applying too many patches
>on top of each other, you should resolve any conflicts yourself...
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
>Regards,
>Filip

Luis Miguel Cruz Miranda.               |       B2B INTEGRAL, S.A.
CCNA - Systems Administrator            |       Pol. Ind. de Asipo
                                         |       C/A - Parcela 86-C
Tel: +34 902 506 605                    |       33.428 - CAYES - LLANERA
Fax:+34 985 980 794                     |       ASTURIAS (ESPA=D1A/SPAIN)



