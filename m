From: Bradley Kite <bradley.kite@gmail.com>
Subject: nfq_set_verdict
Date: Fri, 21 Sep 2012 14:38:40 +0100
Message-ID: <CA+JxU+5mE7cYFR53HZwwOMLhB9Ho1C4+eTrs81Z2r0yy6Yh=4A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=6a5/x5VemfgiwOo6JOwPNoBf1T0jBx+veVPlzstEphQ=;
        b=pHwYi8ozmBcNKjuriLJrumnwfI3uaA637hpJpHeqDrZYSZ3NCsgDoD2JgeAHEfzNtk
         2S8CbTcb32W13b4qjVanee+iMLOqQayiukdBekXrVInkP/PrQ99W44S/ZKICKRZpDOn9
         lhkIWIIMIy555Dfu1NL6aXQI2BKdkfVbvLpAuQfE3LgVMlK/fASz/oIdjj1aXOJ+DHo3
         W33S9qkeRukiiq3/g76sh9bMgQKmohUDEkzUz6tJDtu8wup67lEkLlNfgv/xOJiyhmR0
         BfUZSi2WylqbXM66ah87tBnxV3ldiLDEJLZaDAV6qLVNxy7RPKLGSEpuVuZbgcqtdtLj
         9k+A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I am trying to introduce a delay to specific packets using
libnetfilter_queue, but do not want to affect the latency of others.

So far I have this working by storing the packet info (id etc.) in a
queue and not issuing a verdict within the callback called by
nfq_handle_packet(), but rather in a different thread that calls
nfq_set_verdict() when the packets are ready to be sent.

This seems to work OK for a short period of time (a few minutes),
after which performance seems to become really slow, with nothing
displayed in "dmesg" or any thing else.

The documentation, states "Every queued packet _must_ have a verdict
specified by userspace".

Does this mean that the verdict MUST also be issued within the
nfq_handle_packet() callback, or is it OK to delay the verdict and
call it outside of the callback?

Any clarification would be appreciated - or perhaps someone can point
me in the direction of the right way to introduce delays to specific
packets in this way?

Kind Regards
--
Brad.
