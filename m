From: leroy christophe <christophe.leroy@c-s.fr>
Subject: Re: How are ct helper to be configured with NFT ?
Date: Fri, 05 Dec 2014 08:27:11 +0100
Message-ID: <54815E4F.10500@c-s.fr>
References: <54761724.9060201@c-s.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54761724.9060201@c-s.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>

Hi,

I still get the warning from the kernel

# tftp -g server -r test.c
[ 1359.853269] nf_conntrack: automatic helper assignment is deprecated=20
and it will be removed soon. Use the iptables CT target to attach=20
helpers instead.
test.c               100%=20
|**********************************************************************=
**|=20
804   0:00:00 ETA

# nft list ruleset
table ip filter {
         chain output {
                  type filter hook output priority 0;
                  udp dport tftp ct helper "tftp"
         }

         chain input {
                  type filter hook input priority 0;
                  oifname "lo" accept
                  ct state { established, related} accept
                  ct state new tcp dport ssh accept
                  ip protocol icmp accept
                  drop
         }

         chain forward {
                  type filter hook forward priority 0;
                  drop
         }
}

Can you help ?

Thanks
Christophe

Le 26/11/2014 19:08, leroy christophe a =E9crit :
> I need to do something equivalent to
>
>     iptables -t raw -A OUTPUT -p udp -d 192.168.2.1 --dport tftp -j C=
T=20
> --helper tftp
>
>
> I tried the following
>
> nft add rule filter output ct helper "tftp" udp dport tftp
>
> But it looks like it doesn't work, I still get.
>
> [ 1113.706274] nf_conntrack: automatic helper assignment is deprecate=
d=20
> and it will be removed soon. Use the iptables CT target to attach=20
> helpers instead.
>
> What is the correct syntaxe for that ?
>
> Christophe

