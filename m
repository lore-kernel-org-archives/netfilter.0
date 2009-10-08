From: Zhen Lin <lowzhenlin@gmail.com>
Subject: Forwarding link-local frames in a bridge
Date: Thu, 8 Oct 2009 07:51:57 +0100
Message-ID: <54a97b770910072351wa70332apa53e4ae91fc27322@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=lCi7BtzakqkutRlqqK6LtSZBWKapma4CSWTJ8mK6pnM=;
        b=c9bz0wVoRcDIYmTB5m9HzQOit/2zopq2b+4/l4zsbocvNr9xsZ331Zw129XdA5ajww
         eVaUdGloTwwc/jwT9mE5BNXgCZoWaHVgOeyVi2BB9xZfsy6MdL/UyH4NJYjeqrRqo00Z
         iu2OJY1I/HjFziK4AZWRMACXPWMOv+C8Dpai8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

I would like to know if it is possible to use ebtables to override the
kernel policy of dropping link-local frames from bridging. In
particular, I am interested in forwarding 802.1X EAPOL frames being
sent to 01:80:c2:00:00:05. At the moment, I hacked the kernel to do
this, but I would prefer to use a preexisting solution, if one exists.

--- linux/net/bridge/br_input.c.orig	2009-10-08 08:52:13.000000000 +010=
0
+++ linux/net/bridge/br_input.c	2009-10-07 23:30:41.000000000 +0100
@@ -138,6 +138,9 @@
 		if (p->br->stp_enabled =3D=3D BR_NO_STP && dest[5] =3D=3D 0)
 			goto forward;

+		if (dest[5] =3D=3D 3)
+			goto forward;
+
 		if (NF_HOOK(PF_BRIDGE, NF_BR_LOCAL_IN, skb, skb->dev,
 			    NULL, br_handle_local_finish))
 			return NULL;	/* frame consumed by filter */


I guess that what I need to do is to put a rule on frames with
destination 01:80:c2:00:00:03 in the INPUT chain, but what action
should I set for the rule? Na=EFvely, I tried jumping to FORWARD, but
that doesn't seem to be allowed.

Thank you,
--=20
Zhen Lin
