From: Glen Huang <heyhgl@gmail.com>
Subject: Surprising CONNMARK behaviors
Date: Fri, 25 Sep 2020 11:55:07 +0800
Message-ID: <F216D666-8926-4A68-AC69-C8E0EDD3A43F@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.6\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:content-transfer-encoding:mime-version:subject
         :message-id:date:to;
        bh=zViagTplmdEmvy3SnaoW0TVdVCAuKWYJ5VtaxNlYHz0=;
        b=PjXtcn3ttbLFozXeaxrDwNICW1sTjCyGxmhiRRZD2Sau6RQ+XRxN5i0ifYSDzLGfdl
         bDZsLsWCd0m3EWOcFEpg92roOQQ9Xk8XFLOfrGac0a8g9EhGLqOKSDaHu8N5UP7eAwdV
         2d53IA7oDSl7X4OCQQQmGzMjNgtYCo6G+R2ElsS2i3O4mKVtGgsCGD7E0VhiNEYeooKl
         yII0J7ZLDYXaV9XIScNUSuXAmZFeNwEmb1Q/Akhq9MQwFbvYROiYNgEBnRCiBgHt6FqS
         OuuvWj7on9xHObklLq5dOrHOHKLHrwCLoaecl5PlXFiLWifM93STioI2+qVowB4tnBE/
         6ebw==
Sender: Glen Huang <hey.hgl@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi, all,

I have some CONNMARK rules that only partially behave as intended. I =
think either my understanding of how CONNMARK works is wrong or the =
packets I=E2=80=99m sending are idiosyncratic. Would really appreciate =
it if someone could shed some light.

I=E2=80=99m trying to create a transparent proxy using nginx that =
functions as a tcp load balancer. Whenever a client connects to the =
proxy, the proxy sends to/receives from the upstream server using client =
IP as the source/destination IP. So so that the client IP shows up in =
upstream logs instead of the proxy=E2=80=99s. It=E2=80=99s done using =
nginx=E2=80=99s "proxy_bind $remote_addr transparent;=E2=80=9D =
directive.

I got it mostly working by making the upstream server send responses to =
the proxy:

iptables -t mangle -A PREROUTING -t mangle -j CONNMARK --set-mark 100
iptables -t mangle -A OUTPUT -t mangle -j CONNMARK --restore-mark
ip rule add fwmark 100 lookup 100
ip route add default via 192.168.1.1 table 100

And having the proxy capture these responses:

iptables -t mangle -A PREROUTING -p tcp -s 192.168.1.0/24 --match =
multiport --sports 80,443 -j MARK --set-mark 100
ip rule add fwmark 100 lookup 100
ip route add local default dev lo table 100

Where the proxy has the IP 192.168.1.1 and upstream servers have IP =
range of 192.168.1.0/24. Only http and https packets are routed for =
testing purposes.

The reason for using CONNMARK, is because I want upstream servers to =
also be able to access the internet. Only responses should go through =
the proxy.

My strategy is to set connection mark when packets arrive from the proxy =
to the upstream, and copy that connection mark when upstream responds. =
When the upstream accesses the internet directly however, no connection =
mark should be set, because the packets are generated locally, they =
shouldn=E2=80=99t go through PREROUTING, and thus without connection =
mark copied.

This setup works perfectly when a client connects to the proxy.

But when I run "wget http://google.com=E2=80=9D on the upstream server, =
the command never returns. According to tcpdump, the upstream first =
makes a 3-way tcp handshake, which behaves correctly, the proxy =
doesn=E2=80=99t see these packets. But once the upstream makes the =
actual http request. The proxy sees it, and also sees the continuing =
resending of PSH, ACK packets to google.

I have no idea how that could happen. That looks like the locally =
generated http requests have fmark on them. The proxy and the upstream =
live in docker containers (that joins the same created bridge network), =
which I=E2=80=99m not sure if is relevant.

Did I miss something or I should not use CONNMARK?

Regards
Glen=
