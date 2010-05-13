From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: Implementing IPSec in a linux bridge.
Date: Thu, 13 May 2010 22:41:48 +0000
Message-ID: <AANLkTilTKjQ3T_R2mUC64CbkLbCvTqU4EFic0EHpVjEj@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=kpBpYdshhOF34vjDuOfFqNR1jUAO04hgD4lvMmYc6pQ=;
        b=VEmLsAPPDLOPuZHKDjV3+EQwkMfOr+mZST+8n5YcuGV2PPyRlfWY7FimdhqNvvt2qs
         pmOPy1xae/RLvVrdMcwy/H3ZmYG2rYiwIXD1DfqOzqA+qmb8zbxil2D2T0cw0/sePXW0
         g8jf9RF7vXBqXqIjC6+cW5aSzV9z0Pij/TXEs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,
I have a linux box configured in bridge mode placed in each of my two agencies.
The two boxes are placed behind routers and play the role of passive firewalls.
Today my boss ask to configure the bridges to enable the two agencies
LANs to communicate via IPSEC. I wonder if there are specials
conditions to configure IPSec in a bridge.
could anyone  give me a HOWTO to configure IPSEC on my two linux box .
