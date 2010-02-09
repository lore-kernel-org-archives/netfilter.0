From: "He Jiafu-MPNB73" <JHe@Motorola.com>
Subject: Default server DNAT port remapping problem
Date: Tue, 9 Feb 2010 14:33:39 -0500
Message-ID: <83EB8CF7119A7C47A6425E352065A72B071F83D6@ct11exm64.ds.mot.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, guys,

I've got a problem creating default servers using consecutive DNAT port
range mapping.

Suppose I have a router with a wan (say, 1.2.3.4) and LAN (192.168.1.1)
and another internal server (192.168.1.100). I want to setup a couple of
default servers to forward the wan access to ports 80-90 towards the
internal server ports 8080-8090. I want the port mapping to be 1:1,
i.e., 80 -> 8080, 81 -> 8081, ..., 90 -> 8090.

I tried the following rules:
    # iptables -A PREROUTING -t nat -p udp -d 1.2.3.4 --dport 80:90 -j
DNAT --to 192.168.1.100:8080-8090
    # iptables -A FORWARD -p udp -d 192.168.1.100 --dport 8080:8090 -j
ACCEPT

However, the results are pretty inconsistent. In some cases, I got
shifted mapping like
    83 -> 8080, 84 -> 8081, ...
And even out-of-range mapping like
    80 -> 8091, 81 -> 8092, ...

Has anyone ever seen this before? Is this working as designed or a bug
in the NAT code?

Any suggestion?

Thanks in advance!

J.

