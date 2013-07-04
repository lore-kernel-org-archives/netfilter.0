From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: Understanding --tcp-flags option
Date: Thu, 4 Jul 2013 20:09:17 +0800
Message-ID: <CAJZVxRkQmbFdi32VRu7jg4aoJoYgQmhjfMoGii5u-Jai_dAvHg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=/p7V7MavdZmvcuizpbnLYYlFdLpxCsBbAJ41NYh/Br8=;
        b=dIHpUheMzDDXIGj5O+0lzGDhET7dNA0w8y+F3Bfahd2pC+FTD/72w0R5NOxVf+Nj6H
         +v1ocj8hrYnhxr91FXnBcCX+qvC+hyM62fKZ9mdUAZDSOSqBjcJRhS/oq+1NSUWGkRi5
         jqBsYiAFumfH5SOqKb8cg+jftmPJ6qbuPvEVex72OA7n1MVCQh5Bfb37qDVT1qGl4WJi
         a5+BOWTF6VJ1UCdU2ViZN6+f9KAIZlMcPUvzJDUAgp0FxwYeVlQCgK9bWj6wnl8AtQwj
         lnb8cJJa0J4HWex1eCXMnyDoOKArGqSRgvcZMdB/M0aUjSw/bUUv/CXlrl8J3MvhRQ+U
         D2ZQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@vger.kernel.org>

Hi,

How should I understand --tcp-flags option?

1) There's two parameters, why need two of them?

e.g I might just need to match a packet with SYN and RST bit set,
 why do I need to place it for twice (--tcp-flags SYN RST, SYN RST

2) What does this mean? I don't really get what "mask" and "comp" do here

--tcp-flags FIN,SYN,RST,PSH,ACK,URG FIN,SYN

Thanks!

--
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://keyserver.veridis.com )
Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
