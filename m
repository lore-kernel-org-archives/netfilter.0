From: Pandu Poluan <pandu@poluan.info>
Subject: ERROR: iptables v1.4.12: u32: option "--u32" cannot be inverted.
Date: Mon, 15 Aug 2011 21:12:33 +0700
Message-ID: <CAA2qdGUgvpfyX9Xw1tvs95HanqrjjeO-okDDeiucrRQCZZo=8A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

What's wrong with my command here:

    iptables -A rq_icmp -m u32 ! --u32 0x4&0x3fff=3D0x0  -m comment
--comment "Fragmented" -g rq_drop_icmpattack

it works without problem on Ubuntu 10.04, why won't it work with
Gentoo? I keep getting the error:

    iptables v1.4.12: u32: option "--u32" cannot be inverted.

Rgds,
--=20
=46dS Pandu E Poluan
~ IT Optimizer ~

=C2=A0=E2=80=A2 Blog : http://pepoluan.tumblr.com
=C2=A0=E2=80=A2 Linked-In : http://id.linkedin.com/in/pepoluan
