From: Mathieu Ruellan <mathieu.ruellan@gmail.com>
Subject: nftables support for cgroup v2 filtering by path
Date: Wed, 18 Aug 2021 12:36:43 +0200
Message-ID: <CANsv5MQYbEeFg1J+MO6EO-ZWLbsy-Ro3B3PWTfzpKK7L3FxBrQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=GrRJl1tp5+UCeeEA4YVkLeshZt/c8XV1OMWHcuQ3wH0=;
        b=LGUOEb82F6PD9wLv5u9mblNpijKfbLYv9BImxTCjqwDm0PVBB8tNTPnBnAvPHpWwCZ
         l0nrc7GjleC9J42dsZYkM3azWpSmw3MkgoEs72SlIR35JnO5b+t2+JiotOmr79pe8Tlc
         pB3gRcFYpygZuyOrbJRfMfeRRHeAb0bSI8K1RyP/XoysYtgYOtJ61qxu8cc7pkf4pZj+
         ieCOrj73eIm79rhl97VDyzMXNIVGbIlQxZDYSD3qiq26nY8RpCMeJzL11LPbJi6eks6/
         o8Z2h2ol+29Z3vOvj3fa4wW6Vhmj85RaGsISm/G1gbzxSNJ2ANk7iBe7tqi7TnXEnmV3
         66qQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I'm facing the same issue than here:
https://marc.info/?l=netfilter&m=161896252706060&w=2

I'm using the last release 0.9.9. Is there somewhere a documentation
or a syntax example?

Kind regards,

Mathieu
