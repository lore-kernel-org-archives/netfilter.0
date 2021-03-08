From: Ameen Al-Azzawi <ameen.azzawi@gmail.com>
Subject: IP MASQUERADE isn't working properly
Date: Mon, 8 Mar 2021 22:00:40 +0100
Message-ID: <CABcvXqJmjvSG5anjZYFGBUfoQyFLZSTPfnzHLkpQse9eGufn1w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ez+K5rQKCIbIMORLCAePaq+NWmA6pEWHYeQCCKrenEw=;
        b=cxWOs0781a3cKN2hT0JR3L5A7F34VCD1fXz1O0RT1JFtZFnwGxkrxN6ySBOjQAOyoy
         mQcuAYsZ2SUjjEdzfS10fhFVx6B5UvJXIYwX5xGQ3/k+AFRKd30JWxHImhRqgLalGpTg
         subsNJ6c2Y6C02lUlsT1mIDyP31aurMHnnflaiGNT5HbvKXxsKY8iD3VKGJFxC5QoITX
         NTYvhUNv3YciPID7pxyaVioIGXONv4UpdZdbeucsRdTQC6eRS8I4RXXuUdw5gmC/CKYO
         vSZ2tj3xfTLkbDRIiRjjxMqPN7qKJbPQkx8CkkPG4jkkc1A0ANSUJgxrZCZwOUFnVH8J
         Ilzw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello,

It's about IPv6 transition technology.
The topology is available through this like:
https://drive.google.com/file/d/1_1SMCXUJOYr0nguT-0wVvwyDz-ewfxTT/view?usp=
=3Dsharing

I am testing an attack with hping3 command the clients on the left
side of the topology to the IPv4 server on the right side using this
command: -

hping3 -S  -p 80 198.51.100.2 --flood

On PLAT (nat64 translator), I applied the following iptables command: -

iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE

The masquerading isn=E2=80=99t working for some packets and the source IP
isn=E2=80=99t changing.

tshark at ipv4 server still shows some packets with their original src
IP addresses, as shown in the snapshot from the link below:-
https://drive.google.com/file/d/1WFMmmg-lqEesbUYZltb4KJQ4NibkgEJr/view?usp=
=3Dsharing

The infrastructure is based on 464XLAT technology proposed by T-Mobile
in the US.
the software within the translators called "TAYGA".
Any help would be appreciated.

Kind Regards
Ameen
