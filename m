From: =?ISO-8859-1?Q?Bj=F8rnar_Ness?= <bjornar.ness@gmail.com>
Subject: cluster match and ipvsadm (not connection tracked)
Date: Mon, 15 Apr 2013 10:29:48 +0200
Message-ID: <CAJO99Tm4q3+RWheV9q9psvQ6dtL7sRLihGKA6w2epPEAKUVbfw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=+rN9NMp5mIE8g5tJ2jGHiT5woAi5B2mK5X6gYWWHoS0=;
        b=Pqs4kVZ0LW0/izJ4Kc470pcCNOxrhP8TEWXP44gSeFjDvGNOTsgqS0aYHKUO8jChXF
         TRHf9LCYIGfbbOxGJdkCLRxINB64eNozv9yis1mkIbkg3FiaZueyWd2CXopqR+b6P+OM
         Jr/shJZLQU6Pb1Yrhf8x2LF3zCZTk5xsRBjgc7df2ZTYdoGr4LGom/m55213kfc7EoO5
         7i/3CC7VgKQ3ah7xuMNdpb6o3wnulZiKzBUb3pNf2voptyxK7PZcr0r5/WHiUTVsacLh
         HHm51h3RW/0WMR+iWa8uCfjbD/xkKOa17f02XlnpbWCi6WxujZNDH2mghTareA1zytC6
         O5TA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am experiencing problems with a active-active gateway setup, where
the gateway(s) also
act as ipvs load balancers.

This problem seems to be caused by ipvs not doing connection tracking
(connections handled
by ipvs is not visible to conntracktools atleast), the following happends:

* gateway nat's (ipvs masquerade) the correct packets to realserver
* realserver gets packet
* reply packet gets dropped by --state INVALID -j DROP match (not tracked)
* I remove invalid drop, but gateway's still drop reply packets
* seems this is caused by the following lines of code in xt_cluster.c:

xt_cluster_mt(const struct sk_buff *skb, struct xt_action_param *par)
[...]
    ct = nf_ct_get(skb, &ctinfo);
    if (ct == NULL)
        return false;

    if (nf_ct_is_untracked(ct))
        return false;

Is there any way to make this work without code modifications?

Best regards from Norway,

--
Bj(/)rnar
