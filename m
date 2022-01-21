From: Jerome Barotin <jbn@s4e.fr>
Subject: How to understand causes of invalid state for an OUPUT SYNACK
 packet
Date: Fri, 21 Jan 2022 12:23:32 +0100
Message-ID: <20220121122332.1501d9ba@glazard>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=s4e.fr; s=google;
        h=date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=NHajWdO7oRrNqSWfZH29E+nkenJh1RPMqlSDq/tMku8=;
        b=RoR2mxBY/au76gnJ4Yx36oeHPlcO/cE6U8WZwQNuSIZf61AHgmDeYlMdImOVj/OZMk
         IYD/xgaZCepUSprZLmFke/Ds8IsnYsq/Y9VZX0MI3ckiiu17fGpFSgx/7JbwW/QjFcz7
         2gTc1ybzXKprvuKw2upJScQJ8yWJhpZThgqqw=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello,

I've got a specific device (industrial computer) where its
TCP connection are always blocked by netfilter when it tries to
connect to my server.=20

Exactly the SYN packet is forwarded to my local process, but, the
SYN-ACK answer is always tagged as invalid by the conntrack
module,=20

I noticed this behaviour in the following line in kern.log :

Jan 14 11:26:15 myhostname kernel: [260283.271861] nf_ct_proto_6:
invalid packet ignored in state SYN_RECV  IN=3D OUT=3D SRC=3D10.1.1.4
DST=3D10.1.1.3 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DT=
CP SPT=3D21
DPT=3D64004 SEQ=3D1624381780 ACK=3D2190670817 WINDOW=3D64240 RES=3D0x00 ACK=
 SYN
URGP=3D0 OPT (020405B40101040201030307)=20

The corresponding pcap file can be found here :
https://filebin.net/yazmmekhrdiu4dh8/capture_not_work_ano.pcap

Also, I do not understand how this connection could be in SYN_RECV
conntrack state. This state means that SYN-ACK packet has already been
received and I'm sure that no such packet has already been submitted.

I  also checked with conntrack -L that there is no phantom states
before trying to establish a connection with the client.

It happens for a specific client, on each of
these connection, otherwise the traffic is working very well on the
machine for all the other clients. I tried different Linux
distribution (kernel version 5.13.0-20-generic or 5.4.0-96-generic), and
my packet is always tagged as invalid.

Do I miss something ? Anybody has got idea to help me understand (and
fix) this case ?

J=C3=A9r=C3=B4me
