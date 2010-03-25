From: Ajay Lele <ajay.lele@gmail.com>
Subject: How to change source address of packets destined for the box?
Date: Thu, 25 Mar 2010 16:07:49 -0700
Message-ID: <bf5857901003251607w7b1ab8bcjbe03326f8a54ef9c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=bCc5Gte6runoK2gAX9B6bPUyI44y+mH1KqL29CJXtlQ=;
        b=pJOxFrI6J9sZB1hex6cOEgdhNMigjSTX/8R/33rqlyuSunDwofXyqF6XB8Tn3BDQQO
         BswFBfHe7+bc0LTvWis3L8LvundGKjoeOnVv462Bm+1QPyEcEcAbMyijIebpUeVAGP29
         D4FATdWpHFjetUPhZIzEc/AGy4kVH39qvSr+Y=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

For a peculiar VPN address management scenario, I want to change
source address of incoming packet destined for the box (inner IP
packet in the IPsec tunnel terminated on the box) to a certain value.
With iptables, SNAT can be configured only for POSTROUTING chain which
won't be hit in this case as the packet is destined for the box. One
option is to add a NFQUEUE rule in INPUT chain to queue interesting
packets to user-space, change the source address from user-space and
re-insert the packet in rx path. I want to avoid using this approach
if possible because of the inenvitable degradation in data rate
because of the trip to user-space, over-head of managing the
user-space program, etc. Is there any other way in which this can be
achieved?

Googling showed an old thread which discusses similar issue.. looks
like at that time there was no other way to achieve this. Does it
still hold good?
http://lists.netfilter.org/pipermail/netfilter-devel/2001-March/000717.html

Thanks in advance

Regards
Ajay
