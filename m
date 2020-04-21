From: "Steffen Heil (Mailinglisten)" <lists@steffen-heil.de>
Subject: ARP confirmed timestamp update on TCP data flow vs keep-alive
Date: Tue, 21 Apr 2020 14:46:07 +0000
Message-ID: <0a574e4d27c441a6aa501bf6828c0267@exchange.sh-solutions.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sh-solutions.de; s=s1;
        h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:To:From; bh=9Oqz3NfswElILYBpdmIcCObEGuiMTY3wBW6FYiCwCZk=;
        b=ic2HPROR154OcyjRnoftJgfRM06+De1PtdCTxC3gaJO6UPMNpkt0eTe16bLl+4BHDUsf/XLvCF89mHVwRjINUIvQE4O9uHraHSNPCmmsRkndOd6VBG2rmios3svSgMrqTcsHXRHiERKHL+h76JWufXHvdNdgacGayzy493x0CJM=;
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi


I have a question regarding confirm timestamps in the ARP table.
If this is the wrong place, please tell me.

For established TCP connection with data flowing, the ARP table is updated,=
 such that (for some time) no further ARP requests are required for later d=
ata packets. (Observed on a live system, and read here [1].)

This seems to work only for payload data, not for TCP keep-alive.
Is there a way to update the confirmed timestamp as well, if TCP keep-alive=
 packets are received?

I already have a TCP keep-alive of 30s for thousands of connections, but no=
w I also have ARP requests.
I know that I could modify base_reachable_time_ms (which I am already doing=
), but there is a trade-off of not detecting stale entries versus sending t=
oo many requests. If the keep-alive packets would keep the ARP entry alive,=
 I could keep a low value for base_reachable_time_ms.


Best regards,
  Steffen



[1] https://stackoverflow.com/questions/15372011/configuring-arp-age-timeou=
t/15511117#15511117
"the kernel will sometimes change timeout values based on positive feedback=
 from higher level protocols"
