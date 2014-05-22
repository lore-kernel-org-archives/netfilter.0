From: Varun Sharma <vsdssd@gmail.com>
Subject: traffic distribution not happening on centos 6.5.
Date: Thu, 22 May 2014 09:47:20 +0530
Message-ID: <CAFat2-in==r06CBXUWBafo-hfJMJ7VRw8sd8R0sqFqdnZ6etJA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=jQ9yK1xbI3q+tesZH1oF+AE81Gq0b6ih+mRMWF6Y3GU=;
        b=l/5GZ7sCMWYopqIFW9V/8RR4Aadokp8u83AyYUv59MBp35NOIED6vMw974exWHmGuU
         FN6m0VJmia/a02tF9fYdqKO7Fnp+BipFVqNQtlF8TfXzkJDSlX0yqBA519R/643dPk8K
         3ok1PXVPx8gMFmib+fKR2T+ZZ2zIAdEn2+7kBWfRzHWvn7SyL5FE1hLdgEDL0C4wxO+b
         if3+QPG4Gr1Y1DnMVA6PfbtoB9nt4R6/RsSGCgbgWAQ6QN7QJoFXfoLttCyKDh/Ay/fX
         OkpABTcrlIgjUI/73Wsyht60oSe0B38Hgv/774Zp6nYpB//8int8SLoX8stI/d7YBzSM
         rxwg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi,

 I am using nfqnl_test.c code available on netfilter org. I have
generated two binaries (queue0 and queue1) using that nfqnl_test.c
sample code.

These binaries are working as per expected behaviour in case of Centos
6.2 but with Centos 6.5 only one queue is receiving network traffic.

I am not able to understand why only one queue is receiving network
traffic in case of Centos 6.5 whereas same network traffic is being
distributed in both the queues with Centos 6.2.

uname =E2=80=93a:

Linux hwcentos8 2.6.32-431.el6.x86_64 #1 SMP Fri Nov 22 03:15:09 UTC
2013 x86_64 x86_64 x86_64 GNU/Linux

Command used for iptables in Centos 6.5 :-

iptables -A INPUT -j NFQUEUE --queue-balance 0:1


Output In Centos 6.5 :-


[varun@exp2 ~]$ ./queue0

opening library handle

unbinding existing nf_queue handler for AF_INET (if any)

binding nfnetlink_queue as nf_queue handler for AF_INET

binding this socket to queue '0'

setting copy_packet mode

pkt received

queue0 hw_protocol=3D0x0800 hook=3D1 id=3D0 hw_src_addr=3Dfc:4d:d4:d3:7=
f:73
indev=3D2 payload_len=3D40

entering callback

pkt received

queue0 hw_protocol=3D0x0800 hook=3D1 id=3D1 hw_src_addr=3Dfc:4d:d4:d3:7=
f:73
indev=3D2 payload_len=3D40

entering callback

pkt received

queue0 hw_protocol=3D0x0800 hook=3D1 id=3D2 hw_src_addr=3Dfc:4d:d4:d3:7=
f:73
indev=3D2 payload_len=3D40

entering callback

pkt received

queue0 hw_protocol=3D0x0800 hook=3D1 id=3D3 hw_src_addr=3Dfc:4d:d4:f1:e=
1:5f
indev=3D2 payload_len=3D78

entering callback



[varun@exp2 ~]$ ./queue1

opening library handle

unbinding existing nf_queue handler for AF_INET (if any)

binding nfnetlink_queue as nf_queue handler for AF_INET

binding this socket to queue '1'

setting copy_packet mode




Please let me know if more information is required.

Regards
Varun
