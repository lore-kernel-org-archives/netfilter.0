From: rohin kumar <rohinkumars@gmail.com>
Subject: NF_DROP/NF_ACCEPT -- TCP retransmission
Date: Tue, 1 Sep 2009 20:30:45 -0400
Message-ID: <ceb65aa00909011730g3d85372fx55fa40018b71f04a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=WWM/zwAAG1wmB/sh6orfNHBl+C9i5AVFwrT9flz6gM8=;
        b=VuYEA2kH+w43z1XajJE4569rXEntSyu2Pu0QUqAw/QUXbykYqCH68zEVvecq7rdG76
         238WTZ7IzbAm7COYDxANKps1vdv/lIlKo2dzStOCHcB8im4kSIZwehmU5QQ/hmq2hKDI
         2wG4txmebR0QRCckLMM9L04bHPWmCrLjdfSHc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,


In my netfilter hook, I am creating a new broadcast packet and
dropping the actual unicast packet. I have tried NF_DROP and NF_STOLEN
to drop unicast packet. But Both times I can see the original packet
in wire shark along with the new broadcast packet.  There are no TCP
dup acks from the receiver side before unicast packet is sent. Does
netfilter frame work informs TCP about the packet drop  and because of
that TCP is sending the packet again ? Or else the original packet
itself is not dropped.


Following is the  code line where I defined nf_hook_ops.

static struct nf_hook_ops trm_ops = {(struct list_head) {NULL, NULL},
(nf_hookfn *)trm_hook, (struct module*)THIS_MODULE, (uint8_t) PF_INET,
(unsigned int)NF_IP_POST_ROUTING, (int)NF_IP_PRI_LAST };



When I receive packet in my hook, the packet has  TCP and IP headers.

Any help greatly appreciated.



Thanks

Rohin Sudini
