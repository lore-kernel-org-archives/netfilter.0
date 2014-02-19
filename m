From: =?UTF-8?Q?Csord=C3=A1s_Csaba_Ifj=2E?= <cscsordas@gmail.com>
Subject: nf_conntrack_helper=0 module parameter together with nf_nat_ftp module
Date: Wed, 19 Feb 2014 21:10:06 +0100
Message-ID: <CABpXQ7aSYv+eoNx8gGSyLAaMHpxFD_EP=-vEByaD4KQoHk74Qg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=wFW3ysz1eAA4fiD++U8JRvk5YHvZ++6/nw7pP4UjZbw=;
        b=XEwk0Eoo2M29bbZ66JvjaoNZFrGT2nrkHM4h97g4KVD1JmLsXg2xt80kEcoEdL9S+p
         HmjyP4uuH3o7falw+TnIvzKvs1GPcywPWBCFat2voluVrKzQ8I/ONlT89woED15WctAO
         0R4ARjes+ZOeBTx0yrL6LBMR6hQAklHfqt9POYtUffP8hkq/DIIV6UFNGDz5PcM6oW5q
         Y1xZsmB5dMsYZuYExJMR7gHyeQti6GAYUHqk8EA5cf5IqxjUgnmfa48SJ3mxxO6QcfH5
         cfgqnHT6ORB28kRi3ulKqOjAxrr/VW6sWx9/6LyKQ5Cb2SBPUon2IR4WHTKa2qXx4BeA
         b4lg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi List,

When I load nf_conntrack with

modprobe --first-time nf_conntrack nf_conntrack_helper=0

as described in the document "Secure use of iptables and connection
tracking helpers" and use the CT target in the raw table to attach the
ftp helper to specific flows then everything is working when the
corresponding firewalls are either on the client side or on the server
side AND they are directly connected. But, when there is a gateway
between them which is performing SNAT then active ftp works only when
nf_conntrack is loaded without the module parameter mentioned in
$SUBJECT. There is no filtering on the gw. To be more precise the
problem is that the server is considering the client's PORT command as
ILLEGAL, because it contains the client's own IP address. Seems like
that nf_nat_ftp is not triggered in this case.
Is there a way to get it working using -j CT somewhere on the gateway
also? nf_nat_ftp also does not accept the "ports" parameter since
2.6.10. My kernel version is 3.11.
