From: Amiq Nahas <m992493@gmail.com>
Subject: Multiple labels with connlabel
Date: Wed, 26 Aug 2020 15:45:12 +0530
Message-ID: <CAPicJaHyWhrz8VxZ8tfpSUNcc_KPSF-cHUPYe1JmGwxroAFX8A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ox/s5MvB/KAZhC7cGyLsFmTZHTAo3zNE9dujsBv8Bu0=;
        b=qXZ9rMPlxDE+hkhhiSKadBePGESFu047rL2KgdRxnDOWNcKLn/vUVV6rD3ZYWbBOLh
         eXtnC+QrbuwF8n6pyIogn2D+0v/OU7cM91Djb8S+OSV/rnVc1OTE19QHPC4ts7CSUoNd
         BfD44sKCj3sPd32ACTnudcCwt0xNJmy3KlnKlWhTVcRvX88/wBXEWDbPU7bea3WFjWlT
         W735ioHYEwE+WiSvFc2lZ3+vaqkxXlM2+OekM2KU9O+8Uzbs2dq3MIQFeZpn4LpvZnSq
         Kc7tHXdFxsFxTWo+vpmQJ+bv1nFv1QSY1APPapOU1DwnKR85nYN9z+aVdId/9sX+Z1HX
         QMXw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Currently this can be done
iptables -t mangle -I PREROUTING -m connlabel --label portforward

What if someone wants to use multiple labels? One would have to write
this same rules several times.
Can we do something like this:
iptables -t mangle -I PREROUTING -m connlabel --label
portforward-something-somethingelse-...

This way multiple labels can be used with a single rule. Is this
possible to do, or is there any workaround for this?
