From: Hariharan Thantry <thantry@gmail.com>
Subject: Steep drop in throughput using NFQUEUE
Date: Tue, 22 Nov 2011 11:35:47 -0800
Message-ID: <CAC3Ot8jOMTghEFynF-+CkMOgdBNPJix+v+W2wMnAQmP8g6=wtA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=YbzRUq39GMSp7xHfBec0a0M8SebyFm9w33CpOacVjM4=;
        b=ImMYDpVycoVgw3PFsrGupkiDadk9l0PNFB4tRK43f5Csr028RtWeHNM+XZMF2DIYe3
         I1rbglMXsLXu1OTBas4Q3iKyvXdqZ0/FC8fjDUltgpFwo3w/uMrZALb8Vk6TnBJHpjDA
         hpbBzCl6JEH1+wDJwm+NexbZqNfCWvxGcahMo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi folks,

I'm trying to setup an IPS infrastructure using Suricata. My setup is
the following:

Machine A (Client): Regular Desktop with one dual ported 10G 82599 NICs
Machine B (Bridge, hosting Suricata): An entry level Xeon with 2 dual
ported 10G 82599 NICs
http://www.newegg.com/Product/Product.aspx?Item=N82E16813131725
Machine C (Server): Regular Desktop with one dual ported 10G 82599 NIC

Note that the machine hosting Suricata is a ___pure___ bridge (no IP address)

The forwarding performance of the bridge with the single 10G
connection active is ~9.5 Gbps (almost line rate), while with both 10G
connections active is ~ 13 Gbps (no tuning).

While trying out Suricata as an IPS in this setup, I noticed a steep
drop in the forwarding rate. The single 10G connection speeds dropped
to ~ 400 Kbps.

The Suricata machine has the following rule setup:

$ sudo iptables -A FORWARD -j NFQUEUE --queue-num 0

To see if the drop in the rate was independent of the Suricata stack
or not, I ran the example program from here:

http://www.netfilter.org/projects/libnetfilter_queue/doxygen/nfqnl__test_8c_source.html

and noticed that the speeds are the same as above (~400 Kbps). With
COPY_META, the speeds increased to ~ 2Mbps.

Is this steep drop expected? Any suggestions on what I could be
missing, or how could I optimize it?

Interestingly, using ebtables, and its user space handler

$sudo ebtables -A FORWARD --ulog-nlgroup 1
http://ebtables.sourceforge.net/examples/basic.html#ex_ulog
kept up with the line rate, which was rather surprising, because even
that handler involves a copy to user space.

Any suggestions would be appreciated.

Thanks,
Hari
