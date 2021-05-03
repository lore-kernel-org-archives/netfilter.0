From: Frank Wunderlich <frank-w@public-files.de>
Subject: Aw: Re: Re: Flowtable with ppp/bridge
Date: Mon, 3 May 2021 20:56:48 +0200
Message-ID: <trinity-140ff956-faa3-4db5-a7b5-b89f01c7b715-1620068208738@3c-app-gmx-bap65>
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
 <20210502221122.GA19395@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620068208;
        bh=jcqDN3mmLszI7U3ENs3TpabhiW6fepSFVHdW9eLKAuA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=c77/bTjhcxRFN9tP7jBsO2bTOiy3Up4jxi0T2ACroUV1jyWJB00WkTGmvuW4yfSKx
         Nomxb3a+yggE7N3y8QDobcLwSp7xxSsBHFLFj+ohhxT4KDvxOT/pMemn0QVKRveV4n
         JTJsCb0/eYNMtG9Q8kcs5edt2hyFUFr8yPKFuu4k=
In-Reply-To: <20210502221122.GA19395@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo

> Gesendet: Montag, 03. Mai 2021 um 00:11 Uhr
> Von: "Pablo Neira Ayuso" <pablo@netfilter.org>

> You have to add a rule to clamp TCP mss to path MTU.
>
> ... tcp flags syn tcp option maxseg size set rt mtu

Thanks i try this like described here (just for reference):

https://wiki.nftables.org/wiki-nftables/index.php/Mangling_packet_headers

my MTU broadcast via dnsmasq does not work for all client-devices

but imho this should affect 5.12 and 5.10 without flowtable too (because l=
imit is the ppp-tunnel in default Gateway), right?? so it looks like flowt=
able in 5.10 breaks the Path Discovery or prevents fragmentation which sho=
uld normally happen if packets are too big.

regards Frank
