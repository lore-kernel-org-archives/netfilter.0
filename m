From: Pandu Poluan <pandu@poluan.info>
Subject: Problems with xtables-addons 1.3.7 on Gentoo
Date: Fri, 5 Aug 2011 20:19:33 +0700
Message-ID: <CAA2qdGWwQC7G-YR=onrUBVAOEG1yrM8Ambr3m5JxvEOPjj1c+A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

I'm having troubles with xtables-addons 1.3.7 on Gentoo.

I successfully installed xtables-addons (no errors), but all attempts
to create an IP set (e.g., `ipset --create test hash:ip`) resulted in
the following error message:

=46ATAL: Error inserting ip_set
(/lib/modules/2.6.39-hardened-r8PANS_GW_BN_02/xtables_addons/ip_set.ko)=
:
Invalid module format

`insmod` begat an additional information:

insmod: error inserting
'/lib/modules/2.6.39-hardened-r8PANS_GW_BN_02/xtables_addons/ip_set.ko'=
:
-1 Invalid module format

`dmesg | tail -1` gave a worrying error:

[ 4085.271442] ip_set: exports duplicate symbol ip_set_nfnl_put (owned
by kernel)

What should I do?

Rgds,
--=20
Pandu E Poluan
~ IT Optimizer ~

=C2=A0=E2=80=A2 Blog : http://pepoluan.tumblr.com
=C2=A0=E2=80=A2 Linked-In : http://id.linkedin.com/in/pepoluan
