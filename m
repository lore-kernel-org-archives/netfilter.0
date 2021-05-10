From: Frank Wunderlich <frank-w@public-files.de>
Subject: Aw: Re: Re: Re: Re: Re: Re: Re: Flowtable with ppp/bridge
Date: Mon, 10 May 2021 11:00:00 +0200
Message-ID: <trinity-6a69901b-6d3e-487c-b331-0ba5b68fd1c6-1620637200659@3c-app-gmx-bs56>
References: <20210502221122.GA19395@salvia>
 <trinity-140ff956-faa3-4db5-a7b5-b89f01c7b715-1620068208738@3c-app-gmx-bap65>
 <20210503213213.GA17087@salvia>
 <trinity-13a72f9d-3ac6-45a0-a24d-05d3415697a6-1620125664660@3c-app-gmx-bap14>
 <20210504114256.GA6473@salvia>
 <trinity-95c69486-d51d-4c21-8923-e845e0c04269-1620204924394@3c-app-gmx-bs20>
 <20210505225516.GB13833@salvia>
 <trinity-3bc0c812-7f83-491f-9845-5091c29526e6-1620294801192@3c-app-gmx-bap25>
 <20210506155134.GA28034@salvia>
 <trinity-abe9ce42-2ceb-416a-a3e9-b4ecc810df5f-1620629456214@3c-app-gmx-bs56>
 <20210510082459.GA23639@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620637200;
        bh=ic1ye0C9NxUNck1kyu+xL9Tf6m1kS1mRdZMXl4Faefk=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=I1tsZSs2uEY0JymVsb4mOtBT2rexM+VDAs4IqB9zpTfXply+XPGR0vmknbJx36G/B
         iGm72X0fdnbUVwigCLNuUJeC/xKDzYvTwCV4pCkJWyv7PmuptrMPYc5/qkSnco31aN
         KFQWCUVcs9V43FyDhB7gO8dmh+x5vkl+Vmb3Aeno=
In-Reply-To: <20210510082459.GA23639@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org



regards Frank


> Gesendet: Montag, 10. Mai 2021 um 10:24 Uhr
> Von: "Pablo Neira Ayuso" <pablo@netfilter.org>
> An: "Frank Wunderlich" <frank-w@public-files.de>
> Cc: netfilter@vger.kernel.org
> Betreff: Re: Re: Re: Re: Re: Re: Re: Flowtable with ppp/bridge
>
> On Mon, May 10, 2021 at 08:50:56AM +0200, Frank Wunderlich wrote:

> > > Gesendet: Donnerstag, 06. Mai 2021 um 17:51 Uhr
> > > Von: "Pablo Neira Ayuso" <pablo@netfilter.org>
> >
> > > > >    chain FORWARD {
> > > > >         type filter hook forward priority 0; policy drop;
> > > > >
> > > > >         tcp flags syn tcp option maxseg size set rt mtu
> > > > >         ct state vmap { established : jump FORWARD_established, =
related : jump FORWARD_established, new : jump FORWARD_new }
> >
> > tried this way, seems to work so far, i have only problem on removing =
my ruleset with iptables (have this to reset my complete firewall, not onl=
y nft).
> >
> > iptables -X
> > iptables v1.8.2 (nf_tables):  CHAIN_USER_DEL failed (Device or resourc=
e busy): chain FORWARD_known
> >
> > i guess iptables cannot delete chain cause it is linked by ctstate vma=
p any idea?
>
> In iptables, you have to flush a chain (-F) before you can delete it.

i do this:

+ iptables -F
+ iptables -X
iptables v1.8.2 (nf_tables):  CHAIN_USER_DEL failed (Device or resource bu=
sy): chain FORWARD_known
+ iptables -t nat -F
+ iptables -t nat -X
+ iptables -t mangle -F
+ iptables -t mangle -X
+ iptables -P INPUT ACCEPT
+ iptables -P OUTPUT ACCEPT
+ iptables -P FORWARD ACCEPT

and

+ iptables-legacy -F
+ iptables-legacy -X
+ iptables-legacy -t nat -F
+ iptables-legacy -t nat -X
+ iptables-legacy -t mangle -F
+ iptables-legacy -t mangle -X
+ iptables-legacy -P INPUT ACCEPT
+ iptables-legacy -P OUTPUT ACCEPT
+ iptables-legacy -P FORWARD ACCEPT

same for ipv6 and then import my ruleset which contains the "flush ruleset=
" on top (after defines)

nft -f /usr/local/sbin/firewall/ruleset_new_v4+v6.nft

> Anyway, once you step in to use nftables, it is better if you use
> native nftables commands to operate, such as:

>  nft flush ruleset

i do this too, but running iptables before to make sure no legacy firewall=
 is defined which may block (to be able to switch to my old firewall scrip=
t for testing and back)

> > is order important of defined chains? maybe i can move the 2 new
> > forward-chains below old with "ct state vmap"
>
> Not sure what you mean, could you provide an example?

currently i have defined new forwarding chains first and then use them

table ip filter {
    flowtable f {
        hook ingress priority 10
        devices =3D { wan, lan0, lan1, lan2, lan3 }
        flags offload
    }

    chain FORWARD_known {
        ip protocol { tcp, udp } flow add @f
        accept
    }

    chain FORWARD_new {
        #rules for new forward connections
    }

    chain FORWARD {
        type filter hook forward priority 0; policy drop;
        oifname $ifexternal tcp flags syn tcp option maxseg size set 1452
        ct state vmap { established : jump FORWARD_known, related : jump F=
ORWARD_known, new : jump FORWARD_new }
        counter jump REJECTED
    }

    chain REJECTED {
        #limit rate 10/minute counter packets 0 bytes 0 log prefix "NETFIL=
TER4-REJECTED: " level debug
        ip protocol tcp reject with tcp reset comment "Drop with tcp-reset=
"
        ip protocol udp reject comment "drop and count packets"
        counter drop
    }
}

i see that i have rejected also used before defining it...so maybe it work=
s with the forwarding-chains too. basicly putting FORWARD_known and FORWAR=
D_new below FORWARD.

regards Frank
