From: Cristian Constantin <const.crist@googlemail.com>
Subject: integers byte order in netlink/NETLINK_NETFILTER messages
Date: Fri, 17 Sep 2021 10:45:30 +0200
Message-ID: <CANCV4NPXskt-r4RNfQJeacoOAmKFjuV6CSKtqEe=gyCbpiZMaQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=a5mEMnxv1TazVzOwYUHd4+IkOJd+7B/JPZ+7ksKfAQ4=;
        b=hXcIBc+szgnqBDAQcWWX2V2JjztOd+u18BdiOlhYsWEJkHTWuuxrb942kFIVejwCcy
         SDWlKnUTGp8/Pj5NUSxb0d5V7GSgMz4RWbTZf/eC0EL2Fhgw5isfSJecRhqn9dC3rea9
         43b7/7gszXhfHo4Nxiu6pqX8ByGNJvy+ynI7O9AOzUIeUPULTbrzimbjv04cn3ts0RdF
         Ojt4Qypvu3fhPIHK/NQe7jdSIaOWmik/mEaAclKMb3cXcCQJgymJFyyGVoJnA0Nd7wmy
         iQS2AQqgVYLX4838o2w9IW+mnSuxz76M0DIgG9CHpotbGanX/UBcXFw5zFuTgDo1jdxa
         yYKA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

hi!

in general, how are the integers encoded in the attributes of the
NETLINK_NETFILTER messages: host byte order or network byte order? is
the same byte order supposed to be used by both user space tools and
the kernel?

in particular, how is the chain policy attribute encoded by the kernel
when it sends an reply to a NFT_MSG_GETCHAIN request?

thanks,
cristian
