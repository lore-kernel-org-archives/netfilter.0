From: Glen Huang <heyhgl@gmail.com>
Subject: How to trace IPSec packets?
Date: Mon, 29 Jan 2018 17:10:14 +0800
Message-ID: <2A246279-5BD5-4858-9E81-2132542CD4DA@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:content-transfer-encoding:mime-version:subject
         :message-id:date:to;
        bh=w7yVhMh3xcxJod+fzEuP/wlAH/4QgW8HhnKnzYFz/pg=;
        b=Wy8qsopjes2BeaPq1Da4+rIF75UpGAN7qGBgT92bKr85nd7Q1Xn1nMl0Qiw4uMlWKZ
         Fw2mwlSZvb4tu2YoC+sec4COWwnlXkr9ScIO8H8YziwjQyngnWJtB6A9RVomKyeFFejc
         e/uxvvCj/YTUC6uo/0ru0ZnsuWM1EB/RSV4nJP7Ju8hFpgrx2Ur0Vv6MM6nN7al+FFDD
         xxazPm7IZ6qL5xlD4RQuTRX+OomwURfwgh/+SW25UbcwxNGwRx7nf+pb9ZRRl2MnrF9d
         84mF83BtbZOrV7/EemLdFmlMRKiugScFkqWmgenjSBTUB3wYs2IRRtjE2yo0TMQcdo6X
         1M8w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,

Hope the question isn=E2=80=99t too basic to be asked here.

I have an IPSec tunnel set up between my machine and a server. All =
packets originate from my machine go through that tunnel and then get =
forwarded by the server. I=E2=80=99m trying to redirect DNS request from =
my machine to 8.8.8.8 to a dns forwarder running on the server.

I tried this on the server

iptables -t nat -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp =
--dport 53 -j DNAT --to-destination 127.0.0.1

But it didn't work. To make sure it wasn't because I hadn't allowed =
martian packets or anything. I tried to trace the decrypted packets.

iptables -t raw -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp =
--dport 53 -j TRACE

But after dig @8.8.8.8 google.com on my machine, running grep 'TRACE:' =
/var/log/kern.log on the server returned nothing.

According to this picture: =
https://en.wikipedia.org/wiki/Iptables#/media/File:Netfilter-packet-flow.s=
vg after decrypting the ipsec packets, netfilter will make the decrypted =
packets go through the ip stack again, and the trace target should be =
able to catch it.

I wonder if my mental model is incorrect or I missed something?

Regards,
Glen=
