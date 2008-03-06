From: "Ling Deng" <lingwsm@gmail.com>
Subject: Prioritize packets at user space
Date: Thu, 6 Mar 2008 18:00:35 +1300
Message-ID: <7b4d898c0803052100x75f7d47fv53059b19ded04e48@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=AuFuTPHQXWexe1NtlA3+8Z0ngfsMIJGB/y353VBz8mk=;
        b=bB313YKhirViQmkeW+73/oBJsVsPIOozfUtm78oqtI6BNH2+h8RcFr+YOWSHGEBmCBcPXMQSbXiHIlPRQONaxb0ClbGo//bIBlL9fOK3/eP2GdWjJ8IGvjx2/gEyHgn/piDrl6PQOSTAGAvq2eBZ8uG4P4BsUl1KAFXEV8lP1p0=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi there,
    I am doing a project on VoIP security. I need to implement a
Application layer gateway on top of the linux firewall. But I have no
clue how to do it, I hope someone can help me with it.

    The current firewall uses IP_QUEUE to pick up a packet,
authenticate it, then do something with the packet, and forward the
packet to the server. However, IP_QUEUE only has a single FIFO queue
(is this correct?), if the system is under a flooding attack, this
firewall can't help to reduce the effect of the attack.

    I want to add a priority on the firewall. To prioritize the
packets, deep packet inspection is needed, then packets need to be put
in different queues depending on the caller and callee numbers.

    Could anyone please give me some suggestion on how to make this happen?

    Thank you very much,

        Ling
