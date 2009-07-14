From: Simion Onea <simionea@gmail.com>
Subject: Re: Forwarding packets over the same LAN
Date: Tue, 14 Jul 2009 16:06:08 +0300
Message-ID: <1247576768.7214.42.camel@TestField.intranet.bem.md>
References: <1247493655.2316.104.camel@TestField.intranet.bem.md>
	 <1247494451.25529.52.camel@enterprise.ims-firmen.de>
	 <1247558286.7214.16.camel@TestField.intranet.bem.md>
	 <1247574465.30915.31.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=o45eufGTAdt600Dg1PUcPDr5abH/Bh5CtVbBDKGSBcI=;
        b=C2xW2iPYwDeQ4kHxO7k51y4g0E1SxyM7jZgYMJo5UaYM9/f8z0KiGj0kaCRxEBDmUo
         fBWJ2NbXOp0HgEjeV2a/4gyR8o6HdXs2sfkiIzDiMXfwZUNjn7bdJxTBcRi6NyVEms0i
         vzoDtd66XfStGeyhIXGiFmmq9BD6kv5z0Ld+Q=
In-Reply-To: <1247574465.30915.31.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

On Tue, 2009-07-14 at 14:27 +0200, Thomas Jacob wrote:
> Is eth0 your actual interface then? This was just an example to give you
> the general idea, of course you need to adjust that to your case.

Yes, certainly. The interface is eth0.

> Maybe you could post the LOG output from the rules below here, so we can
> see what's wrong

I tried to connect from a host with the address 172.20.2.40. 
Here are the log lines of 172.20.1.245:

Jul 14 10:48:46 pro kernel: PREROUTING_before:IN=eth0 OUT=
MAC=00:13:72:fc:1d:e5:00:13:21:e7:e8:00:08:00 SRC=172.20.2.40
DST=172.20.1.245 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=4621 DF PROTO=TCP
SPT=1749 DPT=10025 WINDOW=65535 RES=0x00 SYN URGP=0 OPT
(020405B401010402)
Jul 14 10:48:49 pro kernel: PREROUTING_before:IN=eth0 OUT=
MAC=00:13:72:fc:1d:e5:00:13:21:e7:e8:00:08:00 SRC=172.20.2.40
DST=172.20.1.245 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=4624 DF PROTO=TCP
SPT=1749 DPT=10025 WINDOW=65535 RES=0x00 SYN URGP=0 OPT
(020405B401010402)
Jul 14 10:48:55 pro kernel: PREROUTING_before:IN=eth0 OUT=
MAC=00:13:72:fc:1d:e5:00:13:21:e7:e8:00:08:00 SRC=172.20.2.40
DST=172.20.1.245 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=4691 DF PROTO=TCP
SPT=1749 DPT=10025 WINDOW=65535 RES=0x00 SYN URGP=0 OPT
(020405B401010402)

Regards,
Simion.


