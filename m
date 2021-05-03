From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Re: Re: Flowtable with ppp/bridge
Date: Mon, 3 May 2021 23:32:13 +0200
Message-ID: <20210503213213.GA17087@salvia>
References: <8AA68E42-DE50-4591-BCF0-18A058FA93F8@public-files.de>
 <20210426175703.GA3590@salvia>
 <B1C290C8-8CF7-435B-88B0-29A09E4B0CA6@public-files.de>
 <20210427234929.GA19570@salvia>
 <F9658CCF-3C23-4921-B27A-5EA1963BF33C@public-files.de>
 <4119615D-30F5-4A05-A206-5B7E97754F57@public-files.de>
 <trinity-f42dffe4-8c59-4f94-85ad-415d83452465-1619704777495@3c-app-gmx-bs69>
 <trinity-ff6011a6-3075-4189-8283-8dab8158b881-1619963468385@3c-app-gmx-bs63>
 <20210502221122.GA19395@salvia>
 <trinity-140ff956-faa3-4db5-a7b5-b89f01c7b715-1620068208738@3c-app-gmx-bap65>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <trinity-140ff956-faa3-4db5-a7b5-b89f01c7b715-1620068208738@3c-app-gmx-bap65>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netfilter@vger.kernel.org

On Mon, May 03, 2021 at 08:56:48PM +0200, Frank Wunderlich wrote:
> Hi Pablo
> 
> > Gesendet: Montag, 03. Mai 2021 um 00:11 Uhr
> > Von: "Pablo Neira Ayuso" <pablo@netfilter.org>
> 
> > You have to add a rule to clamp TCP mss to path MTU.
> >
> > ... tcp flags syn tcp option maxseg size set rt mtu
> 
> Thanks i try this like described here (just for reference):
> 
> https://wiki.nftables.org/wiki-nftables/index.php/Mangling_packet_headers

I have updated the wiki: you have to mangle the TCP MSS options of the
original syn and the reply syn+ack packets.

> my MTU broadcast via dnsmasq does not work for all client-devices
> 
> but imho this should affect 5.12 and 5.10 without flowtable too
> (because limit is the ppp-tunnel in default Gateway), right?? so it
> looks like flowtable in 5.10 breaks the Path Discovery or prevents
> fragmentation which should normally happen if packets are too big.

Did you try with the rule that mangles both the original syn and the
reply syn+ack packets? Do not restrict mangling to oifname pppoe0.
