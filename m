From: Frank Wunderlich <frank-w@public-files.de>
Subject: Aw: Re: Re: Re: Flowtable with ppp/bridge
Date: Tue, 4 May 2021 12:54:24 +0200
Message-ID: <trinity-13a72f9d-3ac6-45a0-a24d-05d3415697a6-1620125664660@3c-app-gmx-bap14>
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
 <20210503213213.GA17087@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620125664;
        bh=wLHRYhlVEUCPl0sLVXWVEevlti4k6yzwLTvlUzT8rTI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ISDeDYIvMFNmX2nqaZMXXlGrb6TvSQdQYxmMdIk1oAupo5FFU4Fm8l35TNcpSkHNE
         d8ID9QqDRh/sGCzxRJaSwPum/bjEHDf9J/Cc4TNXud8qRCLmF0gamGa9gkLldC0fjP
         MBLm6epIB6uDK35T3Oi3tbXymoTwHoZ3+4BD6Lj0=
In-Reply-To: <20210503213213.GA17087@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

> Gesendet: Montag, 03. Mai 2021 um 23:32 Uhr
> Von: "Pablo Neira Ayuso" <pablo@netfilter.org>

> On Mon, May 03, 2021 at 08:56:48PM +0200, Frank Wunderlich wrote:
> I have updated the wiki: you have to mangle the TCP MSS options of the
> original syn and the reply syn+ack packets.

does old rule not match both directions (syn and syn+ack)? it looks like
you have only removed the "oifname ppp0"

> > but imho this should affect 5.12 and 5.10 without flowtable too
> > (because limit is the ppp-tunnel in default Gateway), right?? so it
> > looks like flowtable in 5.10 breaks the Path Discovery or prevents
> > fragmentation which should normally happen if packets are too big.
>
> Did you try with the rule that mangles both the original syn and the
> reply syn+ack packets? Do not restrict mangling to oifname pppoe0.

my last tests were completely without any mss fix, so i should have always=
 the problem
with and without flowtable in all Kernel-versions. but i had the problem o=
nly in 5.10
with flowtable, so i guess flowtable in 5.10 blocks the normal behaviour o=
r adding
additional headers internally which prevents a normal forward.

my current rule is this (only on main-router without any extensive tests..=
.):

    chain FORWARD {
        type filter hook forward priority 0; policy drop;
        #https://wiki.nftables.org/wiki-nftables/index.php/Mangling_packet=
_headers
        #MSS fix for pppoe 1500 - 8 (pppoe) - 20 (ipv4) - 20 (TCP)
        oifname $ifwan tcp flags syn tcp option maxseg size set 1452

$ifwan is my ppp8, and "tcp flags syn" imho should match syn and syn+ack.

Dropping the "oifname pppX" makes no sense for me as the ppp-interface is =
the bottleneck. why should i watch for tcp-packets on lan-only where every=
 interface has the mtu 1500? imho i need to limit only the packets going t=
hrough the bottleneck on my side. The other side should be handled by ISP =
(but with syn and syn-ack i watch both directions and modify if needed).

btw. i read that the flow offload makes a bypass resulting that further ru=
les are not processed, right?

i have some limits in formward-chain, that may be skipped.

example:

   chain FORWARD {
        type filter hook forward priority 0; policy drop;
        oifname $ifwan tcp flags syn tcp option maxseg size set 1452
        ip protocol { tcp, udp } flow add @f
        oifname $ifexternal ip saddr $iprangesblocked jump REJECTED commen=
t "block internal ip ranges to have only internal access"
        udp dport {41,43,44,58,59,60} jump REJECTED comment "block ipv6 in=
 ipv4 tunnel"

is it true that bottom 2 rules are not processed due to the flowtable? i g=
uess (!) flowtable only affects established connections where bottom 2 rul=
es prevent this ("connections" do not enter established state because drop=
ped on first packet).

regards Frank
