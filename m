From: =?UTF-8?Q?Niko_Kortstr=C3=B6m?= <niko.kortstrom@gmail.com>
Subject: Fwd: IP daddr filtering not working for non-routable address
Date: Wed, 1 Sep 2021 10:40:06 +0300
Message-ID: <CADjU3LkCskd4XSEWKX_WzWbwMmhd6hPhLT+zqGDE_-Ubch4V2Q@mail.gmail.com>
References: <CADjU3LmddfsRShNVx-hArmivM=iUGvEFg28Gd90qyg7VRGqvbw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=hCTW/F1KXkmBaq70zWDajHV01ot5TBLzgV8yI3YhKdg=;
        b=PJuq7h5b1yA8Quxf7qgjM5LUyiNES7EecX0IMfN8amecFeucHakeplWSwCJHL9jsYl
         1LleKDl1Cu44WGfl39TfohK6lER+Iie5J4sm/mU14g0h0GqQ4F2LrAtNkwoQFx9fMVcV
         4I9k+0gyoR42hngV2Bk9x0zK/oIMG8SRoC8azeUz1LXnUprZ9qWigld4vKiCmYTWrXPM
         HG4eIx+YP+IEWNK8YiZ21v0/qOVS1I4a+StIOP8CRBaohuJOdhhL/vqUVAL5BbELlN12
         CHm3lBs5i0E5aL3QV2+Qz1jTqZh2dFk1bdx1JmEhiuOl8Eo8yE3mmbhoktb9lvrulwZ9
         ExAA==
In-Reply-To: <CADjU3LmddfsRShNVx-hArmivM=iUGvEFg28Gd90qyg7VRGqvbw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

Hi!

We are testing following nftables rules (counters added for debugging purpo=
ses):

chain forward {
    type filter hook forward priority filter - 1; policy drop;
    jump ecpri-ip-filtering
}
chain filtering-logging {
    counter packets 0 bytes 0 drop
}
chain ip-filtering {
    iifname "rfo*" counter packets 835 bytes 615040
    iifname "rfo*" ip daddr 172.21.1.18 accept
    iifname "rfo*" counter packets 0 bytes 0
    iifname "gre11E" accept
    iifname "rfo*" counter packets 0 bytes 0
    iifname "lo" accept
    iifname "rfo*" counter packets 0 bytes 0
    goto filtering-logging
}

We are sending test packets from a neighbouring host to an IP address
that cannot be routed on this host.
# tcpdump -i rfoe4.295
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on rfoe4.295, link-type EN10MB (Ethernet), capture size 262144 by=
tes
09:34:42.657004 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 733
09:34:43.975378 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 325
09:34:44.046110 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 113
09:34:44.187158 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 106
09:34:44.428949 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 347
09:34:44.854991 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 130
09:34:45.284802 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 101
09:34:45.446108 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 733
09:34:46.537990 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 269
09:34:46.572270 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 269
09:34:46.602943 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 269
09:34:46.673617 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 325
09:34:46.754555 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 113

Why are these packets being accepted as daddr matches?


Niko Kortstr=C3=B6m
