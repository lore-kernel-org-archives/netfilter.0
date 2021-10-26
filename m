From: pupilla@libero.it
Subject: capwap protocol nested header
Date: Tue, 26 Oct 2021 16:54:32 +0200 (CEST)
Message-ID: <352502450.203840.1635260072685@mail1.libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1635260072; bh=zaaj/zlPqerW0rUMJVvZz08IZCa/ImvltBxuEFl3vgA=;
        h=From;
        b=b0DxNl2d9UjCmaKH5E9019466LI80//OIjrgOHZsiVrmfZNy5vk3BhGqkmfKf1Y/J
         F3X6x+a7DAtxp4CxlcwFKJsZWP1Vp/TIoydQlxTR0wY45NzRZApQ1oX1Z2rp7rc/DP
         3mRx9r3guYbBvT16Y+UMJ5xGpEokDp69QamilaAG7swFaPC1l6eIllsRhlngZUCcgV
         iIPPMJdcbmL+aVQPDkVaFf2lIBkYqgir/R5/nSQ3mPdCTvhbqX4DtThg7Z1/+t27NL
         B7aLy8/BfBtjnUoTpfg+mDh2rLAGy5AQoFY6fuypfYa6/UmYTYbi0sEK/hshG130oL
         GCsN/F8z3s9Zg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello everyone,

I would like to know if it's possible to mangle a
packet like this one with linux netfilter (linux
kernel 5.14 or 5.15).

My goal is to match the innermost ip header
(23.200.208.68/10.18.102.237) and then change the
mss of the tcp packet.

Frame 48007: 1450 bytes on wire (11600 bits), 1450 bytes captured (11600 bits)
Ethernet II, Src: LcfcHefe_32:48:cf, Dst: HewlettP_da:f5:07
Internet Protocol Version 4, Src: 10.18.46.63, Dst: 10.18.153.156
User Datagram Protocol, Src Port: 5247, Dst Port: 5248
Control And Provisioning of Wireless Access Points - Data
IEEE 802.11 Data, Flags: ......F.
Logical-Link Control
Internet Protocol Version 4, Src: 23.200.208.68, Dst: 10.18.102.237
Transmission Control Protocol, Src Port: 443, Dst Port: 52500, Seq: 2753105, Ack: 1818, Len: 1316

Is there any way to do this?

Thanks in advance
Marco
