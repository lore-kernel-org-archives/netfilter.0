From: aft <aftnix@gmail.com>
Subject: Tcp socket read error if packet changes in NFQUEUE
Date: Wed, 5 Aug 2015 20:17:52 +0600
Message-ID: <CAGuaRCsK-Ki1OEyJH8QVbMZh0gK2VUv_H2-Neg-2_sndC9cDdw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=hpYQHKgMNRlce2Sdn0nzVQtCH1Qhd8jqGBGnnIGxwW4=;
        b=CuZtxEmMBtiI90kEpWmPeq8wFOKPVKecGR/YM+6OXudeyTfJ/akgMbGUvW4A+HCdvx
         D6BseuYqmDe31gqx0HtCWeO00pvDkopIyloTxXjEqs2vadsfAfCV/hzkYqpNslJyoYLs
         jTbiT7aDG/RKYQPOGfMjX/rO3t0S0tqf77O8OqFKn+qK/yfUH1FWaTwrDjyPMVzuxW+p
         +YfPRlvfM3/k+JIt/wdtuyZw6BCuQ02UHNUpWXFNw7YH96xNPf/88L9w8bB95TqExTod
         7NmXoaNxmTVm2EGh9B87ralkhRbaTAV7lx+70UqTegaCULmHHz1CjOeRGkG7EBttw2Hr
         qFCA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I use certain packet mangling in a NFQUEUE and recalculate the
checksum. This works fine when traffic is light(Traffic is a TURN
packets). So when turn session is initializing, things works fine. But
when the traffic goes up, that is when TURN starts relaying packets,
it turns out the turn server is not reading tcp packets off the
buffer. We use "coturn" as turn server. "coturn" uses libevent2 to
handle socket events. We observed that when media packets,
encapsulated in STUN packets, starts flowing, the libevent2 buffer
starts reporting that the size is increasing without bound and no
packet is actually relaying. That means, it fails to read off the tcp
socket.

What's the explanation for this bizarre behavior?

Thanks in advance

Cheers
