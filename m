From: Ferric AU <ferric.au@gmail.com>
Subject: Map Port Range to Another Port Range
Date: Tue, 17 Jan 2012 16:15:58 +1100
Message-ID: <CAJPQRbmJ0Gem5bGV_BpTgdMp-gFfhu9VKSaRC8DLJLEkCRCLJg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=rPB97NLDqnI7SGGFXxtDUETel/Ik2+V1rEnn4NYKuwA=;
        b=qbMIkhpR7Ue6u6W4TxILYc69P97r1692QSptujSY/4tq2pJpQ6CqhWNN1LC/mLT8x3
         xNaBQZXfUtR7iOibsYIsWzlGVg5VnZBwfpjVw0LND/sRXPE6cJOxHurVEiMuWt1ZaegH
         FR3Tke3Th5OGq9tkbEUD+d0ctayQphTti7HvM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am trying to directly connect two linux PC's running Ekiga with SIP.
This requires UDP in the port range 5000-5100. Unfortunately this
range is blocked by the modem hardware (VOIP phone) +/- my ISP.

What I would like to do is move traffic on ports 5000-5100 to
6600-6700 (1:1 map).

This would mean:
PC1 output from Ekiga on ports 5000-5100
IPTABLES (PC1) converts to port 6600-6700
Transmitted over network and past VOIP modems
IPTABLES (PC2) converts to ports 5000-5100
PC2 receives into Ekiga.

I know it could be done with 100 individual DNAT rules, but think this
would be prohibitively slow.

So far the best I've been able to come up with was;

iptables -t nat -A OUTPUT -p udp --dport 5000:5100 -j DNAT
--to-destination :6600-6700

but this sends ALL ports (5000-5100) to 6600 (just the one port).

Any suggestions on how I could do 1:1 mapping of ports?
