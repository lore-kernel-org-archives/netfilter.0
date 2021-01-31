From: mikhalich123 <mikhalich123@gmail.com>
Subject: FTP behind NAT on a non-standard port
Date: Sun, 31 Jan 2021 19:09:17 +0300
Message-ID: <1158703871.20210131190917@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:message-id:disposition-notification-to:return-receipt-to
         :to:subject:mime-version:content-transfer-encoding;
        bh=HWTfUHBqj69QhZhbxPJQjg926fV9mmpDjbFeoDBalrs=;
        b=l5zcoHrTrRoguUysGYd+3v2czX0boNODsA16EO/lQ0KwxpKiTZ+DN2mTACX/mIVUM4
         XTvg0JrPedPs02SHdbmwpfyGP3W5h7MQWPWDW07BbtbFWkqqeLguE4EqPBuCTBcD4Xex
         c5bPTV0E9suxGIE6Zv4JyXgvBesFX7fj5EcizFHLd0QXWmSsvglukRtCMFhivio9NNgl
         DMfTTfWAIPKSnIjt6+UGNyXAefql6FZV708DJw2ZS6BWnzXwUPvKvBuj0vGGeQSAkWKi
         Kjt1tk5Yzr+ADqU/htrE9+OGbdtcdSkIfbItv/WmD4hGNcd6EIZZR6bnR8u2RL7AMLoj
         f8bQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello

Gateway to Debian 7.11 (3.2.0-4-686-pae), iptables v1.4.14.

external interface ip: 1.1.1.1

internal interface ip: 192.168.1.1

An ftp server works inside the local network, for which you need to organiz=
e access from the outside.

ip ftp server on the internal network: 192.168.1.55

Port of ftp server on internal network: 51

Lsmod output | grep ftp

nf_nat_ftp 12 420 0
nf_conntrack_ftp 12533 =E2=80=8B=E2=80=8B2 nf_nat_ftp
nf_nat 17913 2 iptable_nat, nf_nat_ftp
nf_conntrack 43121 9 nf_conntrack_ipv4, nf_nat, iptable_nat, xt_conntrack, =
xt_state, nf_conntrack_ftp, nf_nat_ftp, xt_CT, nf_conntrack_netlink

It doesn't work like this:

iptables -t raw -A PREROUTING --dst 1.1.1.1 -p tcp --dport 55555 -j CT --he=
lper ftp
iptables -t nat -A PREROUTING -i ext --dst 1.1.1.1 -p tcp --dport 55555 -j =
DNAT --to-destination 192.168.1.55:51

The control connection opens, but there is no data flow. conntrack -E expec=
t shows nothing.

If we change so that the ftp server port is standard (ftp server settings a=
nd iptables settings), then everything works:

iptables -t nat -A PREROUTING -i ext --dst 1.1.1.1 -p tcp --dport 55555 -j =
DNAT --to-destination 192.168.1.55:21

Please tell me what settings are needed to make available an ftp server run=
ning on a non-standard port?


