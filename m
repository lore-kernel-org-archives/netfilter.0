From: =?ISO-8859-2?B?SnVyYWogR2Fi6O1r?= <juraj.gabcik@gmail.com>
Subject: Fwd: nftables
Date: Fri, 29 Apr 2011 11:33:38 +0200
Message-ID: <BANLkTik1LTarzTzAm_9OuD8XkhsXcpVCZg@mail.gmail.com>
References: <BANLkTikT_ETuEE2e7Khip9xJKFiDgBe7Qg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type:content-transfer-encoding;
        bh=DOEvVnY1D+pa5c15MagjtD0iPDFzQd1HQtMLX0j5ATo=;
        b=Bt+z9XZ8m3vk/MUI/mYmRE7VH5ql1SSNhWiuis14MNFsYbKBYJhGIHwlJ72y6ct+eG
         2YrvPG+mdat8VfmAAeqlDTpNGVC6fiuw0YKBmUNK6T3CrcMkU/i7y5zwGfRQ5j9eS1Cj
         XzEU04CR2B+Xv+2n04iLqJ2Klux+8EFmDE+Qc=
In-Reply-To: <BANLkTikT_ETuEE2e7Khip9xJKFiDgBe7Qg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi people!

=46irst, I would like to introduce myself to you. My name is Juraj
Gab=E8=EDk and I am a student at the Faculty of Informatics at the
University of =AEilina, Slovakia. My reason for writing to you is that =
I
would like to ask you for a favour. Now I am writing my bachelor's
theses about nftables and I  would be grateful to you for some
information I need concerning this issue. I found something on the
internet but it wasn't enough.

I am interested in the background of the processing of packet after
it's received by NIC: what queues it passes, where the rules can be
applied etc. Neither I could find any information about whether
nftables have the same structure of classes INPUT, OUTPUT and FORWARD
as iptables.

I need to compare the efficiency of the firewall created by iptables
and nftables and I would be very grateful if you could explain to me
the main differences between the processing of packet by means of
iptables and nftables. Also a demonstration of some rules written by
means of iptables and nftables (rules of the same meaning in both
cases) would be very helpful.

How to compile kernel supporting nftables?

If you would come up with something more that would help me or that
would be useful for my theses I would highly appreciate it. As I have
already mentioned, I am mainly concerned about the information related
to the background of the processing of the packet and the comparison
of the efficiency of iptables and nftables.

Hope to hear from you soon,

Juraj Gab=E8=EDk
