From: "Ramsay, Lincoln" <Lincoln.Ramsay@digi.com>
Subject: cannot use != with ct status
Date: Wed, 14 Oct 2020 04:16:40 +0000
Message-ID: <CY4PR1001MB23116E94084D4CC5610C79C2E8050@CY4PR1001MB2311.namprd10.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKdICF93QsTo2G2+eyOCUBUbkKyv+leEAZD6ZMm8qjM=;
 b=VqLaxClJLYzcXkOprqtlxzFTLmspaSvoI+SGd2KfoYzEKnUWcMaq2rL9TYmnez8OecK0Bq6IP3qhml+aXE5jp5VC5eJlldV3Dgin9cbMWeg7ZStvgdNUia9CCKko5KJ4o1pMNvXv7RCd6/2CYS6G7OhfO1md1bPlSoU/edobnYs=
Content-Language: en-AU
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,=0A=
=0A=
I've just confirmed that I can't make a rule that matches ct status !=3D dn=
at.=0A=
=0A=
TL;DR I have to use ct status {expected,seen-reply,assured,confirmed,snat,d=
ying} instead. This feels like a bug.=0A=
=0A=
This page suggests using !=3D and also lists all the valid values (or at le=
ast, I hope that's all the valid values): https://wiki.nftables.org/wiki-nf=
tables/index.php/Quick_reference-nftables_in_10_minutes#Ct=0A=
=0A=
=0A=
=0A=
=0A=
I have a firewalld-created dnat rule.=0A=
=0A=
        chain nat_PRE_wan_allow {=0A=
                tcp dport 5007 dnat to xx.xx.xx.xx:7=0A=
        }=0A=
=0A=
There's a rule that sets a ct mark depending on the interface (so replies w=
ill correctly return, avoiding a problem with default routes).=0A=
=0A=
        chain PerIfRoute_Prerouting {=0A=
                ct state established,related ct direction reply meta mark s=
et ct mark=0A=
                iifname "wwan0" ct state new ct mark set 4=0A=
                iifname "wwan0" ct state new ct mark 4 meta mark set 4=0A=
                ct direction original meta mark set 0=0A=
        }=0A=
=0A=
I have a forwarding rule that wants to match ct status !=3D dnat.=0A=
=0A=
        chain PerIfRoute_Forward {=0A=
                ct status !=3D dnat ct mark !=3D 0 ct mark set 0=0A=
        }=0A=
=0A=
I turned on nftrace and see that this condition matches?!=0A=
=0A=
        trace id 04c0aaee ip firewalld nat_PRE_wan_allow packet: iif "wwan0=
" ip saddr xx.xx.xx.xx ip daddr xx.xx.xx.xx ip dscp cs0 ip ecn not-ect ip t=
tl 50 ip id 2777 ip length 60 tcp sport 20692 tcp dport 5007 tcp flags =3D=
=3D syn tcp window 64240=0A=
        trace id 04c0aaee ip firewalld nat_PRE_wan_allow rule tcp dport 500=
7 dnat to xx.xx.xx.xx:7 (verdict accept)=0A=
        trace id 04c0aaee inet PerIfRouteTable PerIfRoute_Prerouting packet=
: iif "wwan0" ip saddr xx.xx.xx.xx ip daddr xx.xx.xx.xx ip dscp cs0 ip ecn =
not-ect ip ttl 50 ip id 2777 ip protocol tcp ip length 60 tcp sport 20692 t=
cp dport 7 tcp flags =3D=3D syn tcp window 64240=0A=
        trace id 04c0aaee inet PerIfRouteTable PerIfRoute_Markers rule iifn=
ame "wwan0" ct state new ct mark set 0x00000004 (verdict continue)=0A=
        trace id 04c0aaee inet PerIfRouteTable PerIfRoute_Markers rule iifn=
ame "wwan0" ct state new ct mark 0x00000004 meta mark set 0x00000004 (verdi=
ct continue)=0A=
        trace id 04c0aaee inet PerIfRouteTable PerIfRoute_Prerouting rule c=
t direction original meta mark set 0x00000000 (verdict continue)=0A=
        trace id 04c0aaee inet PerIfRouteTable PerIfRoute_Forward packet: i=
if "wwan0" oif "net2" ip saddr xx.xx.xx.xx ip daddr xx.xx.xx.xx ip dscp cs0=
 ip ecn not-ect ip ttl 49 ip id 2777 ip protocol tcp ip length 60 tcp sport=
 20692 tcp dport 7 tcp flags =3D=3D syn tcp window 64240=0A=
        trace id 04c0aaee inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus !=3D dnat ct mark !=3D 0x00000000 ct mark set 0x00000000 (verdict con=
tinue)=0A=
=0A=
I did some tests...=0A=
=0A=
Positive matching works as expected=0A=
=0A=
        nft insert rule inet PerIfRouteTable PerIfRoute_Forward position 2 =
ct status ne expected nftrace set 1=0A=
        nft insert rule inet PerIfRouteTable PerIfRoute_Forward position 2 =
ct status ne seen-reply nftrace set 1=0A=
        nft insert rule inet PerIfRouteTable PerIfRoute_Forward position 2 =
ct status ne assured nftrace set 1=0A=
        nft insert rule inet PerIfRouteTable PerIfRoute_Forward position 2 =
ct status ne confirmed nftrace set 1=0A=
        nft insert rule inet PerIfRouteTable PerIfRoute_Forward position 2 =
ct status ne snat nftrace set 1=0A=
        nft insert rule inet PerIfRouteTable PerIfRoute_Forward position 2 =
ct status ne dnat nftrace set 1=0A=
        nft insert rule inet PerIfRouteTable PerIfRoute_Forward position 2 =
ct status ne dying nftrace set 1=0A=
=0A=
Gives=0A=
=0A=
        trace id 6bc7de6c inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus dnat meta nftrace set 1 (verdict continue)=0A=
=0A=
But the !=3D matching always matches=0A=
=0A=
        nft insert rule inet PerIfRouteTable PerIfRoute_Forward position 2 =
ct status !=3D expected nftrace set 1=0A=
        nft insert rule inet PerIfRouteTable PerIfRoute_Forward position 2 =
ct status !=3D seen-reply nftrace set 1=0A=
        nft insert rule inet PerIfRouteTable PerIfRoute_Forward position 2 =
ct status !=3D assured nftrace set 1=0A=
        nft insert rule inet PerIfRouteTable PerIfRoute_Forward position 2 =
ct status !=3D confirmed nftrace set 1=0A=
        nft insert rule inet PerIfRouteTable PerIfRoute_Forward position 2 =
ct status !=3D snat nftrace set 1=0A=
        nft insert rule inet PerIfRouteTable PerIfRoute_Forward position 2 =
ct status !=3D dnat nftrace set 1=0A=
        nft insert rule inet PerIfRouteTable PerIfRoute_Forward position 2 =
ct status !=3D dying nftrace set 1=0A=
=0A=
Gives=0A=
=0A=
        trace id 6bc7de6c inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus !=3D expected meta nftrace set 1 (verdict continue)=0A=
        trace id 6bc7de6c inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus !=3D seen-reply meta nftrace set 1 (verdict continue)=0A=
        trace id 6bc7de6c inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus !=3D assured meta nftrace set 1 (verdict continue)=0A=
        trace id 6bc7de6c inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus !=3D confirmed meta nftrace set 1 (verdict continue)=0A=
        trace id 6bc7de6c inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus !=3D snat meta nftrace set 1 (verdict continue)=0A=
        trace id 6bc7de6c inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus !=3D dnat meta nftrace set 1 (verdict continue)=0A=
        trace id 6bc7de6c inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus !=3D dying meta nftrace set 1 (verdict continue)=0A=
=0A=
If I rewrite my match to catch all the valid values, it works.=0A=
=0A=
        nft insert rule inet PerIfRouteTable PerIfRoute_Forward position 2 =
ct status '{expected,seen-reply,assured,confirmed,snat,dying}' nftrace set =
1=0A=
=0A=
This does not match when ct status =3D=3D dnat.=0A=
=0A=
=0A=
With all that debugging in, I saw a reply packet too. It ... complicates th=
ings?=0A=
=0A=
        trace id 2df38b4d inet PerIfRouteTable PerIfRoute_Forward packet: i=
if "net2" oif "wwan0" ether saddr xx:xx:xx:xx:xx:xx ether daddr xx:xx:xx:xx=
:xx:xx ip saddr xx.xx.xx.xx ip daddr xx.xx.xx.xx ip dscp cs0 ip ecn not-ect=
 ip ttl 63 ip id 0 ip protocol tcp ip length 60 tcp sport 7 tcp dport 57444=
 tcp flags =3D=3D 0x12 tcp window 28960=0A=
        trace id 2df38b4d inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus seen-reply meta nftrace set 1 (verdict continue)=0A=
        trace id 2df38b4d inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus confirmed meta nftrace set 1 (verdict continue)=0A=
        trace id 2df38b4d inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus snat meta nftrace set 1 (verdict continue)=0A=
        trace id 2df38b4d inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus dnat meta nftrace set 1 (verdict continue)=0A=
        trace id 2df38b4d inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus !=3D expected meta nftrace set 1 (verdict continue)=0A=
        trace id 2df38b4d inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus !=3D seen-reply meta nftrace set 1 (verdict continue)=0A=
        trace id 2df38b4d inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus !=3D assured meta nftrace set 1 (verdict continue)=0A=
        trace id 2df38b4d inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus !=3D confirmed meta nftrace set 1 (verdict continue)=0A=
        trace id 2df38b4d inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus !=3D snat meta nftrace set 1 (verdict continue)=0A=
        trace id 2df38b4d inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus !=3D dnat meta nftrace set 1 (verdict continue)=0A=
        trace id 2df38b4d inet PerIfRouteTable PerIfRoute_Forward rule ct s=
tatus !=3D dying meta nftrace set 1 (verdict continue)=0A=
=0A=
Matching multiple statuses?! I had a look and it seems ct status is a bitma=
sk underneath, not a single value.=0A=
=0A=
I guess the =3D operator is doing "is this value in the bitmask" logic? I d=
on't know what !=3D is doing, but I'd expect the "opposite" (ie. "is this v=
alue not in the bitmask").=0A=
=0A=
I'm using Yocto (Dunfell) which has given me these versions:=0A=
- Linux 5.4=0A=
- nftables 0.9.3=0A=
- libnftnl 1.1.5=0A=
=0A=
Lincoln=
