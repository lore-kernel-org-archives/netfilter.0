From: Martin <mylists@itcom.com.ar>
Subject: ip_conntrack vs. nf_conntrack
Date: Tue, 13 May 2008 11:24:46 -0300
Message-ID: <1210688686.2956.69.camel@kr0sty.1.com.ar>
Reply-To: mylists@itcom.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi to all.

I've some doubts in what changes have been done to conntrack modules,
but can't find some info about.

Here is my situation:

I use to have a 2.6.18 kernel with some patches, including POM and
netfilter ones. The modules I insmod are ip_conntrack_ftp,
ip_conntrack_irc, ip_conntrack_tftp, ip_conntrack_amanda and
ip_conntrack_sip.

Asking around, have finally find that to get patches on mainstream, som=
e
names've changed and some code have been modified =C2=BFis that right?
Anyway, there aren't nf_conntrack_amanda, nf_conntrack_irc, etc. =C2=BF=
are
there available by now, or need some extra patches or something else?


Thanks in advance, hope someone can give me some light here...


Martin

