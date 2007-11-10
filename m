From: Stefano Sabatini <stefano.sabatini-lala@poste.it>
Subject: Re: ipt_random status
Date: Sat, 10 Nov 2007 18:13:24 +0100
Message-ID: <20071110171324.GC8300@geppetto>
References: <20071105150734.GA26774@santefisi.caos.org> <472F405D.9030803@plouf.fr.eu.org> <20071105093255.GA10259@santefisi.caos.org> <4730877C.9080102@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="K8nIJk4ghYZn606h"
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4730877C.9080102@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Netfilter users mailing list <netfilter@vger.kernel.org>


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On date Tuesday 2007-11-06 16:25:48 +0100, Pascal Hambourg wrote:
> Stefano Sabatini a =E9crit :
>> iptables -m statistic --help
>> Shouldn't it be mentioned in the iptables man page?
>
> Yes, it should. Patches are welcome.

Here it is.
Can someone forward it to the devels?

>> http://ovid.rdsct.ro/log/modules/index
>
> I can understand the author. Changes in Netfilter/iptables may be difficu=
lt=20
> to track, so I wrote for myself a sort of changelog.

Best regards.
--=20
Stefano Sabatini
Linux user number 337176 (see http://counter.li.org)

--K8nIJk4ghYZn606h
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="document-xtstatistic.patch"

Index: extensions/libxt_statistic.man
===================================================================
--- extensions/libxt_statistic.man	(revision 0)
+++ extensions/libxt_statistic.man	(revision 0)
@@ -0,0 +1,30 @@
+This module matches packets based on some statistic condition.
+It supports two distinct modes settable with the 
+.B --mode
+option.
+.TP
+Supported options:
+.TP
+.BI "--mode " "mode"
+Set the matching mode of the matching rule, supported modes are
+.B random
+or
+.B nth. 
+.TP
+.BI "--probability " "p"
+Set the probability from 0 to 1 for a packet to be randomly
+matched. It works only with the
+.B random
+mode.
+.TP
+.BI "--every " "n"
+Match one packet every nth packet. It works only with the
+.B nth
+mode (see also the 
+.B --packet
+option).
+.TP
+.BI "--packet " "p"
+Set the initial counter value (0 <= p <= n-1, default 0) for the
+.B nth 
+mode.

--K8nIJk4ghYZn606h--
