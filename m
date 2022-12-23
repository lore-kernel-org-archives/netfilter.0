From: yves baumes <ybaumes@gmail.com>
Subject: netfilter flowtable software offload
Date: Fri, 23 Dec 2022 17:35:10 +0100
Message-ID: <CAF1Qswj+MEKhb3i7xZuK+XvWw_7wTQdiTezPWuH8XQ-tjjUMsQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SbWnNTAr7Z0WSuKGQ6PY7dxshRbID0G8xYdgOSoXMbM=;
        b=kniW4o17qNNf9deExFk48dRk/DNPrLG0JK2SsFO5WFDT8UwItsFBljkPPZYQw1znoF
         QJBASuwp9b5Kzo7aYWSTOlrL54qq/UV3tlJ04rT0lXnVTQbdjSP+nGqEWfl/NzCkK4vd
         J4W7gHFJUlT1ivohhPqx4G/O3znc4jNYZbF8jV1fg1EH6a67CwM3TqzXrxMLPvndoGja
         DlSxpb2KuHTW/Q75N6nMRawEoe3t94LaaT3AjcqR4iv+eFgCMSGre1kj1erO0FQ7amRl
         HDSAMrORakNRFlOAghm77ro6iYNiqmDsEp+2VLVOiFC1X9cDwIRfskT9puo8QTm7Xe5g
         uMZg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello all,

I have a few questions about the netfilter flowtables to offload
traffic. https://wiki.nftables.org/wiki-nftables/index.php/Flowtables

1- Does QOS (Cake) is being applied even in the case of fastpath? The
documentation states that it passes anyway through the neigh_xmit()
function. Does this function applies QOS? (I would prefer that it does
apply QOS in every case).
2- Is there a way to remove an entry from the flowtable? Or to
flush/clear the flowtable? Or to put some timeout to entries in the
flowtable (so the flowtable removes an entry after this timeout)? It's
actually quite important for my use case, to be able to remove a user.

Sorry in advance if my questions are not clear. I am not fluent in english.

Regards
Yves Baumes
