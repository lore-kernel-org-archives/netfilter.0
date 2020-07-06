From: Mike Dillinger <miked@softtalker.com>
Subject: nftables: Counters Not Working with Sets of Type Interval
Date: Sun, 5 Jul 2020 18:25:57 -0700
Message-ID: <f1324dfd-070c-1bda-0aad-22736f99ac55@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Recently, nftables added counters to sets.=A0 I've been using it and it wor=
ks fine with type ipv4_addr.=A0 However, I have a set with with type ipv4_a=
ddr and the interval flag is set.=A0 I then add CIDR's to the set but do no=
t see any counters when an IP address within the set interval range does so=
mething.=A0 This may be intentional with intervals though, meaning counters=
 intentionally don't work with intervals, but I thought I would check to co=
nfirm the intended implementation.

Thanks,
-MikeD
