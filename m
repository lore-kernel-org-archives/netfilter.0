From: Mallika Gautam <mallika.gautam@gmail.com>
Subject: VLAN insertion/deletion using ebtables
Date: Fri, 17 Jul 2009 09:31:24 +0100
Message-ID: <9041a1390907170131u1297a8b2q72992414596387ec@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:from:date:message-id
         :subject:to:content-type:content-transfer-encoding;
        bh=wT+RXAhyR2/jqrjbGO/x690HU7HNJ9+YgdZc51M/Sco=;
        b=hSwnCpi/rxzvFz7/GlX1521XCaMwpTpXvof/+yphK5w3YBtXGK/mQdiWArJ0Cqsug4
         uuWAy3RyNBg70OpRJ6JttbpPxS4ACzkehQuC8cAlQL+QFHNS4afY0/+Vplr4AccAzR2a
         xnMXen1g2/BYJU1iYtG50oeqjU+LPNSuN0x1c=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hi,

I am working on a requirement which needs VLAN insertion in frames
received on the device and deletion from the frames leaving the
device. Basically want to support PVID kind of requirement on the
device. Before adding a new extension, I want to find if some one
already has added such an extension. Any pointers would be of help.

Thanks.
Mallika
