From: "Richard Hartmann" <richih.mailinglist@gmail.com>
Subject: (Ab)using iptables to record byte count per IP?
Date: Fri, 9 Jan 2009 12:27:10 +0100
Message-ID: <2d460de70901090327y625afd60g792467e843d3f1d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=vO9PBtno23ESkvBc23hISgXnPFo0T0r2og4JpsJKLko=;
        b=bgNllvH33eaQzzp7Ujxewi63Nh7+686RR5+rAV9XWjTlzHfFsFgvVF1AlLJPBF/5kW
         YSMCIx6erTRPnUhWq1Kx4/g3nVtzd0kwIt9B9zahDK6E5+0JzYcNab1H/q9e2NWo0snK
         wInriYXLuaywdbRvykD28yZy0MCFCsAoN+nug=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I need to log the traffic each local IP in a NAT'ed network generates
per day.

Unfortunately, the environment is rather restricted and compiling new
software is not an option. Thus, I am wondering if I can abuse iptables,
which is in use anyway, to log for me, as well.

The end result should be a log which contains IP, date and traffic
generated. I don't really care about the output format as I will perl it
into the format I need, anyway.


Thanks for all input,
Richard
