From: Felipe Arturo Polanco <felipeapolanco@gmail.com>
Subject: How to forward marked packets with same local IP?
Date: Wed, 4 Dec 2019 15:40:58 -0400
Message-ID: <CADcj3=5Tv3bkMrgr4JLAi0fYiw4PO6caorruGNMGEjP3PFnwJg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Cdk+8QjslIIH6G5nSEJkAP8j0Ek9PprDJMPvK2oyNR0=;
        b=ci5gUt8T8M/4BWn8pNDXLc4oFD512gP9yL9Ea+gaFw3MQNZK+nizz56YMjpLy4BCk7
         UL/WfaJBv5ZGKRqOnFehmAEVB86reIxm3iJYVtO8qhxt/t2QzljUkob2TvioSe0dSnsB
         eeerblyj/TskohOutA8S1EzFsqhAOStxRUWTKteSKtFOQv4A8TQFR2oE6sWfMxjbAyeR
         0SbjxfifoLLifFo9av6q4Qm5nceY3IE5T6fMxRpHtv0yTDpfpDdE8hVJMZmOFyLiXk6e
         5SqTX2S0tIQN71RFxub5+w4od0/S7QLp1mntsOPh4FlNj5tc9rdN6V4/QKePxn4hkOix
         LkUA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I have a PoC that I would like to accomplish without doing NAT.

Basically I have a Linux_machine_1 and Linux_machine_2 behind a Linux_router_1

Linux_router_1 has public IP 100.84.10.10 and public IP 100.84.10.11

I would like to have both Linux machines to use both public IPs of the
Linux router.

I can do this fine using NAT but I was thinking about assigning the
public IPs as /32 to each Linux_machine and marking packets based on
the source MAC and then restore the packets with connmark-restore.

I tried this but is not working, the TRACE shows that the packet is
being ignored at the routing decision before being forwarded out to
the internet.

Linux_router_1:
[  +6.125394] TRACE: raw:PREROUTING:policy:3 IN=ens33 OUT=
MAC=00:0c:29:d8:c7:68:00:0c:29:df:17:df:08:00 SRC=100.84.10.10
DST=1.1.1.1 LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=28832 DF PROTO=TCP
SPT=33694 DPT=80 SEQ=376430434 ACK=0 WINDOW=29200 RES=0x00 SYN URGP=0
OPT (020405B40402080A0032AFC20000000001030306)
[  +0.000033] TRACE: mangle:PREROUTING:rule:1 IN=ens33 OUT=
MAC=00:0c:29:d8:c7:68:00:0c:29:df:17:df:08:00 SRC=100.84.10.10
DST=1.1.1.1 LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=28832 DF PROTO=TCP
SPT=33694 DPT=80 SEQ=376430434 ACK=0 WINDOW=29200 RES=0x00 SYN URGP=0
OPT (020405B40402080A0032AFC20000000001030306)
[  +0.000011] TRACE: mangle:PREROUTING:rule:2 IN=ens33 OUT=
MAC=00:0c:29:d8:c7:68:00:0c:29:df:17:df:08:00 SRC=100.84.10.10
DST=1.1.1.1 LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=28832 DF PROTO=TCP
SPT=33694 DPT=80 SEQ=376430434 ACK=0 WINDOW=29200 RES=0x00 SYN URGP=0
OPT (020405B40402080A0032AFC20000000001030306)
[  +0.000023] TRACE: mangle:PREROUTING:policy:4 IN=ens33 OUT=
MAC=00:0c:29:d8:c7:68:00:0c:29:df:17:df:08:00 SRC=100.84.10.10
DST=1.1.1.1 LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=28832 DF PROTO=TCP
SPT=33694 DPT=80 SEQ=376430434 ACK=0 WINDOW=29200 RES=0x00 SYN URGP=0
OPT (020405B40402080A0032AFC20000000001030306) MARK=0x2
[  +0.000029] TRACE: nat:PREROUTING:policy:1 IN=ens33 OUT=
MAC=00:0c:29:d8:c7:68:00:0c:29:df:17:df:08:00 SRC=100.84.10.10
DST=1.1.1.1 LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=28832 DF PROTO=TCP
SPT=33694 DPT=80 SEQ=376430434 ACK=0 WINDOW=29200 RES=0x00 SYN URGP=0
OPT (020405B40402080A0032AFC20000000001030306) MARK=0x2


Is there a way to forward traffic based on the pair IP:mark while
ignoring that the IP is the same as the local one?

Thanks,
