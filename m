From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 00/00] Remove deprecated items from Makefiles
Date: Sun, 21 Nov 2010 20:03:11 -0500
Message-ID: <1290387808-2239-1-git-send-email-tdent48227@gmail.com>
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=eAR7UVs4cbC2JFf+Y1CHBlCtj+sPD70a8XRCf6hDmNY=;
        b=HF0eIKPtDLDQZFis0Vextgl7c+RSVej3OJrfNyIwAH25ZADVV7Qpm5alJW9/R2i87G
         qmdO+x6kdbklSdUoiCeGFM9/KV4e5xAzEWjmrckLjEZUGV7h23rIk8O+jkNYKPsSvHiS
         23J3OxR6NdQT0e3t5s1ISqxXEdAiETyitBomw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: marcel@holtmann.org, padovan@profusion.mobi, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, sjur.brandeland@stericsson.com, socketcan@hartkopp.net, urs.thuermann@volkswagen.de, socketcan-core@lists.berlios.de, sage@newdream.net, ceph-devel@vger.kernel.org, wang840925@gmail.com, jlayton@redhat.com, kaber@trash.net, pekkas@netcore.fi, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, samuel@sortiz.org

I changed Makefiles to use <modules>-y instead of <modules>-objs because -objs
is deprecated and not even mentioned in Documentation/kbuild/makefiles.txt.

Also, remove some if-conditional statments because I used the ccflags-$ flag 
instead of EXTRA_CFLAGS because EXTRA_CFLAGS.

regards,

Tracey Dent

