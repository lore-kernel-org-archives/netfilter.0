From: miranoko <miranoko@gmail.com>
Subject: cross-compile mips iptables segmentation fault on some commands
Date: Thu, 1 Jul 2010 11:00:22 -0700
Message-ID: <AANLkTilp04X5REt5yyWrlzoUiWQx_OQU2v79VOXa0rzf@mail.gmail.com>
References: <AANLkTikF1V4vXmLn6FlbdSnr9MMa0qgfa9BWkLajfJoO@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type;
        bh=KAai23RxdYt4a5ScA3F8SzKncc+cWp8vmAKvN9J3QjQ=;
        b=GjpvT2WR691zC2+GSFYowDnsbpo0Nw9i8gApJGqHGdgONrXui6AY3GJTqc9nmsB6m6
         rM2hC1LVjqAYUjAudUQdTgpxsBRrFq3XCXE83nyl/D0hI/iZpelqteVFHzcEE2QiPduX
         b5eMcHhWI7Czjm71pI/FpRauiOEop2yH48eSo=
In-Reply-To: <AANLkTikF1V4vXmLn6FlbdSnr9MMa0qgfa9BWkLajfJoO@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I cross compiled iptables for mips architecture and tried running iptables.
when i do input accept or drop it works.
but when i do iptables -A xyz it produces segmentation fault.
other commands iptables -v and save,restore work fine.
Please let me know what i am doing wrong. what logs should i be
looking at for this.

/ # iptables -P INPUT ACCEPT
/ # iptables -P INPUT DROP
/ # iptables -A I
Segmentation fault
/ #

/ # iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination



Thanks.
