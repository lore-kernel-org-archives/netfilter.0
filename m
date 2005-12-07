From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Is using a blacklist in iptables a good strategy?
Date: Wed, 7 Dec 2005 14:45:04 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0512071423450.3548@darkstar.sysinfo.com>
References: <1133252475.20357.5.camel@sonoda.bioscene.co.jp>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1133252475.20357.5.camel@sonoda.bioscene.co.jp>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: David Leangen <netfilter@leangen.net>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 29 Nov 2005, David Leangen wrote:

>
> Hello,
>
> I don't know why, but I'm getting a little fed up with break-in attempts
> happening every single day.
>
> Do I just have to accept this as a fact of life?
>
>
> I started keeping a list of IP addresses that I'm just going to
> blacklist, but this does not seem like a maintainable solution. For now,
> I'm just adding lines like so:
>
>  ...
>  -A INPUT -s xxx.xxx.xxx.xxx -j BLACKLIST
>  ...
>  -A BLACKLIST -j DROP
>  ...
>
> What is common practice?


A default deny policy is the default best defense.

>
>
> Is it possible to blacklist any packets that come from a server from a
> given country?
>

Layered security might be your friend here, tcpd has these capabilities to 
aid iptables, consider:



# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
* * * *
*
# Explicit refusal.  No reason for any of these domains to be 
connecting... 
*
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
* * * *
*
ALL:

\
         .aero .biz .coop .edu .info .int .museum .name  .ac .ad .ae .af .ag .ai \
         .al .am .an .ao .aq .ar .as .at .au .aw .az .ba .bb .bd .be .bf .bg .bh \
         .bi .bj .bm .bn .bo .br .bs .bt .bv .bw .by .bz .ca .cc .cd .cf .cg .ch \
         .ci .ck .cl .cm .cn .co .cr .cs .cu .cv .cx .cy .cz .de .dj .dk .dm .do \
         .dz .ec .ee .eg .eh .er .es .et .eu .fi .fj .fk .fm .fo .fr .ga .gb .gd \
         .ge .gf .gg .gh .gi .gl .gm .gn .gp .gq .gr .gs .gt .gu .gw .gy .hk .hm \
         .hn .hr .ht .hu .id .ie .il .im .in .io .iq .ir .is .it .je .jm .jo .jp \
         .ke .kg .kh .ki .km .kn .kp .kr .kw .ky .kz .la .lb .lc .li .lk .lr .ls \
         .lt .lu .lv .ly .ma .mc .md .mg .mh .mk .ml .mm .mn .mo .mp .mq .mr .ms \
         .mt .mu .mv .mw .mx .my .mz .na .nc .ne .nf .ng .ni .nl .no .np .nr .nu \
         .nz .om .pa .pe .pf .pg .ph .pk .pl .pm .pn .pr .ps .pt .pw .py .qa .re \
         .ro .ru .rw .sa .sb .sc .sd .se .sg .sh .si .sj .sk .sl .sm .sn .so .sr \
         .st .su .sv .sy .sz .tc .td .tf .tg .th .tj .tk .tm .tn .to .tp .tr .tt \
         .tv .tw .tz .ua .ug .uk .um .uy .uz .va .vc .ve .vg .vi .vn .vu .wf .ws \
         .xxx .ye .yt .yu .za .zm .zr .zw                                       \

         : SPAWN (/usr/local/wrappers/tcpdmsg ALL_DENY %a %c %n %s %u)&         \
         : twist /usr/bin/cat /usr/local/wrappers/ALL_DENY.message


Now this has to be included not only on the firewall, but on hosts that 
are accessible externally as well, and that might come as a painful way to 
work such an issue, unless one really understands that layered securtity 
can come at a cost and require a few cycles to implimnet, and that 
layering does not mean the firewall does it all and all other systems 
stand alone or merely rely upon the firewall, and have some securityy 
implimented on them as well.


Thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFDlzvDst+vzJSwZikRAseOAKClgbJFoDPI/iJqISbU5RZRN4CC8ACgkO6B
18BSbrmJo+jFf9RsEo+UGrg=
=JARI
-----END PGP SIGNATURE-----

