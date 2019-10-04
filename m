From: Jags <TheJags@protonmail.com>
Subject: Re: How can I block all traffic from an IP range, irrespective of origin, going to, or coming from, using nftables in Debian 10
Date: Fri, 04 Oct 2019 21:27:35 +0000
Message-ID: <n7djq_N8Jh_MybA6HGeMb9ReRtaEDkC-IpyqH-R6ls4PB1OnvdrIdOZF5Xdr6uiQQWrpkhtN-M-TnrR8JwCXv2BrbhgeO9-rlmiCPK_SPpw=@protonmail.com>
References: <f9f3c860-5b3f-a09a-ff25-375378c3715b@trustiosity.com>
 <lqTerZeIk1-StNEHFttel8WGdgNfa6b5P96z7iC6sT03SK29Q1_hc4KUlqd3R4f8Hdka3B_MJfQILp1Wa65JpA_cW7k2XGZtvfaN5ADlBzY=@protonmail.com>
 <4348ae9d-ac32-2a25-f188-ba1757e03271@thelounge.net>
 <vxVQ_geC0de-PtRw-_W5p_JxT_glE2c_vRrkTcbIyulovhi-WTjSDhII4UsugyF1dViXu9mwHZisBtvv98qmciBLttLUpfrRGFL2HG6AyNE=@protonmail.com>
 <31342b0f-d6a7-15e7-3d02-212d41eaeaad@thelounge.net>
 <aRv1y9lFu7DB0mnYvmBI-qbIv-tsBzoGbAXa3gqQHk11fz87s6KlhVYLv_q9fiMeB9d14NIa2n1QeG6c2FMrF2o92vvkSKpgZMtApOpRT5Q=@protonmail.com>
 <4fc65dba-dff0-4075-6ead-c63cd52efb36@thelounge.net>
 <gqJSE9iGsixrV5lbpV2VVj_N-pdkB59YlfOJlH-VsKhUYHsgXJ2MlY62LPso375cRc0k2X4tXD7744rB6UYKqeJGA-KB6AmpqnBpvlvsmTE=@protonmail.com>
 <20191004203027.pgx7zvx2dogcp3lm@nisshoku>
Reply-To: Jags <TheJags@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1570224459;
        bh=u6iLvK8YwXwl30lj6RGE/iJKjwBWyb1pjQ7NDAYvpu4=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=JMgIr3yONqUnfH67vSH8Tt3wpBQEwEG64VJ2BFMIhgUOa/oL1p1fLzvbB9yAFI30r
         tx/XaJ6bGOfRGrBneWjKkDwwHXKl0xG0ARZaXrpooIdIb7KnOpfOCD4fmbgdqmAh+Q
         O0jxdUEzb++HwDJPdL0Cueq3xC/i40m9oV22YeEs=
In-Reply-To: <20191004203027.pgx7zvx2dogcp3lm@nisshoku>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Anton Rieger <rieger@jikken.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

@Anton Rieger, thank you so much.



(1)
> You have to add at least one chain with the priority ``raw''.
> So to match iptables:

This is the answer I was looking for.


Note-1: If anyone reading this who could edit Nftables wiki, needs to highl=
ight this.

http://wiki.nftables.org/wiki-nftables/index.php/Mangle_packet_header_field=
s

I came across this page earlier and saw "-300" but the page didn't mention =
THE importance of "priority -300"


Note-2: In regards to command syntaxes on Nftables wiki: Following is just =
one example, but it almost applies everywhere on Nftables wiki pages. The f=
ollowing example will display an error:

From this page: http://wiki.nftables.org/wiki-nftables/index.php/Mangle_pac=
ket_header_fields

nft add chain raw prerouting {type filter hook prerouting priority -300\;}

While I think, what it should be (at least when run in Bash on Debian/Ubunt=
u):

nft add chain raw prerouting '{ type filter hook prerouting priority -300; =
}'

I figured this difference out a while ago from Arch wiki page:

https://wiki.archlinux.org/index.php/Nftables#Base_chain



(2)
AFTER reading your mail, I have modified the PRIORITY to -300, for "raw" ta=
ble:

table inet raw {
        chain prerouting {
                type filter hook prerouting priority -300; policy accept;
                ip saddr 123.0.0.0/8 counter drop
        }
        chain output {
                type filter hook output priority -300; policy accept;
                 ip daddr 123.0.0.0/8 counter reject
        }
}


(3)
Just before I read your mail, I found these pages:

(a) https://wiki.nftables.org/wiki-nftables/index.php/Nftables_families#net=
dev

I found this very interesting: "This family provides the ingress hook,
that allows you to classify packets that the driver has just passed up to t=
he networking stack."

(b) In regards to INGRESS hook: https://wiki.nftables.org/wiki-nftables/ind=
ex.php/Netfilter_hooks

(c) "Mandatory to specify the device where the chain will be attached":
https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Adding=
_base_chains

So I have added this "devfilter" table:


table netdev devfilter {
        chain ingress {
                type filter hook ingress device wlx98ded00b03a5 priority -4=
00; policy accept;
                ip saddr 123.0.0.0/8 counter drop
       }
}


Now I think with "netdev/ingress", there's no need for prerouting  within "=
raw" table,
as the new ingress hook comes before prerouting (as per Nftables wiki). But=
 I've kept it there for now.


I truly thank you all...





=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Friday, October 4, 2019 8:30 PM, Anton Rieger <rieger@jikken.de> wrote:

> > Could someone please clarify RAW/MANGLE tables in regards to Nftables.
>
> Short story short:
> They doesn't exist anymore, but you can change priorities to simulate the=
m.
>
> Long answer:
> A table in nftables is identified by:
> 1) Their name
> 2) Their addressees family is one of ip, ip6, inet, arp, bridge, netdev (=
inet is ip+ip6)
> Currently only the `dormant'' flag is supported meaning the table is not =
evaluated any more A table is a container for chains. A chain is a containe=
r for rules. There are two types of chains: 1) base chain 2) regular chain =
A base chain must specify a`type'', `hook'' and`priority''.
> They need them, as these chains are entry points of packets from the netw=
ork stack.
> You can use these to reconstruct the predefined iptables chains by naming=
 them the same.
>
> Each type is bound to certain families hooks:
> filter) Standard type can be used everywhere.
> nat) Must be ip, ip6 or inet and provide prerouting, input, output, postr=
outing hooks
> Performs NAT based on conntrack entries.
> Only first packet of a connection traverses this chain.
> Specify conntrack details here.
> route) Must be ip or ip6 and only provides the output hook.
> If accepted and IP header changes a new route lookup is performed.
> Use this to e.g. implement policy routing selectors.
>
> Quirks:
> netdev needs filter and ingress hook and device parameter is mandatory.
> arp only supports input/output hooks.
>
> So you can see, that the most used type is filter.
> To order with chain gets triggered in which order is determined by the pr=
iority parameter.
> This can either be a signed integer (lower values have precedence) or sta=
ndard priority names.
> These standard priority names are labeled to match xtables default values=
:
>
> raw :=3D -300 (ip,ip6,inet) all hooks
> mangle :=3D -150 (ip,ip6,inet) all hooks
> dstnat :=3D -100 (ip,ip6,inet) prerouting
> filter :=3D 0 (ip,ip6,inet,arp,netdev) all hooks
> security :=3D 50 (ip,ip6,inet) all hooks
> srcnat :=3D 100 (ip,ip6,inet) postrouting
>
> Please note, the ``bridge'' family has different values for dstnat,filter=
,out,scrnat
> You can also use addition/subtraction in your definitions.
> So their order is basically the same.
> All this information is well documented in nft(8)
>
> > Currently there are 5 different families of tables: ip, ip6, arp, bridg=
e, inet
>
> Should be updated to include the ``netdev'' family (for ingress handling)
>
> > My question is, since Nftables doesn't have predefined tables, just by =
naming a table:
> > "table inet raw", does it becomes a RAW table or not?
>
> It is NOT implicitly a raw table in the iptables sense. It's just a table=
 matching ip or
> ip6 family packets.
>
> > If not, what do I have to do?
>
> You have to add at least one chain with the priority ``raw''.
> So to match iptables:
>
>     table inet raw {
>         chain PREROUTING {
>             type filter hook prerouting priority raw; policy accepted;
>         }
>
>         chain OUTPUT {
>             type filter hook output priority raw; policy accepted;
>         }
>     }
>
>
> Please note that ``policy accept'' is the default choice thus defining it=
 here
> is just for better understanding.
>
> > For now I have added this to my nftables.conf
> > xxxxx
> > table inet raw {
> > chain prerouting {
> > type filter hook prerouting priority 0; policy accept;
> > ip saddr 123.0.0.0/8 counter drop
> > }
> > chain output {
> > type filter hook output priority 0; policy accept;
> > ip daddr 123.0.0.0/8 counter reject
> > }
> > }
> > xxxxx
>
> Please note a priority of 0 is equal to ``filter''.


