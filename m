From: Steve Miller <stmille@gmail.com>
Subject: LOG target with console=ttyS0,9600
Date: Wed, 29 Jan 2014 09:30:49 -0800
Message-ID: <CAFs0UtY4de7uwhc8TgbO-P_Qy9cy-uGO0CY+Ancs17V6G4R-Cg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=m4toIKCS4AafoLJoDn/WKedEv7y19LDPNXkKwEg/uBE=;
        b=J2hyJfK0grZY2s7wT9fTKn2cvjGZZReNyT+zg6+Ml1KZM9kKqOaNwvmZ3KG/n/b63v
         cP9L8I1/eUko8pGseczc9b+SFOwfjj3GN7N4vVxw27eaSYaEGoS9E2TYDMQ08Pmz6aRJ
         fU6fJODTbKyA8n1XX8EbSPoa6E6GSFXWK5At/nlrXoh+3pCeUFcU/BZtA8pf3h8bCKTm
         KrLO0FmfBVMC+dPj5qAN9mQXP3xK/hfWTEyAaMXarXLhehnGuiEi/ZdjSTE2TBx4pJDP
         vIxXTXVMuHBDvItCUo0u3CoWCbMcOmbTHm0qf1RttUanl9V7J9eE5vi8HCUer9AX/TWO
         JcLA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi everyone,

We ran into some issues due to what appeared to be an non rate-limited
LOG target rule on our INPUT chain before the final DROP.  It looks
like that was set up to log to the console... no bueno!

We saw lots of connection and and system resource related issues crop
up when that LOG rule started getting hit repeatedly..  A hypothesis
was formed around the idea that iptables was getting backpressure from
klogd due to the slow writes to console.

This idea doesn't sit well with me... I really don't like the idea
that a LOG target rule (albeit configured mindlessly) can have such
catastrophic results.

Does anyone have a moment to speak about what may have happened or to
explain possibly why?

Thanks!
Steve
