From: Stefan Majer <stefan.majer@gmail.com>
Subject: conntrackd high cpu usage
Date: Mon, 9 Jan 2012 19:49:55 +0100
Message-ID: <CADdPHGu4WFrVantzmr6rn6jvPkoxmxPMdOrPzSkRYKMbbtZWKQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=Pu752M6CzGlme3SEYDObqBq7VayP3EtlxguGzRss34s=;
        b=GItqNj7NwwSlCUTmU8m4IRIMlMObH1LYmDvQ0O9CBrl90fT/UoXwnhLgDexwOcVC93
         qTvHxQuv3Vmf5ALVsFj2OiHhVtKhsaU14pZ0Ngkcmyi3kcM1n1zGAsd9yPC1JHlcIUZ3
         //muCxOHbmgfafFcNqjar9eMu3YMEia/75Wms=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

we have 2 8core Xeon Boxes with 2 Intel X520 10GBit Adapter running
rhel 6.1 as redundant firewall.
On every node we have conntrackd installed with a FTFW mode, we
synchronize all states.
Synchronization is made over multicast on a dedicated vlan interface.
The Firewall itself actually have around 300 vlans active.

Actually we see permanent ~400 new connections/sec with peaks at 800 conn/sec.

With this load the conntrackd consumes about 15 - 25 % CPU from one
CPU on the active side and about 5% CPU usage on the passive side.
Is this expected ?
This is our Testing environment, and we expect much higher (~10 - 20
times) connection rates.

This would not be possible with the current setup, as this would be
cpu bound on the conntrackd, as this daemon is single threaded.
Is there any way to make this process faster, eg. make the
synchronization multi threaded ?

I already did some perf analysis, but they didnt gave us much light.

Any ideas, hints welcome

Greetings
-- 
Stefan Majer
