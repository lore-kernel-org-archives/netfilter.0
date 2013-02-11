From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: Is it safe to use libnetfilter_queue in these cases?
Date: Mon, 11 Feb 2013 12:43:22 +0800
Message-ID: <CAJZVxRmmCeft+f-9wS4LbWzposct+3Ed5586E7opGa=xZKfyag@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=qfc2u48jSLiIzkBZd9Cj8mGXzSaWNMv3HdejPJGHdgQ=;
        b=LYOb+8BbZJIImFRZEZXnTJxYEoiLlACyxTu+2HGCmuPe6oQFN8qTSvTJ0yzzgeVP+V
         AqM0ix9gNYuIa/tnZoMGJjc/4mJ8uzWIN1QjHEpD6mkiMqobraJnq0STe3cs7MN34TTM
         cRzzNd5GIv8jm+/DsjAQdxE6If3JwOI8VvYIOoviSKHnH955z3ULjDhLHv4QOg55ZSnt
         8UZZJHZu2+JGdAt0Iiyubp9VsEGyq+eNz4AJ+rQo5Ay2VAVCmuDV2nWaCKi4QH7u4AUX
         EMEQzHxVgsixR0qRRxDIEmM+4mJtJKTv05OQUfiGHUrP0kX7Sgs7QYtV3YkLYxq0mHjh
         omRw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@vger.kernel.org>

Hi,

When I process a packet with libnetfilter_queue, would it be safe to:

1) Consider a packet is always valid, for example,

In the callback, you extract the payload to a "char *data", now you
want the protocol id, so you check data[9],

Is it safe if I don't check the package length first? (Would Iptables
drop it manually?)

-- 
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://keyserver.veridis.com )
Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
