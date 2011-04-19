From: Daniel Nilsson <gnuffel@gmail.com>
Subject: netfilter acceleration for sun neptune, intel 82599 or the like?
Date: Tue, 19 Apr 2011 12:31:38 +0200
Message-ID: <BANLkTikNO7t8qzqbz+tkOZseOPAMA73mRg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=Jv1/oPJbjpWRd9MSWrmZlj5AeA4QOyNqybU6I3m+D0s=;
        b=NpWJ3IxZnQAnIH97RiTKgxaRvmKJ9mXoT9EMT21dsnf9LP7DaYpGClSr2cVvf62oIE
         ny4TzHjnb3JKlfvlmyCwN/U7YlWoDp7ysGSlYKu6ncMsnjuaB3aM1wpUI7g9LzepHeD8
         NdOpPaf3EDhs+pnvo85YgVYs5ad6/3m948VZA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Is there any implementation of any functionality in netfilter that
exploits the possibility of performing flow classification on L2-L4 on
NICs such as Sun Neptune or Intel 82599? Features like the possibility
of performing QoS-aware routing etc?

/Daniel
