From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Re: Flowtable with ppp/bridge
Date: Mon, 3 May 2021 00:11:22 +0200
Message-ID: <20210502221122.GA19395@salvia>
References: <16CF72C8-335A-48D2-BA6F-FF632735DCFD@public-files.de>
 <20210426172924.GA3178@salvia>
 <8AA68E42-DE50-4591-BCF0-18A058FA93F8@public-files.de>
 <20210426175703.GA3590@salvia>
 <B1C290C8-8CF7-435B-88B0-29A09E4B0CA6@public-files.de>
 <20210427234929.GA19570@salvia>
 <F9658CCF-3C23-4921-B27A-5EA1963BF33C@public-files.de>
 <4119615D-30F5-4A05-A206-5B7E97754F57@public-files.de>
 <trinity-f42dffe4-8c59-4f94-85ad-415d83452465-1619704777495@3c-app-gmx-bs69>
 <trinity-ff6011a6-3075-4189-8283-8dab8158b881-1619963468385@3c-app-gmx-bs63>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <trinity-ff6011a6-3075-4189-8283-8dab8158b881-1619963468385@3c-app-gmx-bs63>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netfilter@vger.kernel.org

On Sun, May 02, 2021 at 03:51:08PM +0200, Frank Wunderlich wrote:
> Hi,
> 
> i got a bit further and it looks like an MTU-Issue
> 
> i tested now with my 5.10 bridges,vlan and pppoe
> 
> first 2 working without problems, pppoe works only if i reduce mtu to e.g. 1480 (pppoe has 1492).
>
> i tried with this patch (found as difference between my 5.10 and 5.12 hnat trees), but this does not solve it.
> 
> https://github.com/frank-w/BPI-R2-4.14/commit/5f7d57280c1982d993d5f4ff0edac310f820f607 (bpf: Drop MTU check when doing TC-BPF redirect to ingress)
> 
> any idea? i wonder why mtu is a problem here, as with 1500 default i
> still got internet-connection (over pppoe on main-router too) and
> due to Pathdiscovery it should fragment. Seems this is not working
> in 5.10 for flowtable. Without flowtable (disable "flow add" line,
> disabling "flags offload" is not enough) i have no issues.
> 
> any idea?

You have to add a rule to clamp TCP mss to path MTU.

... tcp flags syn tcp option maxseg size set rt mtu
