From: Varun Sharma <vsdssd@gmail.com>
Subject: traffic distribution not happening on 40G ethernet card.
Date: Mon, 5 May 2014 15:09:37 +0530
Message-ID: <CAFat2-h0n=Cuka0-UPjE3tyL1dU13bwF-D_fRTZ+c2AQq9Q5_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=x3Oy2nSZ5/rLJKJH3yyi6ZiXWu83vnAaxLj5Ue+Il5k=;
        b=nPq7DMS97S3YyyYE0RdlXkvs9P8T/igkqdyxEAGTk2PkOvnFYJK9Bhy5uXU7+1SF6Z
         d+ur/KuziRXEn+xhl40WrF/WJRLmgKRXpxtyZ24HayDYQbVMmfvjaqOmMVDpJaZ/D10n
         RxapxG9A7amHNzdjjRwNA6AYnn81LZK2xZfE4RlU27+77CEUNVH8rOh+18LlOyeIV8l+
         ktDZ+2TdfX10O03mI61i61WorArDlb+sK9vtYK6yDfoIVS2NOv9CM5Z+xKLpVT8oubNL
         MpZvGgKj87KYovqi/LTjudvMKLuBuA9M5HJejGzfIWXP8/iO+rhvlP9PYMxHNDEBu2v2
         7CgQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi,

I am using nfqnl_test.c code available on netfilter org. I have
generated two binaries (queue0 and queue1) using that nfqnl_test.c
sample code. These binaries are working as per expected behaviour in
case of 10G Ethernet but with 40G Ethernet only one queue is receiving
network traffic.

I am not able to understand why only one queue is receiving network
traffic in case of 40G Ethernet whereas same network traffic is being
distributed in both the queues with 10G Ethernet.

Machine configuration for 40G Ethernet:-

kernel -: 2.6.32-431.el6.x86_64

libmnl-1.0.3-4.el6.x86_64

libnfnetlink-1.0.1-1.el6.x86_64

libnetfilter_queue-1.0.2-1.el6.x86_64

Command used for iptables:-

iptables -A INPUT =E2=80=93i eth4 -j NFQUEUE --queue-balance 0:1


Output:-

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
