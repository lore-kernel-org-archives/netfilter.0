From: "Jorge Bastos" <jorge.decimal@gmail.com>
Subject: help on tc with kernels >= 2.6.27
Date: Fri, 2 Jan 2009 18:46:18 +0000
Message-ID: <37b3b63f0901021046n40962c84mef64cab10153261e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=6r1ZKhQPtdXA6esSUsQ6hzV2ActxNGjT2JPx/WkOPvc=;
        b=gZeoBZ6FBbZRs5DMvIadjc02A3r3fxTGl541on29QXHkpC17Rl72K6cm7QlrlvVYb2
         xk5/72zDm8oK2xUdQoCXUkdH8k1DTz2prn0tPlrKGcqwvzANMKfec5QveYudRsnku2ZP
         yh2wHERe5UdsmLATGbuLHxuqOalr0JPH9wxXY=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
I just joined the mailing list.
I'm using tc to do traffic shaping for about 6 years

Since kernels >= 2.6.27 it just stoped working, and started shaping
traffic to 1/2kb /sec.
How could this be debug? I don't see other place to request for help
other than this one, and I was adviced to ask for help here too.

Thanks in advanced,
Jorge
