From: Aaron Clausen <mightymartianca@gmail.com>
Subject: Multiple Internal Networks
Date: Wed, 25 May 2011 15:01:46 -0700
Message-ID: <BANLkTik71rCYn0hQ1CavBmDGo_1NtZX0aA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=n7jmiMa+T1XMTHIv9mptZsBhn12C3IoB61FPHTmnZm0=;
        b=kyAxQwnSB7G5+qF7K5EQxercmH1a8LY1/qDU1XOwOSnffCTg3fTbites8YkP2z1N4O
         sXBIXrhNf3hUojDRPCyuQ8ZEUxI4ouAwR+utNQr0V7bwG0sbukuDBaAaD+c6YTVfZgYk
         f7Y+2utmwZxIUFYLzILah16HpyWEUDNPwi/TI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I just can't wrap my head around this one.

What I have is a router with three interfaces:

eth0 - External interface (IP address retrieved DHCP)
eth1 - Internal interface (trusted) - can access Internet and anything
on eth2 network
eth2 - Internal interface (untrusted) - can only access Internet

What the heck is the iptables commands to get this to work?

-- 
Aaron Clausen
mightymartianca@gmail.com
