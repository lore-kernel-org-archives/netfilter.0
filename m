From: Glen Huang <heyhgl@gmail.com>
Subject: Re: Surprising CONNMARK behaviors
Date: Fri, 25 Sep 2020 13:15:11 +0800
Message-ID: <C642BC11-B9CF-466E-A9D1-AB94B3063F30@gmail.com>
References: <F216D666-8926-4A68-AC69-C8E0EDD3A43F@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.6\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:content-transfer-encoding:mime-version:subject:date
         :references:to:in-reply-to:message-id;
        bh=b4tUPNZfiJkrmhYP1+MR8Bkk1HaiWYzQYBpQ+bo1X1k=;
        b=SUibmsdlR9e/ZSjwxIsG7O/iD5zhxpqFGlPq7ZnY6Z+XnRU9OnHXqrR8M143AQF2Ln
         5a4jlOR7RCIOrgRb/uEtQzF+4LOAmEygAPQD2+s0fvXR/AI5KfTQrSFJ+876P+0l9eoh
         d4R3fwT6tw+1uDzC+ZNP2OZ5nxKDjpNHOaRDClCkW0kxqsi1QI+HZfwzO/XYYJXGgUxu
         oexyLCt7By+FMFHtnqcrQsA49iauY3/ZVfs9Cy10JHEGzcvkklqDtuRcJ5aw77w2KslY
         /9sSSOeMaUaosdPSKmkcYoiaNzYrnE/pzgqAEk0FRvu2nfQ7tGmU8zsJj8YM/sozd7yR
         E2bA==
Sender: Glen Huang <hey.hgl@gmail.com>
In-Reply-To: <F216D666-8926-4A68-AC69-C8E0EDD3A43F@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Never mind. It didn=E2=80=99t work because internet responses also went =
through PREROUTING.

> On Sep 25, 2020, at 11:55 AM, Glen Huang <heyhgl@gmail.com> wrote:
>=20
> Hi, all,
>=20
> I have some CONNMARK rules that only partially behave as intended. I =
think either my understanding of how CONNMARK works is wrong or the =
packets I=E2=80=99m sending are idiosyncratic. Would really appreciate =
it if someone could shed some light.
>=20
> I=E2=80=99m trying to create a transparent proxy using nginx that =
functions as a tcp load balancer. Whenever a client connects to the =
proxy, the proxy sends to/receives from the upstream server using client =
IP as the source/destination IP. So so that the client IP shows up in =
upstream logs instead of the proxy=E2=80=99s. It=E2=80=99s done using =
nginx=E2=80=99s "proxy_bind $remote_addr transparent;=E2=80=9D =
directive.
>=20
> I got it mostly working by making the upstream server send responses =
to the proxy:
>=20
> iptables -t mangle -A PREROUTING -t mangle -j CONNMARK --set-mark 100
> iptables -t mangle -A OUTPUT -t mangle -j CONNMARK --restore-mark
> ip rule add fwmark 100 lookup 100
> ip route add default via 192.168.1.1 table 100
>=20
> And having the proxy capture these responses:
>=20
> iptables -t mangle -A PREROUTING -p tcp -s 192.168.1.0/24 --match =
multiport --sports 80,443 -j MARK --set-mark 100
> ip rule add fwmark 100 lookup 100
> ip route add local default dev lo table 100
>=20
> Where the proxy has the IP 192.168.1.1 and upstream servers have IP =
range of 192.168.1.0/24. Only http and https packets are routed for =
testing purposes.
>=20
> The reason for using CONNMARK, is because I want upstream servers to =
also be able to access the internet. Only responses should go through =
the proxy.
>=20
> My strategy is to set connection mark when packets arrive from the =
proxy to the upstream, and copy that connection mark when upstream =
responds. When the upstream accesses the internet directly however, no =
connection mark should be set, because the packets are generated =
locally, they shouldn=E2=80=99t go through PREROUTING, and thus without =
connection mark copied.
>=20
> This setup works perfectly when a client connects to the proxy.
>=20
> But when I run "wget http://google.com=E2=80=9D on the upstream =
server, the command never returns. According to tcpdump, the upstream =
first makes a 3-way tcp handshake, which behaves correctly, the proxy =
doesn=E2=80=99t see these packets. But once the upstream makes the =
actual http request. The proxy sees it, and also sees the continuing =
resending of PSH, ACK packets to google.
>=20
> I have no idea how that could happen. That looks like the locally =
generated http requests have fmark on them. The proxy and the upstream =
live in docker containers (that joins the same created bridge network), =
which I=E2=80=99m not sure if is relevant.
>=20
> Did I miss something or I should not use CONNMARK?
>=20
> Regards
> Glen

