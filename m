From: James Lay <jlay@slave-tothe-box.net>
Subject: Match strings with periods
Date: Tue, 03 May 2011 17:46:19 -0600
Message-ID: <C9E5EFEB.72C2%jlay@slave-tothe-box.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Netfilter <netfilter@vger.kernel.org>

Hey all!

So=8Ahere's what I have:

LOG        udp  --  *      *       10.0.0.1            0.0.0.0/0
STRING match "myspace" ALGO name bm TO 65535 LOG flags 0 level 4 prefix
`Myspace '=20
DROP       udp  --  *      *       10.0.0.1            0.0.0.0/0
STRING match "myspace" ALGO name bm TO 65535
LOG        udp  --  *      *       10.0.0.1           0.0.0.0/0
STRING match ".cc" ALGO name bm TO 65535 LOG flags 0 level 4 prefix `cc=
 '
DROP       udp  --  *      *       10.0.0.1            0.0.0.0/0
STRING match ".cc" ALGO name bm TO 65535


Been trying to nuke DNS resolution for a couple domains.  The myspace
match works like a champ=8Acan't resolve when I dig myspace.com.  The c=
c one
doesn't seem to work, and I suspect it's because of the . in the string=
=2E
I can't just match "cc", or else any domain name with a cc in it would
fail, so I'm attempting to match ".cc".  I tried different methods
(--hex-string "|2e|cc") but nothing seems to match.  Does anyone have a=
ny
hints on how to get this to work?  Thanks all!

James


