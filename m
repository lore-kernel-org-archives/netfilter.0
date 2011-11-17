From: Prashant Batra <prashant0100@gmail.com>
Subject: Linux kernel IPSec processing when acting as gateway
Date: Thu, 17 Nov 2011 22:23:08 +0530
Message-ID: <CAG+XuE5V7QRg3O4zAySZHx8fOkD1EwE7COVNPYOTWetWPUgpjA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=bAxgI6UES+mQvx08D+QVx4zANNjiCrVEwvWkJfGbwj8=;
        b=a/1RSMhUkgZlhWLwv84pWhjqlQr/h1pb9ZwRI0XWtwYD6QnjndLG7PW+YG2zYjEWHU
         aFX4VQIB1+vbfxL6mXwAu7IUREPJWUQKRm98WqKacInzz2J1LYjO8mATDEcgm/HL4oHI
         P+VM1+EMDgq1dgQjKD6I13rhyVDyR0IwE8Ugs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hello,

One basic question related to IPSec processing on gateway.
I have established IPSec tunnels between two gateway (gw1 and gw2). On
gw1 I am using Linux kernel IPSec (a normal linux server which will
act as gateway).
The SPD and SAD database on gw1 is-

gw1#ip xfrm policy
src 172.16.80.1/32 dst 0.0.0.0/0
       dir fwd priority 1024
       tmpl    src 198.168.68.2 dst 192.168.101.101
               proto esp spi 0x00000000 reqid 0 mode tunnel

src 0.0.0.0/0 dst 172.16.80.1/32
       dir fwd priority 1024
       tmpl    src 192.168.101.101 dst 198.168.68.2
               proto esp spi 0x00000000 reqid 0 mode tunnel

src 172.16.80.1/32 dst 0.0.0.0/0
       dir out priority 1024
       tmpl    src 198.168.68.2 dst 192.168.101.101
               proto esp spi 0x00000000 reqid 0 mode tunnel

src 0.0.0.0/0 dst 172.16.80.1/32
       dir in priority 1024
       tmpl    src 192.168.101.101 dst 198.168.68.2
               proto esp spi 0x00000000 reqid 0 mode tunnel

gw1#ip xfrm state
src 198.168.68.2 dst 192.168.101.101
       proto esp spi 0x010000b8 reqid 0 mode tunnel
       replay-window 32
       auth hmac(sha1) 0x00c530455c9b7a4f3ed3824220a4c05e8b5edf97
       enc cbc(aes) 0x03d8c8ac752c2a9c4745f1a25a9f7da9
       sel src 172.16.80.1/32 dst 0.0.0.0/0
src 192.168.101.101 dst 198.168.68.2
       proto esp spi 0x00007aa1 reqid 0 mode tunnel
       replay-window 32
       auth hmac(sha1) 0x8d05b76456c9a52b51b6193f01c48a2fc27ada48
       enc cbc(aes) 0x75d062288ccb7355b0b8358f83323dd9
       sel src 0.0.0.0/0 dst 172.16.80.1/32

Now I am trying to send data from host1(behind gw1) 172.16.80.1 to
host2 172.16.60.1 which is behind gw2.  But gw1 IPSec is not
processing the packets-

host1#ping 172.16.60.1 -I 172.16.80.1

gw1#tcpdump =96I eth1
13:58:03.648171 IP 172.16.80.1 > 172.16.60.1: icmp 64: echo request
seq 1 =96 plain icmp packets
13:58:04.647301 IP 172.16.80.1 > 172.16.60.1: icmp 64: echo request seq=
 2
13:58:05.647116 IP 172.16.80.1 > 172.16.60.1: icmp 64: echo request seq=
 3

Please correct me if I my understanding is wrong.

Also, if the question is not appropriate for this list, please point
me to the correct mailing list for Linux kernel IPSec.

Thanks,
Prahsant
