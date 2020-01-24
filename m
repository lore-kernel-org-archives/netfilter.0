From: Felipe Arturo Polanco <felipeapolanco@gmail.com>
Subject: Policy routing Docker host not forwarding return traffic if marked
Date: Thu, 23 Jan 2020 23:15:21 -0400
Message-ID: <CADcj3=43fXMNcOhJrJM7w5Hd8FAKEKUo=dJ0XFePA3Lt7uDeDQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=lA8U3JZ80HC6ZHsWi8cE1E01DOT2LX6tE1JGTju9wwA=;
        b=cJAviFNn5bCc55D1K1R16mxpRL0sKXBMllB6PRxI3/fXvklGTceeXhvxEikRnjdS+c
         5jSgC1HxoWgGczgWuhBjIwh3n4vvOIoymkJjKlokH+jdhKV/zTASIRX80vwtYziRC8iH
         FRYBLK0lraeQ3eLHpOMVD7EJ1i6//Lus6fP0FsIi8JhVVSoXiSEafWYGEBbkAMrK6yib
         34IOnsrSzyknFXzwMRqF6X0u+vw1fx1J6WC8jjUAMIDGtiYKBGyR1vdFz+lZlH2wTH4H
         974Uf3vgKaO12/kx3kujLGVwO1njiZ8nhcrE9uTv35hTrSfnMY4DHOz/O0viS/KDGrMd
         oOsw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

NETWORK INFO:
Centos 7 Kernel 3.10

Container IP 172.16.0.2/16
Host IP 172.16.0.1/16
Host public IP 100.64.0.10
Default gateway 100.64.0.1
Host VPN IP 10.8.0.2
VPN peer 10.8.0.1

COMMANDS USED:
iptables -t nat mangle -A PREROUTING -s 172.16.0.2/32 -p tcp --sport
80 -j MARK --set-mark 1
ip rule add fwmark 1 lookup 100

VPN ROUTES, def gateway
ip route add 0.0.0.0/1 via 10.8.0.1 dev tun0 src 10.8.0.2
ip route add 128.0.0./1 via 10.8.0.1 dev tun0 src 10.8.0.2

# routing table 100 for container return traffic
ip route add default via 100.64.0.1 dev eth0 table 100 src 100.64.0.10
ip route add 172.16.0.0/16 dev br-0123456789 table 100 src 172.16.0.1

Hi,

I'm hitting a strange situation where the return traffic of a
container is not being forwarded on the host.

I set up a point to point VPN connection on the host and make all the
traffic go to the VPN peer.

I also have a docker container listening in port 80, docker port
forwards the host:8080 to container:80 and it works
I go to 100.64.0.10:8080 and I see the container website.

The problem happens when I start the VPN and now all the return
traffic goes out through the VPN instead of the default gateway
100.64.0.1, this due to asymmetric routing.

To solve this I decided to use policy based routing and mark the
packets that have tcp/80 as source and make them hit a different
routing table.

Sadly it is not working, according to TRACE messages, it last hits
MANGLE PREROUTING but is never seen on FORWARD, it just dies there.

I'm not sure if this is a conntrack issue, I clear the conntrack table
and the issue persists, I also disabled rp_filter and nothing.

Any ideas??

Thanks,
