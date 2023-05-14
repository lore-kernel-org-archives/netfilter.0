From: Glen Huang <heyhgl@gmail.com>
Subject: Why tproxy to 127.0.0.1:port doesn't make packets go through the
 input chain with iifname lo?
Date: Sun, 14 May 2023 15:24:03 +0800
Message-ID: <B4205731-F80B-4A87-B932-8749C51A06FB@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684049048; x=1686641048;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/d1AzqLU2nY6S79RHs2wc5lZDiE6rAH+SsBMRSCdPE=;
        b=pJPwkfCSxQLnHGMTn5O/+vxhtdXY8xEDoeLqynKZ6BYA2LHKBnKskZqFiZosGwwET0
         D1f9qY3Sov9w8gQYlIAVmfp+oQURJomDoHiHTCkkkyPfZoIzpGo0U44BpDFw2cPT8+Aj
         K7eXEfuO7XDiiSHBLrjBUJb9Q1epgqoTED0XANbf68fJLnMOthYGtGMdKqPCdjbNIzce
         SGplzcVtqX37p6QMZowTvtjfLmH/TEePQTDn5Rtvc+xkWj7YbL8VZIf9nJpzT3jM48GW
         NHc9MDnfhbD3Hvd/EW1etG89rGVBBOfQD+9YfyznjUKnGXBneSUDojmaL43qy5VvreSh
         j7Cw==
Sender: Glen Huang <hey.hgl@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org
Cc: ecklm94@gmail.com

Hi,

I think I mostly understand how TPROXY works, thanks to M=C3=A1t=C3=A9=E2=80=
=99s super helpful article [1].

However, I still don=E2=80=99t understand how the "to address:port=E2=80=9D=
 part work. Given this rule:

nft add rule nat prerouting iifname lan tproxy to 127.0.0.1:1234 meta =
mark set 1 accept

And this policy based routing:

ip rule add mark 1 lookup 100
ip route add local default dev lo table 100

When does a packet arriving on =E2=80=9Clan" get redirected to =
127.0.0.1:1234? Is it before or after the routing decision? It seems it =
should be after, but from trace, it shows that the packet goes through =
the input chain and its iifname is lan. Since tproxy redirects it to =
127.0.0.1, shouldn=E2=80=99t it be =E2=80=9Clo" instead?

I wonder what the flow chart is like? My current guess is that packets =
arriving on =E2=80=9Clan" first get routed to =E2=80=9Clo", because of =
the mark and the policy routing, then tproxy redirects it to =
127.0.0.1:1234, but again, this is probably wrong given iifname being =
lan. I also wonder do <addr> and <interface> have to match in "tproxy to =
<addr>:port =E2=80=9C and "dev <interface> table 100=E2=80=9D? What the =
flow chart is like if they don=E2=80=99t?

PS: In my case, lan is actually an XFRM interface, not sure if that =
matters.

Could someone offer some pointers? Thanks in advance.

[1] https://gsoc-blog.ecklm.com/iptables-redirect-vs.-dnat-vs.-tproxy/=
