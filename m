From: Elison Niven <elison.niven@gmail.com>
Subject: Cannot use iptables with kernel 2.6.30
Date: Thu, 22 Apr 2010 16:28:12 +0530
Message-ID: <g2g21df6cb71004220358y9a5f23f1w1b7795a90fae82e2@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:content-type;
        bh=vmhUwC1NDBWH+LCREUQQ2WKmf/ni983Bx5YzGYAf/Kc=;
        b=qOFAWZRVv4/8wZogHld7LRTHAumnFc5YzPHN8hmhSMdOqqLU2fTtlninRaQcMLFccr
         ut8lEbdunQDKlgl5g1MVf8mAoza2edRFdxms/Gm7pr28x+yNetqpxxeFOK1EGvpEcGLl
         pwJnI335V3FrQ9OrjjzVNQu/qNq1b6sWYTqXU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi List,

I am trying to install iptables on ARM platform running linux kernel
2.6.30. I have enabled all the netfilter modules as enabled in the
kernel.

When statically building iptables-1.4.7, I get the following error:
# iptables
getsockopt failed strangely

When I build it dynamically, I am able to run iptables:
# iptables -h
(displays help)

However, When I try to apply any rules, It says:
# iptables -F
Can't initialize table filter.
Perhaps iptables or your kernel needs to be updated.

This is strange because I have enabled all the netfilter options in my kernel.

I also tried using iptables-1.4.4 and iptables-1.3.8 but am not able
to run iptables.

Searching a little more, It seems to be the bug reported here :

https://lists.linux-foundation.org/pipermail/bugme-new/2009-April/021618.html

However this patch that claims to solve this is already applied in my
kernel and I still get the same error:

http://marc.info/?l=linux-crypto-vger&m=123924457316022&w=2

Best Regards,
Elison
