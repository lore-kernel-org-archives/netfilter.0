From: Mike Dillinger <miked@softtalker.com>
Subject: Re: nftables: Allow NAT Access with Timeout
Date: Sat, 25 Jan 2020 17:16:55 -0800
Message-ID: <d32d03a1-2408-9508-1246-740f9c953389@softtalker.com>
References: <d44f6c86-27bf-aff5-4251-b1cbf06de174@softtalker.com>
 <2b67148e-84df-9bba-f3fc-0184d7e67df4@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2b67148e-84df-9bba-f3fc-0184d7e67df4@plushkava.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: kfm@plushkava.net, netfilter@vger.kernel.org

| Concatenations allow for set elements to be of a composite data type.

| type ipv4_addr . inet_service . inet_service


Thank you for that starting point.

I was able to create the set just fine:
$ nft add set ip filter temp4-allowed {type ipv4_addr . inet_service . inet=
_service \; timeout 4h \;}

...and then I was able to figure out how to add an element:
$ nft add element filter temp4-allowed {192.168.1.1 . 23152 . 23152}

...and checking the set itself looks good:
$ nft list ruleset | command grep --after-context 4 temp4-allowed
 =A0=A0=A0=A0=A0=A0=A0 set temp4-allowed {
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type ipv4_addr . inet_servic=
e . inet_service
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 timeout 4h
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 elements =3D { 192.168.1.1 .=
 23152 . 23152 expires 3h53m48s968ms }
 =A0=A0=A0=A0=A0=A0=A0 }

In this particular example, sport and dport are equal but they may not alwa=
ys be equal.

I'm struggling to figure out how to add a rule in the nat table. How do we =
know which inet_service occurrence is sport and which is dport?=A0 Could yo=
u also please give an example of nat rule that would check temp4-allowed an=
d direct the traffic according to the set entry?

The basic rule looks like this:
# XXXXX=3DLAN dest IP
# YYYYY=3DWAN dport
# ZZZZZ=3DLAN dport
nft add rule nat prerouting iifname "eth0" tcp dport YYYYY dnat XXXXX:ZZZZZ

...but not sure what the rule structure looks like when referencing a set.=
=A0 I am not finding any examples online.

Reminder: nftables 0.9.3 on Debian 10 running kernel 5.4.0-3-amd64.

Thank you for the help!
-MikeD
