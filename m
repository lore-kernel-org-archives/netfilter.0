From: "Jonothan Kane" <jonothan.kane@gmail.com>
Subject: Kernel 2.6.21: 802.3 frames not hitting netfilter filter table FORWARD chain
Date: Tue, 2 Dec 2008 14:37:56 -0800
Message-ID: <217983a50812021437s415bbba9jea2f8ce70edd5e1a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=znBKnGaz7TrN2lq//I+B2QSjb9Op9po6ue50lr/w+YI=;
        b=W+HFsMy18TLLwPUHopIBO1PfS0QjG3FQc+HlaEpqNoV8MQ14zgHhy3D7b0MFve0+kT
         /l7hEzHYcu3d5KZGxGS92RKcnsAB9ud3c6ydlVOeufGsWAhe5HN17EGYkjqT170xtdOV
         yZvRRR/gCFgUqdOgr4Q44aRhg4zl2+e/UjzOU=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hey all;

I've got some old gear on a network with a couple of Linux transparent
bridge firewalls protecting the network.
For the regular Ethernet II frames the filtering in the netfilter
filter table FORWARD chain works well.

All old style 802.3 frames hit the ebtables  tables but not the
netfilter filter table FORWARD chain.
The 802.3 frames are carrying IP datagrams.  Is there a trick to get
them into the FORWARD chain ?
preferably without changing the bridging firewalls to routing firewalls.

Thanks for any info.

J Kane.
