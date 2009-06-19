From: =?windows-1252?Q?David_Bala=9Eic?= <xerces9@gmail.com>
Subject: Re: TCP simultaneous open using iptables NAT?
Date: Fri, 19 Jun 2009 10:50:30 +0200
Message-ID: <9948385e0906190150p3e735fa5jf8f9179e5f5e93e4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=qhDdIIbRHIlW/6z4ru6hwHYm2CnyIRSFxLemgRJpwps=;
        b=aYoLCjJmrMAfaIGiVCulSfTv62eI2LlKLK3IoO4yrRbT1Gzfrj4KQwFGr8qLPvaUpA
         23qpv+JYHY79GuLdqa1tsK1yLM18IKlzoec0f3a1hKicLk76MPsw7OoPSXkQYtC9xIpx
         yQn9rL0+jctlD8/88+vCQIYhDtDnQyvdtqRn8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hi!

First, sorry if this message is not threaded correctly. I am sending
it with gmail and beng new to gmail, I haven't figured out yet
how to make it inject the correct In-Reply-To header.

Second, I did some simultaneous open tests myself, and succeeded
making such a connection between varoius NAT-ed and
firewalled hosts.
Including two winows PCs both behind a linux router using iptables.
One was running OpenWRT 1.0 (linux 2.4.30) and the other was a Linksys
WRT54GL running some version of linux too.

I took a few tries (manually running "nc --local-port X remote.host
remote_port") that always succeeded in like five seconds.

The routers were out of the box, that is the deafult iptables
configuration for NAT.

Regards,
David
