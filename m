From: "Yoann JUET" <yoann.juet@univ-nantes.fr>
Subject: ipset - bitmap:ip,mac kernel crashes, errors
Date: Thu, 11 Apr 2013 16:39:31 +0200 (CEST)
Message-ID: <7a05d31eedfbe24e7ebf47c00df77176.squirrel@webmail.univ-nantes.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi all,

We are experiencing crashes with ipset (6.12) on a debian/wheezy with
default kernel image (3.2.0). Using the bitmap:ip,mac set type + timeou=
t
support (all is ok without timeout support) triggers the problem
systematically. A kernel panic occurs after issuing command 'ipset list=
'
(sometimes a couple of times) when the total number of entries within a
set exceeds a limit - 101 in my case -.

A recent kernel (tested on 3.8.6) improves the situation. No more crash=
es,
but it's still impossible to output all entries. We get a Kernel error:

- With the default debian ipset version:
ipset v6.12.1: Kernel error received: No buffer space available

- And the last version:
ipset v6.17: Kernel error received: No buffer space available

I've seen on this list discussions about crashes, then a bug fix on
version 6.15. Some have experienced the same kernel error but no
workaround seems to be available. We are using the bitmap:ip,mac set ty=
pe
on several captive portal servers. 'ipset list' command is a convenient
way for us to check for active users. Ideas to fix this problem ?

Thanks in advance,
Best regards,
Yoann.

--=20
Universit=E9 de Nantes - Direction des Syst=E8mes d'Information
IM jabber: yoann.juet@univ-nantes.fr

