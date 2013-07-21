From: Al Grant <bigal.nz@gmail.com>
Subject: SNAT rule on LAN - unexpected result
Date: Sun, 21 Jul 2013 20:51:42 +1200
Message-ID: <CAODtcdc7X8yJjihVcQomBNuuHGHPLebM2W9SGD_AA62fjwC-cg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=i4Gh7lEQvOz8CRPcfd0Kc2mN/ogQHyQy3k5/RtP1nQ8=;
        b=PgTbeT+xAx8b59XM7jeyLL5eVQu7d1LGiShQMyadAw6u5MaMMo62pl4QCKMOB3N7sl
         uh+QrhIVQYc5S47FA2lWaHeJeoDbmO/7ZTnLQpSad1zwB6DdTCErRt1aCcM8+3KpAQfP
         WoZd7yBRiUQrIRNXLJV1zwE2BtvnRq0Bh+WZfTy1Qa7yH9HgcRuagR0KO+XPQCEClBip
         evkvGhF1pZy+Hb+in1OItxsENUn1qec1VSmUvyLGfsW/htd+Dim/Yw/TMy5M43VhYVFR
         siKfMRLVMoWBiOZopqvS0zEqrF8JC5MfEwWe+rDjYURss+AKf2+vsQZ4Pji4U9Iv6uFh
         WSyw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi All,

Doing a little experimenting with iptables and more specifically SNAT.

I have two computers, a Ubunutu box and a Win7 box with a  switch between them.

On the Ubuntu box (192.168.15.200) I have added:

iptables -t nat -A POSTROUTING -o eth4 -j SNAT --to-source 192.168.15.201


Now I run wireshark on the Win7 machine and various bits of broadcast
traffic which was coming from .200 now shows as from .201 - great!

So I tried a ping from the Win7 machine and would expect a reply to
show in wireshark, but that the src address be changed to .201 - but
nope I get a reply from .200. How is this so?

Conversely a ping from the Ubuntu machine to the win7 machine shows
the packets with a src of .201 in wireshark - as expected.

Cheers in advance,

-Al


--
"Beat it punk!"
- Clint Eastwood
