From: "Paddie O'Brien" <paddieobrien@gmail.com>
Subject: conntrack -E problem
Date: Mon, 20 Apr 2009 16:01:48 +0100
Message-ID: <3e67fcb10904200801g76ccdea8jde758f5f5c3a6276@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=61PAnqb6Ecuz4dB6Exwt+0qNXw6/m67mIlHI4gFKZuM=;
        b=lMV1ZKcRxGby9IPzEZfd9D1PTmVWzxvxeuXtxGEysDemd6m/7y31eEcZZSBbmD4QA8
         tZId9bMt8JiBee61pq1U2neMw37aV4jPIqBXZKOagUSP9xfJRjgOnOpJ1oyjOAvROf9/
         fG/2SLevyL/Bu7pKSky6xtpswFpGhfxHYHyUg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I asked iptables to log all inbound connection attempts:

iptables -I INPUT 1 -d myipaddress  -m state --state NEW -j LOG

I then asked conntrack to report the same events:

conntrack -E --event-mask NEW -d myipaddress

I assumed the above were equivalent but conntrack
does not report the same events as iptables, it seems
to miss unsuccessful connections.

I'd be grateful if anyone could tell me what's going on...
How can I get conntrack to report everything that iptables
does?

Thanks,
P
