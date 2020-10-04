From: <kaskada@email.cz>
Subject: stress testing 40Gbps linux bridge with Mpps - is HFSC a bottleneck?
Date: Sun, 04 Oct 2020 21:10:38 +0200 (CEST)
Message-ID: <470.aV0}.7jC2N9{WtZf.1VUXuk@seznam.cz>
Mime-Version: 1.0 (szn-mime-2.1.10)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=beta;
        t=1601838642; bh=DyXI41m3boHHWSRw/w4Gjr57kmOk2fKCOR7yBdUXIs4=;
        h=Received:From:To:Subject:Date:Message-Id:Mime-Version:X-Mailer:
         Content-Type:Content-Transfer-Encoding;
        b=Nyp8RlEBRprQLh4NZUUUZ3o+1kmYgihpMdtiUdjbk4sOnWTLVok5oUOHYFxlase9c
         yQaUD7L5DFHv0Q7HX+jZbyMwX1glYc+LUKCKma9UUWi8/Bshlmc5hrtp2AH7TERB4v
         i+WMDMbjHv7KkpPABRSkvIk3exBbElj25dZHju2c=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,

I have three multiCPU servers connected in a row. ServerA --- serverB --- =
serverC.
All of them are interconnected with 40Gbps Mellanox X5 PCIe v4 cards with =
optical MPO cable.

All servers are multicore beasts with two CPUs, all of them have HyperThre=
ading off.
- serverA (16 Xeon cores) is sending iperf3 traffic (small packets 
created by lower MTU 90B set on 40Gbps port) to serverC (32 Xeon cores)
- serverB (128 Epyc cores) is setup as a linux bridge

Server A is able to send around 20 Milions of iperf3 packets (Mpps) to ser=
ver C through server B (no iptables/ebtables rules)


Problem is when I add HFSC config, even simplified as much as possible, to=
 a 
40Gbps port on tested server B. Speed in packets drops down to some 2,6 =

Mpps, while CPUs are nearly idling.

This is the HFSC config. It is just a minimalistic config -=C2=A0 I`m look=
ing for 
HFSC/linux bridge/... limits and I narrowed the problem down to this:


# root qdisc a class:
qdisc add dev eth0 root handle 1: hfsc default ffff
class add dev eth0 parent 1: classid 1:1 hfsc ls m2 34gbit ul m2 34gbit
# default qdisc a class
=C2=A0class add dev eth0 parent 1:1 classid 1:ffff hfsc ls m2 34gbit ul m2=
 34gbit
=C2=A0qdisc add dev eth0 parent 1:ffff handle ffff:0 sfq perturb 5

--> all iperf3 traffic is passing th default class ffff, which is expected=
 
in this testing setup (so no filters/iptables classifies/ipsets are not =

necessary)
--> this is enough to have just 2,6 Mpps instead of 20Mpps...

What I`m I missing?
Thank you.
Pep.

